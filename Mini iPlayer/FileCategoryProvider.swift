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
    
    init(fileName: String) {
        
        self.fileName = fileName
    }
    
    func parseJSONFile(completion: @escaping ([Category]) -> ()) {
        
        URLSession.shared.dataTask(with: URLBuilder.create(with: fileName)) { (data, response, error) in
            
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
        }.resume()
    }
}

extension FileCategoryProvider: CategoriesProvider {
    func getCategories(completion: @escaping ([Category]) -> ()) {
        parseJSONFile(completion: completion)
    }
}
