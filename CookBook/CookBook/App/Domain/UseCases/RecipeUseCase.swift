//
//  RecipeUseCase.swift
//  CookBook
//
//  Created by Osama Bashir on 10/11/20.
//

import Foundation

protocol RecipeUseCaseProtocol {
    func fetchRecipes(onSuccess: @escaping([Recipe]) -> (), onFailure: @escaping(String) -> () )
}

final class RecipeUseCase: RecipeUseCaseProtocol {
    
    let repository: RecipeRepositoryProtocol
    
    init(repository: RecipeRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchRecipes(onSuccess: @escaping ([Recipe]) -> (), onFailure: @escaping (String) -> ()) {
        repository.fetchRecipe { (response) in
            switch response {
            case .success(let data):
                onSuccess(data)
            case .failure(_):
                onFailure(Constants.errorMessage)
            }
        }
    }
}
