//
//  Recipe.swift
//  CookBook
//
//  Created by Osama Bashir on 10/11/20.
//

import Foundation

struct Recipe {
  
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
}
