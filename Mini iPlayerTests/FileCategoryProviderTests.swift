//
//  FileCategoryProviderTests.swift
//  Mini iPlayerTests
//
//  Created by William Robinson on 30/05/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import XCTest
@testable import Mini_iPlayer

class MockURLProvider: URLProvider {
    
    let fileName: String
    
    init(fileName: String = "TestCategory") {
        self.fileName = fileName
    }
    
    func create() -> URL {
        let bundle = Bundle.main
        let urlpath = bundle.path(forResource: fileName, ofType: "json")
        return URL(fileURLWithPath: urlpath!)
    }
}

class FileCategoryProviderTests: XCTestCase {
    
    func testArrayOfCategoriesReturnedFromFileProvider() {
        let mockURLProvider = MockURLProvider()
        let dataCategoryParser = JSONCategoryParser()
        let catFileProvider = URLSessionCategoryProvider(url: mockURLProvider.create(), parser: dataCategoryParser)
        
        let expect = expectation(description: "...")
        catFileProvider.getCategories { (categories) in
            XCTAssertEqual(categories.first?.title, "Arts")
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10) { error in
        }
    }
    
    func testDifferentFilesCanBeParsed() {
        let mockURLProvider = MockURLProvider(fileName: "TestCategory2")
        let dataCategoryParser = JSONCategoryParser()
        let catFileProvider = URLSessionCategoryProvider(url: mockURLProvider.create(), parser: dataCategoryParser)

        let expect = expectation(description: "...")
        catFileProvider.getCategories { (categories) in
            XCTAssertEqual(categories.first?.title, "Drama")
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10) { error in
        }
    }
}
