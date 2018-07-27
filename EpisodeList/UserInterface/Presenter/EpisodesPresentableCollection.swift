//
//  EpisodePresentableCollection.swift
//  EpisodeList
//
//  Created by Chris Winstanley on 27/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

protocol EpisodeDetailProvider {
    var title: String { get }
}

struct EpisodeDetailItem: EpisodeDetailProvider {
    
    let title: String
    
    init(episodeTitleProvider: EpisodeTitleProvider) {
        title = episodeTitleProvider.title
    }
}

class EpisodesPresentableCollection {
    
    var episodes: [EpisodeDetailProvider] = []
    
    var collectedData: EpisodesDisplayData {
        return EpisodesDisplayData(episodes: episodes)
    }
    
    func addEpisodeList(episodeList: [EpisodeTitleProvider]) {
        for episode in episodeList {
            episodes.append(EpisodeDetailItem(episodeTitleProvider: episode))
        }
    }
}
