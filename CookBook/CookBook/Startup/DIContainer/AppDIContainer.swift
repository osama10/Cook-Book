//
//  AppDIContainer.swift
//  CookBook
//
//  Created by Osama Bashir on 10/12/20.
//

import Foundation

final class AppDIContainer {
    
    func makeRecipeDIContainer() -> RecipeDIContainer {
        return RecipeDIContainer()
    }
}
