//
//  FileCategoryProviderTests.swift
//  Mini iPlayerTests
//
//  Created by William Robinson on 30/05/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import XCTest
@testable import Mini_iPlayer

class URLSessionEpisodesProviderTests: XCTestCase {
    
    func testArrayOfEpisodesReturnedFromFileProvider() {
        let mockURLProvider = try! LocalURLBuilder(fileName: "TestEpisodes")
        let dataEpisodeParser = JSONEpisodeParser()
        let catFileProvider = URLSessionEpisodeProvider(url: mockURLProvider.create(), parser: dataEpisodeParser)
        
        let expect = expectation(description: "...")
        catFileProvider.getEpisodes { (episodes) in
            XCTAssertEqual(episodes.first?.title, "The Misadventures of Romesh Ranganathan")
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10) { error in
        }
    }
}
