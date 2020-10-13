//
//  MockRecipieRepository.swift
//  CookBookTests
//
//  Created by Osama Bashir on 10/13/20.
//

import Foundation
@testable import CookBook

final class MockRecipieRepository: RecipeRepositoryProtocol {
    var responseType: FakeRecipeData.ResponseType = .success
    
    func fetchRecipe(onCompletion: @escaping (Response) -> ()) {
        switch responseType {
        case .success:
            onCompletion(.success(FakeRecipeData.recipeData))
        case .failure:
            onCompletion(.failure(FakeRecipeData.FakeError()))
        }
    }
}
