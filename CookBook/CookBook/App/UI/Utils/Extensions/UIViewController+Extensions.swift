//
//  AlertPresentable.swift
//  CookBook
//
//  Created by Osama Bashir on 10/12/20.
//

import UIKit

protocol AlertsPresentable : class {}
extension AlertsPresentable where Self : UIViewController {

    func showAlert(with title: String? = nil , and message: String? = nil){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)

        present(alertController, animated: true, completion: nil)

    }

}
