//
//  EpisodesURLBuilder.swift
//  Mini iPlayer
//
//  Created by William Robinson on 23/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

class EpisodesURLBuilder: URLProvider {
    
    private let url: URL
    
    init(categoryID: String) {
        self.url = URL(string: "https://ibl.api.bbci.co.uk/ibl/v1/categories/\(categoryID)/highlights?lang=en&rights=mobile&availability=available")!
    }
    
    internal func create() -> URL {
        return url
    }
}
