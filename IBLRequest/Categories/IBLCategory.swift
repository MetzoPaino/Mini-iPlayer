//
//  Category.swift
//  Mini iPlayer
//
//  Created by William Robinson on 30/05/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

public typealias CategoryIdentifier = String

public struct IBLCategory: Codable {
    public let id: CategoryIdentifier
    public let title: String
}
