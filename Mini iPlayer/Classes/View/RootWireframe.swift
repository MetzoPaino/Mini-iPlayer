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
import EpisodeList

class RootWireframe {
    
    var window: UIWindow?
    
    private func navigationControllerFromWindow(_ window: UIWindow) -> UINavigationController {
        let navigationController = window.rootViewController as! UINavigationController
        return navigationController
    }
}

extension RootWireframe: CategoriesListViewControllerPresenter {
 
    func showRootViewController(_ viewController: UIViewController, inWindow: UIWindow) {
        self.window = inWindow
        let navigationController = navigationControllerFromWindow(inWindow)
        navigationController.viewControllers = [viewController]
    }
}

extension RootWireframe: CategorySelectedHandler {
    
    func selected(categoryId: String) {
        let dataManager = IBLRequestEpisodeDataManager(categoryID: categoryId)
        let episodesWireframe = EpisodesListWireframe(dataManager: dataManager, rootWireframe: self)
        episodesWireframe.presentEpisodesListInterface()
    }
    
}

extension RootWireframe: EpisodesListViewControllerPresenter {
    func showViewController(_ viewController: UIViewController) {
        let navigationController = navigationControllerFromWindow(self.window!)
        navigationController.pushViewController(viewController, animated: true)
    }
}

