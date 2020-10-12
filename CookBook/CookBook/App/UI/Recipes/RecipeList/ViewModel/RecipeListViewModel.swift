//
//  RecipeListViewModel.swift
//  CookBook
//
//  Created by Osama Bashir on 10/12/20.
//

import Foundation

struct RecipeListViewModelAction {
    var showDetails: (Recipe) -> ()?
}

protocol RecipeListVieModelInput {
    func viewDidLoad()
    func didTapOnRow(at index: Int)
    func celViewModel(at index: Int) -> RecipeCellViewModel
}

protocol RecipeListVieModelOutput {
    var totalRows: Int { get }
    var heightForRow: Int { get }
    var title: String { get }
    var loader: Observable<Bool> { get }
    var reload: Observable<Void> { get }
    var error: Observable<String> { get }
}

protocol RecipeListVieModelProtocol: RecipeListVieModelInput, RecipeListVieModelOutput { }

final class RecipeListViewModel: RecipeListVieModelProtocol {
    
    var loader: Observable<Bool> = Observable(false)
    var reload: Observable<Void> = Observable(())
    var error: Observable<String> = Observable("")
    
    var totalRows: Int { recipes.count }
    var heightForRow: Int { 70 }
    var title: String { "Cook Book" }
    private var recipes = [Recipe]() { didSet { reload.value = () } }
    
    let actions: RecipeListViewModelAction
    let useCase: RecipeUseCaseProtocol
    
    init(actions: RecipeListViewModelAction, useCase: RecipeUseCaseProtocol) {
        self.actions = actions
        self.useCase = useCase
    }
    
    func viewDidLoad() {
        loader.value = true
        useCase.fetchRecipes(onSuccess: onSuccess, onFailure: onFailure)
    }
    
    func didTapOnRow(at index: Int) {
        actions.showDetails(recipes[index])
    }
    
    func celViewModel(at index: Int) -> RecipeCellViewModel {
        let title = recipes[index].title ?? ""
        let imageURL = recipes[index].imageURL
        return RecipeCellViewModel(recipeName: title, imageUrl: imageURL)
    }
    
    private func onSuccess(data: [Recipe]) {
        loader.value = false
        recipes = data
    }
    
    private func onFailure(errorMessage: String) {
        loader.value = false
        error.value = errorMessage
    }
}
