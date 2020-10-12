//
//  AppNavigation.swift
//  CookBook
//
//  Created by Osama Bashir on 10/12/20.
//

import UIKit

class AppNavigation: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        navigationBar.barTintColor = .yellow
        navigationBar.tintColor = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black,
             NSAttributedString.Key.font: UIFont(name: "AvenirNextCondensed-DemiBold", size: 24)!]
        navigationBar.backgroundColor = .yellow
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        viewController.navigationItem.backBarButtonItem = .init(title: "", style: .plain, target: nil, action: nil)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
}
