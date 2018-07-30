//
//  EpisodeListWireframe.swift
//  EpisodeList
//
//  Created by Chris Winstanley on 27/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation
import UIKit

let EpisodesListViewControllerIdentifier = "EpisodesListViewController"

public protocol EpisodesListViewControllerPresenter {
    func showViewController(_ viewController: UIViewController)
}

public protocol EpisodeDataManager {
    func getEpisodes(completion: @escaping ([EpisodeTitleProvider]) -> ())
}

public class EpisodesListWireframe: NSObject {
    
    let episodesListPresenter = EpisodesListPresenter()
    let rootWireframe: EpisodesListViewControllerPresenter
    var episodesListViewController: EpisodesViewController?
    
    public init(dataManager: EpisodeDataManager, rootWireframe: EpisodesListViewControllerPresenter) {
        
        let episodesListInteractor = EpisodesListInteractor(dataManager: dataManager, output: episodesListPresenter)
        episodesListPresenter.listInteractor = episodesListInteractor
//
        self.rootWireframe = rootWireframe
//        self.categorySelectedHandler = categorySelectedHandler
//
        super.init()
//
//        categoriesListPresenter.listWireframe = self
        
    }
    
    public func presentEpisodesListInterface() {
        let viewController = episodesListViewControllerFromStoryboard()
        viewController.eventHandler = episodesListPresenter
        episodesListViewController = viewController
        episodesListPresenter.userInterface = viewController
        rootWireframe.showViewController(viewController)
    }
    
//    func selected(category: String) {
//        categorySelectedHandler.selected(categoryId: category)
//    }
    
    private func episodesListViewControllerFromStoryboard() -> EpisodesViewController {
        let storyboard = episodesStoryboard()
        let viewController = storyboard.instantiateViewController(withIdentifier: EpisodesListViewControllerIdentifier) as! EpisodesViewController
        return viewController
    }
    
    private func episodesStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Episodes", bundle: Bundle(for: EpisodesListWireframe.self))
    }
}
