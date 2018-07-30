//
//  EpisodeListPresenter.swift
//  Mini iPlayer
//
//  Created by William Robinson on 27/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

class EpisodeListPresenter {
    
    var category: CategoryEntity!

    private var interactor = EpisodeListInteractor()
    
    func updateWithEpisodes(completion: @escaping ([Episode]) -> ()) {
        interactor.fetchEpisodes(for: category) { (episodes) in
            completion(episodes)
        }
    }
    
    func categoryTitle() -> String {
        return category.title
    }
}
