//
//  Category.swift
//  Mini iPlayer
//
//  Created by William Robinson on 30/05/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

typealias CategoryIdentifier = String

public struct Category: Codable {
    let id: CategoryIdentifier
    let title: String
}
