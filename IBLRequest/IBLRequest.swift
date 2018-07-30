//
//  IBLRequest.swift
//  Mini iPlayer
//
//  Created by William Robinson on 23/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

public struct IBLRequest {
    
    static public func getCategories(completion: @escaping ([IBLCategory]) -> ()) {
        let urlSessionCategoryProvider = URLSessionCategoryProvider(url: CategoryURLBuilder().create(), parser: JSONCategoryParser())
        urlSessionCategoryProvider.getCategories(completion: completion)
    }
    
    static public func getEpisodes(for categoryID: String, completion: @escaping ([IBLEpisode]) -> ()) {
        let urlSessionEpisodeProvider = URLSessionEpisodeProvider(url: EpisodesURLBuilder(categoryID: categoryID).create(), parser: JSONEpisodeParser())
        urlSessionEpisodeProvider.getEpisodes(completion: completion)
    }
}
