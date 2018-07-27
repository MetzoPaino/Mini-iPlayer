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

    func fetchEpisodes(for category: IBLCategory, completion: @escaping ([Episode]) -> ()) {
        iblRequest.getEpisodes(for: category.id) { (episodes) in
            DispatchQueue.main.async {
                completion(episodes)
            }
        }
    }
}
