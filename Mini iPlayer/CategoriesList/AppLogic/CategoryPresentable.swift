//
//  CategoryPresentable.swift
//  Mini iPlayer
//
//  Created by Chris Winstanley on 23/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation
import IBLRequest

struct CategoryPresentable {
    let title: String
    let id: String
    
    init(category: IBLCategory) {
        self.title = category.title
        self.id = category.id
    }
    
    func categoryItem() -> CategoryTitleProvider & CategoryIdProvider {
        return CategoriesItem(title: title, id: id)
    }
}
