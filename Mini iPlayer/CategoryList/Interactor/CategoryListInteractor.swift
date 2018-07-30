//
//  CategoryListInteractor.swift
//  Mini iPlayer
//
//  Created by William Robinson on 26/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation
import IBLRequest

class CategoryListInteractor {
    
    private let iblRequest = IBLRequest()
    
    func fetchCategories(completion: @escaping ([CategoryEntity]) -> ()) {
        iblRequest.getCategories { (categories) in
                completion(CategoryAdapter().convert(categories: categories))
            }
    }
}

struct CategoryAdapter {
    
    func convert(categories iblCategories: [IBLCategory]) -> [CategoryEntity] {
        var episodes = [CategoryEntity]()
        
        for iblCategory in iblCategories {
            let category = convert(category: iblCategory)
            episodes.append(category)
        }
        return episodes
    }
    
    private func convert(category iblCategory: IBLCategory) -> CategoryEntity {
        let category = CategoryEntity(id: iblCategory.id, title: iblCategory.title)
        return category
    }
}
