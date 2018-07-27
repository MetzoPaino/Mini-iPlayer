//
//  JSONEpisodeProvider.swift
//  Mini iPlayer
//
//  Created by William Robinson on 23/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

protocol DataEpisodeParser {
    func parse(data: Data) -> [IBLEpisode]
}

struct JSONEpisodeParser: DataEpisodeParser {
    
    func parse(data: Data) -> [IBLEpisode] {
        do {
            let decoder = JSONDecoder()
            let episodeRequest = try decoder.decode(EpisodeRequest.self, from: data)
            return episodeRequest.category_highlights.elements
        } catch {
            return [IBLEpisode]()
        }
    }
}
