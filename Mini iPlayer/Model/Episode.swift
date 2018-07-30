//
//  Episode.swift
//  Mini iPlayer
//
//  Created by Chris Winstanley on 27/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation
import IBLRequest
import EpisodeList

struct Episode: EpisodeTitleProvider {
    var title: String
    
    init(episode: IBLEpisode) {
        title = episode.title
    }
}
