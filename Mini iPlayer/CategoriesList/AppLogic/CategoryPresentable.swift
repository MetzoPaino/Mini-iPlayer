//
//  CategoryPresentable.swift
//  Mini iPlayer
//
//  Created by Chris Winstanley on 23/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

struct CategoryPresentable {
    let title: String
    
    init(category: Category) {
        self.title = category.title
    }
}
