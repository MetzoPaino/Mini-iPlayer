//
//  CategoryDataManager.swift
//  Mini iPlayer
//
//  Created by Chris Winstanley on 25/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation
import IBLRequest
import CategoriesList

struct IBLRequestCategoryDataManager: CategoryDataManager {
   
    func getCategories(completion: @escaping ([CategoryPresentable]) -> ()) {
        IBLRequest.getCategories { (categories) in
            let categoryPresentables = categories.map({
                return CategoryPresentable(category: $0)
            })
            completion(categoryPresentables)
        }
    }
}

