//
//  EpisodeListWireframe.swift
//  EpisodeList
//
//  Created by Chris Winstanley on 27/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation
import UIKit

let CategoriesListViewControllerIdentifier = "EpisodesListViewController"

public protocol EpisodesListViewControllerPresenter {
    func showRootViewController(_ viewController: UIViewController)
}

public protocol EpisodeDataManager {
    func getEpisodes(completion: @escaping ([EpisodeTitleProvider]) -> ())
}

public class CategoriesListWireframe: NSObject {
    
//    let categoriesListPresenter = CategoriesListPresenter()
    let rootWireframe: EpisodesListViewControllerPresenter
    
//    var categoriesListViewController: CategoriesViewController?
    
    public init(dataManager: EpisodeDataManager, rootWireframe: EpisodesListViewControllerPresenter) {
        
//        let episodesListInteractor = EpisodesListInteractor(dataManager: dataManager, output: categoriesListPresenter)
//        categoriesListPresenter.listInteractor = categoriesListInteractor
//
        self.rootWireframe = rootWireframe
//        self.categorySelectedHandler = categorySelectedHandler
//
        super.init()
//
//        categoriesListPresenter.listWireframe = self
        
    }
    
    public func presentEpisodesListInterfaceFromWindow(_ window: UIWindow) {
//        let viewController = categoriesListViewControllerFromStoryboard()
//        viewController.eventHandler = categoriesListPresenter
//        categoriesListViewController = viewController
//        categoriesListPresenter.userInterface = viewController
//        rootWireframe.showRootViewController(viewController, inWindow: window)
    }
    
//    func selected(category: String) {
//        categorySelectedHandler.selected(categoryId: category)
//    }
    
//    private func categoriesListViewControllerFromStoryboard() -> CategoriesViewController {
//        let storyboard = categoriesStoryboard()
//        let viewController = storyboard.instantiateViewController(withIdentifier: CategoriesListViewControllerIdentifier) as! CategoriesViewController
//        return viewController
//    }
    
//    private func categoriesStoryboard() -> UIStoryboard {
//        return UIStoryboard(name: "Categories", bundle: Bundle(for: CategoriesListWireframe.self))
//    }
}
