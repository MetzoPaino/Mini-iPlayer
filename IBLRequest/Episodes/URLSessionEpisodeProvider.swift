//
//  URLSessionEpisodeProvider.swift
//  Mini iPlayer
//
//  Created by William Robinson on 23/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

class URLSessionEpisodeProvider {
    
    let url: URL
    let parser: DataEpisodeParser
    
    init(url: URL, parser: DataEpisodeParser) {
        self.url = url
        self.parser = parser
    }
}

extension URLSessionEpisodeProvider: EpisodesProvider {
    func getEpisodes(completion: @escaping ([IBLEpisode]) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            completion(self.parser.parse(data: data))
            }.resume()
    }
}
