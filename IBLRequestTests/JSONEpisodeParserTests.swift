//
//  JSONEpisodeParserTests.swift
//  IBLRequestTests
//
//  Created by Chris Winstanley on 27/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import XCTest
@testable import IBLRequest

class JSONEpisodeParserTests: XCTestCase {
    
    func testJSONParserUsingDecode() {
        let data = "{\"category_highlights\":{\"elements\":[{\"title\":\"Eastenders\"}]}}".data(using: .utf8)
        let episodes = JSONEpisodeParser().parse(data: data!)
        XCTAssertEqual(episodes.count, 1)
        XCTAssertEqual(episodes.first?.title, "Eastenders")
    }
    
    func testBlankArrayOnError() {
        let data = "sdohwo30939**&^*".data(using: .utf8)
        let episodes = JSONEpisodeParser().parse(data: data!)
        XCTAssertEqual(episodes.count, 0)
    }
}

