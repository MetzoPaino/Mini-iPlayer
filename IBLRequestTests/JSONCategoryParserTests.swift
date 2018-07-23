//
//  JSONCategoryParserTests.swift
//  Mini iPlayerTests
//
//  Created by William Robinson on 23/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import XCTest
@testable import IBLRequest

class JSONCategoryParserTests: XCTestCase {
    
    func testJSONParserUsingDecode() {
        let data = "{\"categories\":[{\"id\":\"arts\",\"title\":\"Arts\",\"type\":\"category\",\"kind\":\"genre\"}]}".data(using: .utf8)
        let categories = JSONCategoryParser().parse(data: data!)
        XCTAssertEqual(categories.count, 1)
        XCTAssertEqual(categories.first?.id, "arts")
    }
}
