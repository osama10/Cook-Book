//
//  AppCoordinator.swift
//  CookBook
//
//  Created by Osama Bashir on 10/12/20.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    
    let navigation: AppNavigation
    let appDIContainer: AppDIContainer
    
    init(navigation: AppNavigation, appDIContainer: AppDIContainer) {
        self.navigation = navigation
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        let recipeListDIContainer = appDIContainer.makeRecipeDIContainer()
        let recipeListFlowCoordinator = recipeListDIContainer.makeRecipeFlowCoodinator(navigation: navigation)
        recipeListFlowCoordinator.start()
    }
}
