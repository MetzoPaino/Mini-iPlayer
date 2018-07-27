//
//  CategoryDisplayItem.swift
//  Mini iPlayer
//
//  Created by Chris Winstanley on 25/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

protocol CategoryTitleProvider {
    var title: String { get }
}

protocol CategoryIdProvider {
    var id: String { get }
}

struct CategoriesItem: CategoryTitleProvider, CategoryIdProvider {
    let title: String
    let id: String
}
