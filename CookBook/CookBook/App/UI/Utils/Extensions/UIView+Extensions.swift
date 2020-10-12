//
//  UIView+Extensions.swift
//  CookBook
//
//  Created by Osama Bashir on 10/11/20.
//

import UIKit

extension UIView {
    func round() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.layer.masksToBounds = true
    }
}

protocol ReusableView : class {  static var reuseIdentifier : String {get} }
extension ReusableView where Self : UIView {
    static var reuseIdentifier : String {
        return String(describing: self).components(separatedBy: ".").last!
    }
}

protocol NibLoadableView : class { static var nibName : String {get} }
extension NibLoadableView where Self : UIView {
    static var nibName : String {
        return String(describing: self).components(separatedBy: ".").last!
    }
    static func loadNib() -> Self {
        let bundle = Bundle(for:Self.self)
        let nib = UINib(nibName: Self.nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! Self
    }
}

