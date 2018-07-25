//
//  AppDependencies.swift
//  Mini iPlayer
//
//  Created by Chris Winstanley on 25/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation
import UIKit

class AppDependencies {
    
    var listWireframe = CategoriesListWireframe()

    init() {
        configureDependencies()
    }
    
    func installRootViewControllerIntoWindow(_ window: UIWindow) {
        listWireframe.presentCategoriesListInterfaceFromWindow(window)
    }
    
    func configureDependencies() {
        let rootWireframe = RootWireframe()
        
        var categoriesListPresenter = CategoriesListPresenter()
        let categoriesListDataManager = IBLRequestCategoryDataManager()
        let categoriesListInteractor = CategoriesListInteractor(dataManager: categoriesListDataManager, output: categoriesListPresenter)
        
        categoriesListPresenter.listInteractor = categoriesListInteractor
        categoriesListPresenter.listWireframe = listWireframe
        
        listWireframe.categoriesListPresenter = categoriesListPresenter
        listWireframe.rootWireframe = rootWireframe
    }
}
