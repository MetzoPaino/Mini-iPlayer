//
//  EpisodeListPresenter.swift
//  Mini iPlayer
//
//  Created by William Robinson on 27/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation
import IBLRequest

class EpisodeListPresenter {
    
    var category: IBLCategory!

    private var interactor = EpisodeListInteractor()
    
    func updateWithEpisodes(completion: @escaping ([Episode]) -> ()) {
        interactor.fetchEpisodes(for: category) { (episodes) in
            completion(episodes)
        }
    }
}
