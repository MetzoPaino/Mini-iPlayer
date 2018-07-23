//
//  CategoryURLBuilder.swift
//  Mini iPlayer
//
//  Created by William Robinson on 23/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

class CategoryURLBuilder: URLProvider {
    
    private let url: URL
    
    init() {
        self.url = URL(string: "https://ibl.api.bbci.co.uk/ibl/v1/categories?rights=mobile")!
    }
    
    internal func create() -> URL {
        return url
    }
}
