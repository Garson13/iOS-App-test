//
//  NewsData+CoreDataProperties.swift
//  iOS Test
//
//  Created by Гарик on 23.02.2023.
//
//

import Foundation
import CoreData


extension NewsData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsData> {
        return NSFetchRequest<NewsData>(entityName: "NewsData")
    }

    @NSManaged public var id: Int64
    @NSManaged public var imageData: Data?
    @NSManaged public var date: String?
    @NSManaged public var header: String?
    @NSManaged public var descriptionNews: String?
    @NSManaged public var fullDescription: String?
    @NSManaged public var isFavorites: Bool

}

extension NewsData : Identifiable {

}
