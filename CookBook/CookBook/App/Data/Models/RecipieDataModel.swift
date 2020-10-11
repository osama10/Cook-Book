//
//  RecipieDataModel.swift
//  CookBook
//
//  Created by Osama Bashir on 10/11/20.
//

import Foundation
import Contentful

struct RecipieDataModel {
    
    static let contentId = "recipe"
    
    let title: String?
    let description: String?
    let tags: [String]
    let chef: String?
    let imageURL: URL?
    
    init(title: String?,
         description: String?,
         chef: String?,
         imageURL: URL?,
         tags: [String]) {
        self.title = title
        self.description = description
        self.chef = chef
        self.imageURL = imageURL
        self.tags = tags
    }
    
    init(with entry: Entry) {
        let title = entry.fields["title"] as? String
        let description = entry.fields["description"] as? String
        let chef = entry.fields.linkedEntry(at: "chef")?.fields["name"] as? String
        let imageURL = entry.fields.linkedAsset(at: "photo")?.url
        let tags: [String]
        
        if let tagEntries = entry.fields.linkedEntries(at: "tags") {
            tags = tagEntries.compactMap { $0.fields["name"] as? String }
        } else {
            tags = []
        }
        self.init(title: title, description: description, chef: chef, imageURL: imageURL, tags: tags)
    }
    
}
