//
//  CategoriesListInteractor.swift
//  Mini iPlayer
//
//  Created by Chris Winstanley on 23/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

protocol CategoriesListInteractorInput {
    func retrieveCategories()
}

protocol CategoriesListInteractorOutput {
    func retrievedCategories(_ categories: [CategoryPresentable])
}

struct CategoriesListInteractor: CategoriesListInteractorInput {
    
    let output: CategoriesListInteractorOutput
    let dataManager: CategoryDataManager
    
    init(dataManager: CategoryDataManager, output: CategoriesListInteractorOutput) {
        self.dataManager = dataManager
        self.output = output
    }
    
    func retrieveCategories() {
        dataManager.getCategories { (categories) in
            self.output.retrievedCategories(categories)
        }
    }
    
}
