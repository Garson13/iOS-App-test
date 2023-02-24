//
//  News.swift
//  iOS Test
//
//  Created by Гарик on 19.02.2023.
//

import UIKit
import CoreData

class NewsController: UIViewController {
    
    var news: [NewsData] = []
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 15
        let collection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        setData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if NewsModel.persistantContainer.viewContext.hasChanges {
            collectionView.reloadData()
        }
    }
    
    private func setData() {
        let context = NewsModel.persistantContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "NewsData", in: context) else {return}
        let fetchedObjects = try? context.fetch(NewsData.fetchRequest())
        NewsModel.newsModels.forEach { news in
            if !(fetchedObjects?.contains(where: {$0.id == news.id}) ?? false) {
                let object = NewsData(entity: entity, insertInto: context)
                object.id = news.id
                object.imageData  = news.imageData
                object.date = news.date
                object.header = news.header
                object.descriptionNews = news.description
                object.fullDescription = news.fullDescription
                object.isFavorites = news.isFavorites
            }
        }
        do {
            try context.save()
            let fetchedObjects = try? context.fetch(NewsData.fetchRequest())
            news = fetchedObjects ?? []
            news.sort(by: {$0.id < $1.id})
            collectionView.reloadData()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func configuration() {
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(NewsCell.self, forCellWithReuseIdentifier: "Cell")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = #colorLiteral(red: 0.5306391716, green: 0.6479418278, blue: 0.8934077621, alpha: 1)
    }
}

extension NewsController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! NewsCell
        let model = news[indexPath.row]
        cell.setValues(id: model.id, imageData: model.imageData, date: model.date ?? "", header: model.header ?? "", description: model.descriptionNews, isFavorites: model.isFavorites)
        let image = model.isFavorites ? UIImage(named: "inFavorites") : UIImage(named: "favoritesInNews")
        cell.favoritesButton.setImage(image, for: .normal)
        return cell
    }
}

extension NewsController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 30)
        return CGSize(width: width, height: 221)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = news[indexPath.row]
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailNews") as! DetailNewsController
        vc.news = model
        navigationController?.pushViewController(vc, animated: true)
    }
}
