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

public protocol CategoriesListViewControllerPresenter {
    func showRootViewController(_ viewController: UIViewController, inWindow: UIWindow)
}

public protocol CategorySelectedHandler {
    func selected(categoryId: String)
}

public protocol CategoryDataManager {
    func getCategories(completion: @escaping ([CategoryPresentable]) -> ())
}
        
public class CategoriesListWireframe: NSObject {
    
    let categoriesListPresenter = CategoriesListPresenter()
    let rootWireframe: CategoriesListViewControllerPresenter
    let categorySelectedHandler: CategorySelectedHandler

    var categoriesListViewController: CategoriesViewController?
    
    public init(dataManager: CategoryDataManager, rootWireframe: CategoriesListViewControllerPresenter, categorySelectedHandler: CategorySelectedHandler) {
        
        let categoriesListInteractor = CategoriesListInteractor(dataManager: dataManager, output: categoriesListPresenter)
        categoriesListPresenter.listInteractor = categoriesListInteractor
        
        self.rootWireframe = rootWireframe
        self.categorySelectedHandler = categorySelectedHandler
        
        super.init()

        categoriesListPresenter.listWireframe = self
    }
    
    public func presentCategoriesListInterfaceFromWindow(_ window: UIWindow) {
        let viewController = categoriesListViewControllerFromStoryboard()
        viewController.eventHandler = categoriesListPresenter
        categoriesListViewController = viewController
        categoriesListPresenter.userInterface = viewController
        rootWireframe.showRootViewController(viewController, inWindow: window)
    }
    
    func selected(category: String) {
        categorySelectedHandler.selected(categoryId: category)
    }
    
    private func categoriesListViewControllerFromStoryboard() -> CategoriesViewController {
        let storyboard = categoriesStoryboard()
        let viewController = storyboard.instantiateViewController(withIdentifier: CategoriesListViewControllerIdentifier) as! CategoriesViewController
        return viewController
    }
    
    private func categoriesStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Categories", bundle: Bundle(for: CategoriesListWireframe.self))
    }
}
