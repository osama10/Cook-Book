//
//  RecipeListSnapshotTests.swift
//  CookBookTests
//
//  Created by Osama Bashir on 10/13/20.
//

import XCTest
import FBSnapshotTestCase
@testable import CookBook

class RecipeListSnapshotTests: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
    }
    
    func test_whenDataIsFetched_listWillBeVisible() {
        let recipe = FakeRecipeData.recipeData.first
        let actions = RecipeListViewModelAction(showDetails: { _ in (recipe) })
        let viewModel = RecipeListViewModel(actions: actions, useCase: MockRecipeUseCase())
        let vc = createRecipeListViewController(viewModel: viewModel)
        FBSnapshotVerifyView(vc.view)
    }
    
    func test_whenDataIsFailed_NoListIsShown() {
        let recipe = FakeRecipeData.recipeData.first
        let actions = RecipeListViewModelAction(showDetails: { _ in (recipe) })
        let mockRepo = MockRecipeUseCase()
        mockRepo.responseType = .failure
        let viewModel = RecipeListViewModel(actions: actions, useCase: mockRepo)
        let vc = createRecipeListViewController(viewModel: viewModel)
        self.FBSnapshotVerifyView(vc.view)

    }


}


extension RecipeListSnapshotTests {
    func createRecipeListViewController(viewModel: RecipeListViewModel) -> RecipeListViewController {
        let storyboad = UIStoryboard(storyboard: .main)
        let vc: RecipeListViewController = storyboad.instantiateViewController()
        vc.viewModel = viewModel
        return vc
    }
}
