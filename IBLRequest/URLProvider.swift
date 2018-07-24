//
//  URLProvider.swift
//  Mini iPlayer
//
//  Created by William Robinson on 23/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

protocol URLProvider {
    func create() -> URL
}

enum URLBuilderError: Error {
    case notPresent
}
