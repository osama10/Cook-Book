//
//  ViewController.swift
//  CookBook
//
//  Created by Osama Bashir on 10/11/20.
//

import UIKit

class RecipeListViewController: UIViewController, AlertsPresentable {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: RecipeListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindViewModel()
        viewModel.viewDidLoad()
    }
    
    private func setupTableView() {
        tableView.setdelegateAndDatasource(for: self)
        tableView.register(RecipeTableViewCell.self)
    }
    
    private func bindViewModel() {
        title = viewModel.title
        viewModel.error.observe(on: self) { [weak self] in self?.showAlert(with: "Error", and: $0) }
        viewModel.reload.observe(on: self) { [weak self] _ in self?.tableView.reloadData() }
        viewModel.loader.observe(on: self) { ($0) ? LoadingView.show() : LoadingView.hide() }
    }
}


extension RecipeListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.totalRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeResuseableCell(for: indexPath) as RecipeTableViewCell
        cell.setup(viewModel.celViewModel(at: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didTapOnRow(at: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(viewModel.heightForRow)
    }
}

