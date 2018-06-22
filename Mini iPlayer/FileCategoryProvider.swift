//
//  FileParser.swift
//  Mini iPlayer
//
//  Created by William Robinson on 30/05/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import Foundation

class FileCategoryProvider {

    private var file: Data?
    
    init(fileName: String) {
        let bundle = Bundle(for: type(of: self))
        let urlpath = bundle.path(forResource: fileName, ofType: "json")
        let url = URL(fileURLWithPath: urlpath!)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            self.file = data
            
            
        }
    }
    
    func parseJSONFile() {
        
        let json = try? JSONSerialization.jsonObject(with: file!, options: [])
        print(json)
    }
}

extension FileCategoryProvider: CategoriesProvider {
    func getCategories() -> [Category] {
        parseJSONFile()
        
        return [Category(id: "foo", name: "Arts")]
    }
}
