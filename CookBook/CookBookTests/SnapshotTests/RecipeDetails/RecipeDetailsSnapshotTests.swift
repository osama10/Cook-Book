//
//  RecipeDetailsSnapshotTests.swift
//  CookBookTests
//
//  Created by Osama Bashir on 10/13/20.
//

import XCTest
import FBSnapshotTestCase
@testable import CookBook

class RecipeDetailsSnapshotTests: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
    }

    func test_whenDataIsProvided_detailViewShowIt() {
        let viewModel = RecipeDetailViewModel(recipe: FakeRecipeData.recipeData.first!)
        let vc = createRecipeDetailViewController(viewModel: viewModel)
        FBSnapshotVerifyView(vc.view)
    }
    
    func test_whenDataProvidedWithoutChefName_detailViewShowsCorrectData() {
        let recipe = Recipe(title: "Biryani", description: "Best food ever", chef: nil, imageURL: nil, tags: ["Pakistani food"])
        let viewModel = RecipeDetailViewModel(recipe: recipe)
        let vc = createRecipeDetailViewController(viewModel: viewModel)
        FBSnapshotVerifyView(vc.view)
    }
    
    func test_whenDataProvidedWithoutTitle_detailViewShowsCorrectData() {
        let recipe = Recipe(title: "", description: "Best food ever", chef: "Osama Bin Bashir", imageURL: nil, tags: ["Pakistani food"])
        let viewModel = RecipeDetailViewModel(recipe: recipe)
        let vc = createRecipeDetailViewController(viewModel: viewModel)
        FBSnapshotVerifyView(vc.view)
    }
    
    func test_whenDataProvidedWithoutTags_detailViewShowsCorrectData() {
        let recipe = Recipe(title: "Chicken Karahi", description: "Best food ever. I make super tasty karahi", chef: "Osama Bin Bashir", imageURL: nil, tags: [])
        let viewModel = RecipeDetailViewModel(recipe: recipe)
        let vc = createRecipeDetailViewController(viewModel: viewModel)
        FBSnapshotVerifyView(vc.view)
    }

    func test_whenDataProvidedWithoutDescription_detailViewShowsCorrectData() {
        let recipe = Recipe(title: "Chicken Karahi", description: "", chef: "Osama Bin Bashir", imageURL: nil, tags: ["Pakistani food"])
        let viewModel = RecipeDetailViewModel(recipe: recipe)
        let vc = createRecipeDetailViewController(viewModel: viewModel)
        FBSnapshotVerifyView(vc.view)
    }


}


extension RecipeDetailsSnapshotTests {
    func createRecipeDetailViewController(viewModel: RecipeDetailViewModel) -> RecipeDetailViewController {
        let storyboad = UIStoryboard(storyboard: .main)
        let vc: RecipeDetailViewController = storyboad.instantiateViewController()
        vc.viewModel = viewModel
        return vc
    }
}
