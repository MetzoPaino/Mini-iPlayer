//
//  EpisodesListInteractor.swift
//  EpisodeList
//
//  Created by Chris Winstanley on 27/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

protocol EpisodesListInteractorInput {
    func retrieveEpisodes()
}

protocol EpisodesListInteractorOutput {
    func retrievedEpisodes(_ episodes: [EpisodeTitleProvider])
}

struct EpisodesListInteractor: EpisodesListInteractorInput {
    
    let output: EpisodesListInteractorOutput
    let dataManager: EpisodeDataManager
    
    init(dataManager: EpisodeDataManager, output: EpisodesListInteractorOutput) {
        self.dataManager = dataManager
        self.output = output
    }
    
    func retrieveEpisodes() {
        dataManager.getEpisodes { (episodes) in
            self.output.retrievedEpisodes(episodes)
        }
    }
}
