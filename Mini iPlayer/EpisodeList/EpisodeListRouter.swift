//
//  EpisodeListRouter.swift
//  Mini iPlayer
//
//  Created by William Robinson on 27/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import UIKit
import IBLRequest

class EpisodeListRouter {
    
    func showEpisodesList(for category: IBLCategory, viewController: UIViewController) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let episodeListViewController = storyboard.instantiateViewController(withIdentifier :"EpisodeListViewController") as! EpisodesViewController
        episodeListViewController.presenter = EpisodeListPresenter()
        episodeListViewController.presenter.category = category
        viewController.navigationController?.show(episodeListViewController, sender: nil)
    }
}
