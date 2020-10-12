//
//  UITableView+Extensions.swift
//  CookBook
//
//  Created by Osama Bashir on 10/12/20.
//

import UIKit

extension UITableView {

    func register<T:UITableViewCell>(_ : T.Type) where T : ReusableView & NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeResuseableCell<T:UITableViewCell>(for indexPath : IndexPath)->T where T : ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else{
            fatalError("Couldn't cast cell in \(T.reuseIdentifier)")
        }
        return cell
    }

    func setdelegateAndDatasource(for viewController : UIViewController) {
        self.delegate = viewController as? UITableViewDelegate
        self.dataSource = viewController as? UITableViewDataSource
    }
}
