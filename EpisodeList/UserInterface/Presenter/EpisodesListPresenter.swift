//
//  EpisodesListPresenter.swift
//  EpisodeList
//
//  Created by Chris Winstanley on 27/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

class EpisodesListPresenter {
    
    var collection: EpisodesPresentableCollection?
    var userInterface: EpisodesListViewInterface?
    var listInteractor: EpisodesListInteractorInput?
}

extension EpisodesListPresenter: EpisodesListInteractorOutput {
    
    func retrievedEpisodes(_ episodes: [EpisodeTitleProvider]) {
        collection = EpisodesPresentableCollection()
        if let episodeCollection = collection {
            episodeCollection.addEpisodeList(episodeList: episodes)
            userInterface?.showEpisodesDisplayData(episodeCollection.collectedData)
        }
    }
}

extension EpisodesListPresenter: EpisodesListModuleInterface {

    func updateView() {
        listInteractor?.retrieveEpisodes()
    }

}
