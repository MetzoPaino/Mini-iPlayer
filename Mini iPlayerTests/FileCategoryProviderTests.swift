//
//  FileCategoryProviderTests.swift
//  Mini iPlayerTests
//
//  Created by William Robinson on 30/05/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import XCTest
@testable import Mini_iPlayer

class FileCategoryProviderTests: XCTestCase {
        
    func testArrayOfCategoriesReturnedFromFileProvider() {
        let catFileProvider = FileCategoryProvider(fileName: "TestCategory")
        
        let expect = expectation(description: "...")
        catFileProvider.getCategories { (categories) in
            XCTAssertEqual(categories.first?.title, "Arts")
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10) { error in
        }
    }
    
    func testDifferentFilesCanBeParsed() {
        let catFileProvider = FileCategoryProvider(fileName: "TestCategory2")
        
        let expect = expectation(description: "...")
        catFileProvider.getCategories { (categories) in
            XCTAssertEqual(categories.first?.title, "Drama")
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10) { error in
        }
    }
}
