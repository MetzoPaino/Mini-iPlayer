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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testArrayOfCategoriesReturnedFromFileProvider() {
        let catFileProvider = FileCategoryProvider(fileName: "TestCategory")
        let categories = catFileProvider.getCategories()
        XCTAssertEqual(categories.first?.name, "Arts")
    }
    
    func testDifferentFilesCanBeParsed() {
        let catFileProvider = FileCategoryProvider(fileName: "TestCategory")
        let categories = catFileProvider.getCategories()
        XCTAssertEqual(categories.first?.name, "Drama")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
