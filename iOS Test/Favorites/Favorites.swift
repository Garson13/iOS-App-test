//
//  Faavorites.swift
//  iOS Test
//
//  Created by Гарик on 19.02.2023.
//

import UIKit

class FavoritesController: NewsController {
    
    var favoritesNews: [NewsData] = []
    
    private func setFavoritesNews() {
        
        guard let objects = try? NewsModel.persistantContainer.viewContext.fetch(NewsData.fetchRequest()) else {return}
        let newsFilter = objects.filter{$0.isFavorites == true}
        favoritesNews = newsFilter
        collectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setFavoritesNews()
    }
    
    override func configuration() {
        super.configuration()
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 30) / 2.1
        return CGSize(width: width, height: 190)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = favoritesNews[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! NewsCell
        cell.setValues(id: model.id, imageData: model.imageData, date: model.date ?? "", header: model.header ?? "", description: nil, isFavorites: model.isFavorites)
        cell.favoritesButton.setImage(UIImage(named: "inFavorites"), for: .normal)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        favoritesNews.count
    }
}
