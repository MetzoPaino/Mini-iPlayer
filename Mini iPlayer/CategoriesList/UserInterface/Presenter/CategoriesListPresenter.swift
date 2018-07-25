//
//  CategoriesListPresenter.swift
//  Mini iPlayer
//
//  Created by Chris Winstanley on 24/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

class CategoriesListPresenter: CategoriesListModuleInterface, CategoriesListInteractorOutput {
    
    var listInteractor: CategoriesListInteractorInput?
    var userInterface: CategoriesListViewInterface?
    var listWireframe: CategoriesListWireframe?
    
    //MARK: CategoriesListInteractorOutput
    
    func retrievedCategories(_ categories: [CategoryPresentable]) {
        let collection = CategoryPresentableCollection()
        collection.addCategoryList(categories)
        userInterface?.showCategoriesDisplayData(collection.collectedDisplayData)
    }
    
    //MARK: CategoriesListModuleInterface
    
    func updateView() {
        listInteractor?.retrieveCategories()
    }
    
}
