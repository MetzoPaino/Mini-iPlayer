//
//  EpisodesProvider.swift
//  Mini iPlayer
//
//  Created by William Robinson on 16/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

protocol EpisodesProvider {
    func getEpisodes(categoryID: String, completion: @escaping ([Episode]) -> ())
}
