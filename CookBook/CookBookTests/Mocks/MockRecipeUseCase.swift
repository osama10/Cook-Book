//
//  MockRecipeUseCase.swift
//  CookBookTests
//
//  Created by Osama Bashir on 10/13/20.
//

import Foundation
@testable import CookBook

final class MockRecipeUseCase: RecipeUseCaseProtocol {
    
    var responseType: FakeRecipeData.ResponseType = .success
    func fetchRecipes(onSuccess: @escaping ([Recipe]) -> (), onFailure: @escaping (String) -> ()) {
        switch responseType {
        case .success:
            onSuccess(FakeRecipeData.recipeData)
        case .failure:
            onFailure(Constants.errorMessage)
        }
    }
    
    
}
