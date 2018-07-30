//
//  IBLRequestEpisodeDataManager.swift
//  Mini iPlayer
//
//  Created by Chris Winstanley on 27/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation
import IBLRequest
import EpisodeList

struct IBLRequestEpisodeDataManager: EpisodeDataManager {
    
    let categoryID: String
    
    func getEpisodes(completion: @escaping ([EpisodeTitleProvider]) -> ()) {
        IBLRequest.getEpisodes(for: categoryID) { (episodes) in
            let episodePresentables = episodes.map({
                return Episode(episode: $0)
            })
            completion(episodePresentables)
        }
    }
}
