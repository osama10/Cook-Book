//
//  CookBookTests.swift
//  CookBookTests
//
//  Created by Osama Bashir on 10/11/20.
//

import XCTest
@testable import CookBook

class RecipeUseCaseTests: XCTestCase {

    func test_onSucces_DataWillBeFetched() {
        let useCase = RecipeUseCase(repository: MockRecipieRepository())
        useCase.fetchRecipes { (data) in
            XCTAssertEqual(data.count, FakeRecipeData.recipeData.count)
            XCTAssertEqual(data.first?.title, FakeRecipeData.recipeData.first?.title)
            XCTAssertEqual(data.first?.description, FakeRecipeData.recipeData.first?.description)
            XCTAssertEqual(data.first?.chef, FakeRecipeData.recipeData.first?.chef)
            XCTAssertEqual(data.first?.tags, FakeRecipeData.recipeData.first?.tags)
            XCTAssertEqual(data.first?.imageURL, FakeRecipeData.recipeData.first?.imageURL)
        } onFailure: { (error) in
            
        }
    }

    func test_onFailure_DataWillBeFetched() {
        let mockRepo = MockRecipieRepository()
        mockRepo.responseType = .failure
        let useCase = RecipeUseCase(repository: mockRepo)
        useCase.fetchRecipes { (data) in
        } onFailure: { (error) in
            XCTAssertEqual(error, Constants.errorMessage)
        }

    }
}
