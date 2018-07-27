//
//  CategoryListRouter.swift
//  Mini iPlayer
//
//  Created by William Robinson on 26/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import UIKit
import IBLRequest

class CategoryListRouter {
    
    func showEpisodesList(for category: IBLCategory, viewController: UIViewController) {
    
        let episodeListRouter = EpisodeListRouter()
        episodeListRouter.showEpisodesList(for: category, viewController: viewController)
    }
}
