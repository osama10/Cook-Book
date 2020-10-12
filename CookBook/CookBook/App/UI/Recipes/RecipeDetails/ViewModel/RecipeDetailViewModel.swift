//
//  RecipeDetailViewModel.swift
//  CookBook
//
//  Created by Osama Bashir on 10/12/20.
//

import Foundation
import Down

protocol RecipeDetailViewOutput {
    var imageURL: URL? { get }
    var title: String { get }
    var descprition: NSAttributedString { get }
    var tags: String { get }
    var chef: String { get }
}

protocol RecipeDetailViewModelProtocol: RecipeDetailViewOutput { }

struct RecipeDetailViewModel: RecipeDetailViewModelProtocol {
   
    var imageURL: URL? { recipe.imageURL }
    var title: String { recipe.title ?? "" }
    var descprition: NSAttributedString {
        if let description = recipe.description,
           let attributedDescription = try? Down(markdownString: description).toAttributedString() {
            return attributedDescription
        } else { return NSAttributedString(string: "") }
    }
    var tags: String { (recipe.tags.isEmpty) ? "" : ("Tags: " + recipe.tags.joined(separator: ", "))}
    var chef: String { (recipe.chef != nil) ? "By \(String(describing: recipe.chef!))" : "" }
    
    private let recipe: Recipe
    
    init(recipe: Recipe) { self.recipe = recipe }
}
