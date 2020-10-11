//
//  RecipeRepository.swift
//  CookBook
//
//  Created by Osama Bashir on 10/11/20.
//

import Foundation
import Contentful


protocol RecipeRepositoryProtocol {
    func fetchRecipe(onCompletion: @escaping (Response) -> ())
}

final class RecipeRepository: RecipeRepositoryProtocol {
    
    
    func fetchRecipe(onCompletion: @escaping (Response) -> ()) {
        
        let client = Client(spaceId: Constants.ContentfulConfig.spaceId,
                            environmentId: Constants.ContentfulConfig.envId,
                            accessToken: Constants.ContentfulConfig.accessToken)
        
        let query = Query.where(contentTypeId: RecipeData.contentId)
        
        
        client.fetchArray(of: Entry.self, matching: query) { (result: Result<HomogeneousArrayResponse<Entry>, Error>) in
            switch result {
            case .success(let arrayResponse):
                let entries = arrayResponse.items
                let result = entries.map(RecipeData.init)
                onCompletion(.success(result))
            case .failure(let error):
                onCompletion(.failure(error))
            }
        }
        
    }
    
    
    
}
