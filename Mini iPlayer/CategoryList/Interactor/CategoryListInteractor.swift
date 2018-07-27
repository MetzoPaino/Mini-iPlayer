//
//  CategoryListInteractor.swift
//  Mini iPlayer
//
//  Created by William Robinson on 26/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation
import IBLRequest

//protocol DataCategoryParser {
////    func parse(data: Data) -> [IBLCategory]
//}

class CategoryListInteractor {
    
    private let iblRequest: IBLRequest

    init(iblRequest: IBLRequest) {
        self.iblRequest = iblRequest
    }
    
    func fetchCategories() {
        iblRequest.getCategories { (categories) in
            DispatchQueue.main.async {

            }
        }
    }
}
