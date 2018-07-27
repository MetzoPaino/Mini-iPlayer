//
//  CategoryPresentableCollection.swift
//  Mini iPlayer
//
//  Created by Chris Winstanley on 24/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

class CategoriesPresentableCollection {
    
    var categories: [CategoryIdProvider & CategoryTitleProvider] = []
    
    var collectedDisplayData: CategoriesDisplayData {
        return CategoriesDisplayData(categories: categories)
    }
    
    func categoryId(for indexPath: IndexPath) -> String {
        return categories[indexPath.row].id
    }
    
    func addCategoryList(_ categories: [CategoryPresentable]) {
        for category in categories {
            addCategory(category)
        }
    }
    
    private func addCategory(_ category: CategoryPresentable) {
        categories.append(category.categoryItem())
    }
    
}
