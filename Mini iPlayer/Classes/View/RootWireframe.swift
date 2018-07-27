//
//  RootWireframe.swift
//  Mini iPlayer
//
//  Created by Chris Winstanley on 25/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation
import UIKit
import CategoriesList

struct RootWireframe {
    
    private func navigationControllerFromWindow(_ window: UIWindow) -> UINavigationController {
        let navigationController = window.rootViewController as! UINavigationController
        return navigationController
    }
}

extension RootWireframe: CategoriesListViewControllerPresenter {
 
    func showRootViewController(_ viewController: UIViewController, inWindow: UIWindow) {
        let navigationController = navigationControllerFromWindow(inWindow)
        navigationController.viewControllers = [viewController]
    }
}

extension RootWireframe: CategorySelectedHandler {
    func selected(categoryId: String) {
        
    }
}

