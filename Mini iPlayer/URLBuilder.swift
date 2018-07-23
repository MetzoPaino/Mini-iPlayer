//
//  URLBuilder.swift
//  Mini iPlayer
//
//  Created by William Robinson on 23/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

class URLBuilder {
    
    static func create(with fileName: String) -> URL {
        let bundle = Bundle.main
        let urlpath = bundle.path(forResource: fileName, ofType: "json")
        return URL(fileURLWithPath: urlpath!)
    }
}

