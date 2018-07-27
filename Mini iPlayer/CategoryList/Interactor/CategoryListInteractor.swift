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
    
    func fetchCategories(completion: @escaping ([IBLCategory]) -> ()) {
        iblRequest.getCategories { (categories) in
                completion(categories)
            }
    }
}
