//
//  RecipeDetailViewController.swift
//  CookBook
//
//  Created by Osama Bashir on 10/12/20.
//

import UIKit
import SDWebImage

class RecipeDetailViewController: UIViewController {

    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var chefLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    
    var viewModel: RecipeDetailViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        recipeImageView.sd_setImage(with: viewModel.imageURL, placeholderImage: #imageLiteral(resourceName: "food_placeholder"))
        titleLabel.text = viewModel.title
        title = "Cook Book"
        chefLabel.text = viewModel.chef
        descriptionLabel.attributedText = viewModel.descprition
        tagsLabel.text = viewModel.tags
    }
}
