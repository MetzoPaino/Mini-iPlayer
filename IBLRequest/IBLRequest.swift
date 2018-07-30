//
//  IBLRequest.swift
//  Mini iPlayer
//
//  Created by William Robinson on 23/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

/// Public interface to the IBLRequest framework.
public struct IBLRequest {
    
    /// Request categories from IBL, performs external request.
    ///
    /// - Parameter completion: Completion block fired when request completes, returns an array of `IBLCategory`.
    static public func getCategories(completion: @escaping ([IBLCategory]) -> ()) {
        let urlSessionCategoryProvider = URLSessionCategoryProvider(url: CategoryURLBuilder().create(), parser: JSONCategoryParser())
        urlSessionCategoryProvider.getCategories(completion: completion)
    }
    
    ///  Request `IBLEpisode`s for a given `IBLCategory` from IBL, performs external request.
    ///
    /// - Parameter categoryID: Provide the `IBLCategory.id` of the category you want `IBLEpisode`'s for.
    /// - Parameter completion: Completion block fired when request completes, returns an array of `IBLEpisode`.
    static public func getEpisodes(for categoryID: String, completion: @escaping ([IBLEpisode]) -> ()) {
        let urlSessionEpisodeProvider = URLSessionEpisodeProvider(url: EpisodesURLBuilder(categoryID: categoryID).create(), parser: JSONEpisodeParser())
        urlSessionEpisodeProvider.getEpisodes(completion: completion)
    }
}
