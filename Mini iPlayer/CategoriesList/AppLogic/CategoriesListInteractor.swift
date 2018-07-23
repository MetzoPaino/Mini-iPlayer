//
//  CategoriesListInteractor.swift
//  Mini iPlayer
//
//  Created by Chris Winstanley on 23/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation
import IBLRequest

protocol CategoriesListInteractorInput {
    func retrieveCategories()
}

protocol CategoriesListInteractorOutput {
    func retrievedCategories(_ categories: [CategoryPresentable])
}

struct CategoriesListInteractor: CategoriesListInteractorInput {
    
    var output: CategoriesListInteractorOutput?
    let dataManager: CategoryDataManager
    
    init(dataManager: CategoryDataManager) {
        self.dataManager = dataManager
    }
    
    func retrieveCategories() {
        dataManager.getCategories { (categories) in
            let categoryPresentables = categories.map({
                return CategoryPresentable(category: $0)
            })
            self.output?.retrievedCategories(categoryPresentables)
        }
    }
    
}
