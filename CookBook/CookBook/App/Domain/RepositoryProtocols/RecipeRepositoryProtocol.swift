//
//  RecipeRepositoryProtocol.swift
//  CookBook
//
//  Created by Osama Bashir on 1/24/21.
//

import Foundation

protocol RecipeRepositoryProtocol {
    func fetchRecipe(onCompletion: @escaping (Response) -> ())
}
