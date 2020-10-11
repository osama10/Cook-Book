//
//  RecipeTableViewCell.swift
//  CookBook
//
//  Created by Osama Bashir on 10/11/20.
//

import UIKit
import SDWebImage

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView?.round()
    }
    
    func setup(_ viewModel: RecipeCellViewModel) {
        recipeLabel.text = viewModel.recipeName
        recipeImageView.sd_setImage(with: viewModel.imageUrl, placeholderImage: #imageLiteral(resourceName: "food_placeholder"))
    }
}
