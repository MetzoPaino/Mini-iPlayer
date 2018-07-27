//
//  JSONCategoryParser.swift
//  Mini iPlayer
//
//  Created by William Robinson on 23/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

protocol DataCategoryParser {
    func parse(data: Data) -> [IBLCategory]
}

struct JSONCategoryParser: DataCategoryParser {
    
    func parse(data: Data) -> [IBLCategory] {
        do {
            let decoder = JSONDecoder()
            let gitData = try decoder.decode(CategoryRequest.self, from: data)
            return gitData.categories
        } catch {
            return [IBLCategory]()
        }
    }
}
