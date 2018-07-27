//
//  EpisodeListPresenterTests.swift
//  EpisodeListTests
//
//  Created by Chris Winstanley on 27/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import XCTest
@testable import EpisodeList

class EpisodesListPresenterTests: XCTestCase {
    
    class CapturingUserInterface: EpisodesListViewInterface {
        
        private(set) var data: EpisodesDisplayData?
        
        func showEpisodesDisplayData(_ data: EpisodesDisplayData) {
            self.data = data
        }
    }
    
    func testReceivedEpisodesArePresented() {
        let testEpisodeTitle = "Eastenders"
        let capturingUserInterface = CapturingUserInterface()
        let episodeListPresenter = EpisodesListPresenter()
        episodeListPresenter.userInterface = capturingUserInterface
        episodeListPresenter.retrievedEpisodes([MockEpisodeTitleProvider(title: testEpisodeTitle)])
        XCTAssertEqual(capturingUserInterface.data?.episodes.first?.title, testEpisodeTitle)
    }
    
}
