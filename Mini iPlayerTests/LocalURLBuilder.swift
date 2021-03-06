//
//  URLBuilder.swift
//  Mini iPlayer
//
//  Created by William Robinson on 23/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation
@testable import Mini_iPlayer

class LocalURLBuilder: URLProvider {
    
    private let url: URL
    
    init(fileName: String) throws {
        let bundle = Bundle.main
        guard let urlpath = bundle.path(forResource: fileName, ofType: "json") else {
            throw URLBuilderError.notPresent
        }
        url = URL(fileURLWithPath: urlpath)
    }
    
    internal func create() -> URL {
        return url
    }
}

