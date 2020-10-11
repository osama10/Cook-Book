//
//  UIView+Extensions.swift
//  CookBook
//
//  Created by Osama Bashir on 10/11/20.
//

import UIKit

extension UIView {
    func round() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
}
