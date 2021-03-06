//
//  EpisodesURLBuilderTests.swift
//  Mini iPlayerTests
//
//  Created by William Robinson on 23/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import XCTest
@testable import Mini_iPlayer

class EpisodesURLBuilderTests: XCTestCase {
    
    func testCorrectURLsReturned() {
        let url = URL(string: "http://ibl.api.bbci.co.uk/ibl/v1/categories/documentaries/highlights?lang=en&rights=mobile&availability=available")!
        let episodeURLBuilder = EpisodesURLBuilder(categoryID: "documentaries")
        
        XCTAssertEqual(episodeURLBuilder.create(), url, "Not the same!")
    }
}
