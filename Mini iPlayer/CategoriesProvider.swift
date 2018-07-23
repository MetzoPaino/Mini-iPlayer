//
//  CategoriesProvider.swift
//  Mini iPlayer
//
//  Created by William Robinson on 30/05/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

protocol CategoriesProvider {
    func getCategories(from url: URL, completion: @escaping ([Category])->())
}
