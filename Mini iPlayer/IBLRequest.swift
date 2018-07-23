//
//  IBLRequest.swift
//  Mini iPlayer
//
//  Created by William Robinson on 23/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

public protocol CategoryDataManager {
    func getCategories(completion: @escaping ([Category]) -> ())
}

struct IBLRequest: CategoryDataManager {
    
    public func getCategories(completion: @escaping ([Category]) -> ()) {
        let urlSessionCategoryProvider = URLSessionCategoryProvider(url: CategoryURLBuilder().create(), parser: JSONCategoryParser())
        urlSessionCategoryProvider.getCategories(completion: completion)
    }
    
    public func getEpisodes(for categoryID: String, completion: @escaping ([Episode]) -> ()) {
        let urlSessionEpisodeProvider = URLSessionEpisodeProvider(url: EpisodesURLBuilder(categoryID: categoryID).create(), parser: JSONEpisodeParser())
        urlSessionEpisodeProvider.getEpisodes(completion: completion)
    }
}
