//
//  FileParser.swift
//  Mini iPlayer
//
//  Created by William Robinson on 30/05/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

class URLSessionCategoryProvider {
    
    let url: URL
    let parser: DataCategoryParser

    init(url: URL, parser: DataCategoryParser) {
        self.url = url
        self.parser = parser
    }
}

extension URLSessionCategoryProvider: CategoriesProvider {
    func getCategories(completion: @escaping ([IBLCategory]) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            completion(self.parser.parse(data: data))
            }.resume()
    }
}
