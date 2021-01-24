//
//  RecipeDIContainer.swift
//  CookBook
//
//  Created by Osama Bashir on 10/12/20.
//

import UIKit

final class RecipeDIContainer {
    lazy var repository: RecipeRepositoryProtocol = RecipeDataStore()
}

extension RecipeDIContainer: RecipeListCoordinatorDependencies {
    // MARK:- RecipeList
    func makeRecipeFlowCoodinator(navigation: AppNavigation) -> RecipeListCoordinator { RecipeListCoordinator(dependencies: self, navigation: navigation)
    }
    
    func makeRecipeUseCase() -> RecipeUseCaseProtocol { RecipeUseCase(repository: repository) }
    
    func makeRecipeListViewModel(actions: RecipeListViewModelAction) -> RecipeListViewModel {
        RecipeListViewModel(actions: actions, useCase: makeRecipeUseCase())
    }
    
    func makeRecipeListViewController(actions: RecipeListViewModelAction) -> RecipeListViewController {
        let storyboard = UIStoryboard(storyboard: .main)
        let recipeListVC: RecipeListViewController = storyboard.initialViewController()
        recipeListVC.viewModel = makeRecipeListViewModel(actions: actions)
        return recipeListVC
    }
    
    // MARK:- Recipe Details

    func makeRecipeDetailViewModel(recipe: Recipe) -> RecipeDetailViewModel { RecipeDetailViewModel(recipe: recipe) }
    func makeRecipeDetailViewController(recipe: Recipe) -> RecipeDetailViewController {
        let storyboard = UIStoryboard(storyboard: .main)
        let detailVC: RecipeDetailViewController = storyboard.instantiateViewController()
        detailVC.viewModel = makeRecipeDetailViewModel(recipe: recipe)
        return detailVC
    }
}
