//
//  EpisodeListInteractor.swift
//  Mini iPlayer
//
//  Created by William Robinson on 27/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation
import IBLRequest

class EpisodeListInteractor {
    
    private let iblRequest = IBLRequest()

    func fetchEpisodes(for category: CategoryEntity, completion: @escaping ([Episode]) -> ()) {
        iblRequest.getEpisodes(for: category.id) { (iblEpisodes) in

            DispatchQueue.main.async {
                completion(EpisodeAdapter().convert(episodes: iblEpisodes))
            }
        }
    }
}

struct EpisodeAdapter {
    
    func convert(episodes iblEpisodes: [IBLEpisode]) -> [Episode] {
        var episodes = [Episode]()
        
        for iblEpisode in iblEpisodes {
            let episode = convert(episode: iblEpisode)
            episodes.append(episode)
        }
        return episodes
    }
    
    func convert(episode iblEpisode: IBLEpisode) -> Episode {
        let episode = Episode(title: iblEpisode.title)
        return episode
    }
}
