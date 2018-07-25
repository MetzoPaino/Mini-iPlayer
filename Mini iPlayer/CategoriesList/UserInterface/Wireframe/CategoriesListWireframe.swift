//
//  CategoriesListWireframe.swift
//  Mini iPlayer
//
//  Created by Chris Winstanley on 25/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation
import UIKit

let CategoriesListViewControllerIdentifier = "CategoriesListViewController"

class CategoriesListWireframe: NSObject {
    
    var categoriesListPresenter: CategoriesListPresenter?
    var rootWireframe: RootWireframe?
    var categoriesListViewController: CategoriesViewController?
    
    func presentCategoriesListInterfaceFromWindow(_ window: UIWindow) {
        let viewController = categoriesListViewControllerFromStoryboard()
        viewController.eventHandler = categoriesListPresenter
        categoriesListViewController = viewController
        categoriesListPresenter?.userInterface = viewController
        rootWireframe?.showRootViewController(viewController, inWindow: window)
    }
    
    private func categoriesListViewControllerFromStoryboard() -> CategoriesViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewController(withIdentifier: CategoriesListViewControllerIdentifier) as! CategoriesViewController
        return viewController
    }
    
    private func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
