//
//  RecipeFakeData.swift
//  CookBookTests
//
//  Created by Osama Bashir on 10/13/20.
//

import Foundation
@testable import CookBook

struct FakeRecipeData {
    
    enum ResponseType {
        case success, failure
    }
    
    struct FakeError: Error {}
    
    static let recipeData = [
        Recipe(title: "Biryani", description: "Super tasty", chef: "Osama", imageURL: nil, tags: ["Pakistani", "Spicy"]),
        Recipe(title: "Chicken Karahi", description: "Super tasty Karahi. Cooked well. Eat and enjoy.", chef: "Osama", imageURL: nil, tags: ["Pakistani", "Spicy"]),
        Recipe(title: "Haleem", description: "Super tasty", chef: "Osama", imageURL: nil, tags: ["Pakistani", "Spicy"])
    ]
}
