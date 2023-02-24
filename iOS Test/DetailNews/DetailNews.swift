//
//  DetailNews.swift
//  iOS Test
//
//  Created by Гарик on 19.02.2023.
//

import UIKit

class DetailNewsController: UIViewController {
    
    var news: NewsData? = nil
    
    @IBOutlet weak var detailImage: UIImageView!
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var header: UILabel!
    
    @IBOutlet weak var favoritesButton: UIButton!
    
    @IBOutlet weak var fullDescription: UILabel!
    
    @IBAction func tapFavoritesButton(_ sender: Any) {
        guard let boolFavorites = news?.isFavorites else {return}
        news?.isFavorites = !boolFavorites
        let image = boolFavorites ? UIImage(named: "favoritesInNews") : UIImage(named: "inFavorites")
        favoritesButton.setImage(image, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        detailImage.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setFavorites()
    }
    
    private func setData() {
        detailImage.image = UIImage(data: news?.imageData ?? Data())
        date.text = news?.date
        header.text = news?.header
        fullDescription.text = news?.fullDescription
    }
    
    private func setFavorites() {
        if news?.isFavorites == true {
            favoritesButton.setImage(UIImage(named: "inFavorites"), for: .normal)
        } else {
            favoritesButton.setImage(UIImage(named: "favoritesInNews"), for: .normal)
        }
    }
}
