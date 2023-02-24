//
//  NewsCell.swift
//  iOS Test
//
//  Created by Гарик on 21.02.2023.
//

import UIKit
import SnapKit
import CoreData

class NewsCell: UICollectionViewCell {
    
    private lazy var id: Int64 = 0
    
    private var isFavorites = false
    
    private lazy var contatinerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame = contentView.frame
        view.layer.cornerRadius = 22
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var newsImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .black
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 13)
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var headerLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.textColor = .black
        view.textAlignment = .left
        view.font = UIFont.systemFont(ofSize: 13)
        return view
    }()
    
    lazy var favoritesButton: UIButton = {
        let view = UIButton()
        view.addTarget(self, action: #selector(tapFavorites), for: .touchUpInside)
        return view
    }()
    
    @objc func tapFavorites() {
        let context = NewsModel.persistantContainer.viewContext
        let objects = try? context.fetch(NewsData.fetchRequest())
        let news = objects?.first(where: {$0.id == id})
        isFavorites = !isFavorites
        if isFavorites {
            news?.isFavorites = true
            favoritesButton.setImage(UIImage(named: "inFavorites"), for: .normal)
        } else {
            news?.isFavorites = false
            favoritesButton.setImage(UIImage(named: "favoritesInNews"), for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setValues(id: Int64, imageData: Data?, date: String, header: String, description: String?, isFavorites: Bool) {
        self.id = id
        newsImageView.image = UIImage(data: imageData ?? Data())
        dateLabel.text = date
        headerLabel.text = header
        descriptionLabel.text = description
        self.isFavorites = isFavorites
    }
    
    private func configuration() {
        addSubview(contatinerView)
        let views = [newsImageView, dateLabel, headerLabel, favoritesButton, descriptionLabel]
        views.forEach { view in
            contatinerView.addSubview(view)
        }
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        layer.shadowRadius = 40
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 8)
    }
    
    func setupConstraints() {
        newsImageView.snp.makeConstraints { make in
            make.top.equalTo(contatinerView.snp.top)
            make.right.equalTo(contatinerView.snp.right)
            make.left.equalTo(contatinerView.snp.left)
            make.height.equalTo(contatinerView.snp.height).multipliedBy(0.5)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(newsImageView.snp.bottom).offset(10)
            make.left.equalTo(contatinerView.snp.left).offset(20)
            make.right.equalTo(contatinerView.snp.right).offset(20)
        }
        
        headerLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(10)
            make.left.equalTo(contatinerView.snp.left).offset(20)
            make.right.equalTo(contatinerView.snp.right).offset(-20)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(2)
            make.left.equalTo(contatinerView.snp.left).offset(20)
            make.right.equalTo(contatinerView.snp.right).offset(-20)
            make.bottom.equalTo(contatinerView.snp.bottom).offset(-10)
        }
        
        favoritesButton.snp.makeConstraints { make in
            make.top.equalTo(newsImageView.snp.bottom).offset(10)
            make.right.equalTo(contatinerView.snp.right).offset(-20)
        }
    }
}
