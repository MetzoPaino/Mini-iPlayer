//
//  CategoryPresentableCollection.swift
//  Mini iPlayer
//
//  Created by Chris Winstanley on 24/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

class CategoryPresentableCollection {
    
    var categories: [CategoriesDisplayItem] = []
    
    func addCategoryList(_ categories: [CategoryPresentable]) {
        for category in categories {
            addCategory(category)
        }
    }
    
    func addCategory(_ category: CategoryPresentable) {
        categories.append(category.displayItem())
    }
    
    var collectedDisplayData: CategoriesDisplayData {
        return CategoriesDisplayData(categories: categories)
    }
}
