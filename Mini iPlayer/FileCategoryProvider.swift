//
//  FileParser.swift
//  Mini iPlayer
//
//  Created by William Robinson on 30/05/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

class FileCategoryProvider {

    private let fileName: String
    private var url: URL {
        let bundle = Bundle(for: type(of: self))
        let urlpath = bundle.path(forResource: fileName, ofType: "json")
        return URL(fileURLWithPath: urlpath!)
    }
    
    init(fileName: String) {
        
        self.fileName = fileName
    }
    
    func parseJSONFile(completion: @escaping ([Category])->()) {
        
        URLSession.shared.dataTask(with: self.url) { (data, response, error) in
            
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(CategoryRequest.self, from: data)
                print(gitData)
                
                completion(gitData.categories)

            } catch let err {
                print("Err", err)
                completion([Category]())
            }
            
            
//            if let data = data {
//                let json = try? JSONSerialization.jsonObject(with: data, options: [])
//                print(json)
//            } else {
//                print("No Data")
//            }
        }.resume()
    }
}

extension FileCategoryProvider: CategoriesProvider {
    func getCategories(completion: @escaping ([Category])->()) {
        let categories = parseJSONFile(completion: completion)
    }
}
