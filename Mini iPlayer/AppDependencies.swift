//
//  AppDependencies.swift
//  Mini iPlayer
//
//  Created by Chris Winstanley on 25/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation
import UIKit
import CategoriesList

class AppDependencies {
    
    let listWireframe: CategoriesListWireframe
    
    init() {
        let rootWireframe = RootWireframe()
        let categoriesListDataManager = IBLRequestCategoryDataManager()
        listWireframe = CategoriesListWireframe(dataManager: categoriesListDataManager, rootWireframe: rootWireframe, categorySelectedHandler: rootWireframe)
    }
    
    func installRootViewControllerIntoWindow(_ window: UIWindow) {
        listWireframe.presentCategoriesListInterfaceFromWindow(window)
    }
}
