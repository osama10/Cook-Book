//
//  Response.swift
//  CookBook
//
//  Created by Osama Bashir on 10/11/20.
//

import Foundation

enum Response {
    case success([RecipeData])
    case failure(Error)
}
