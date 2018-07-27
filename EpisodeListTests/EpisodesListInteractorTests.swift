//
//  EpisodeListInteractorTests.swift
//  EpisodeListTests
//
//  Created by Chris Winstanley on 27/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import XCTest
@testable import EpisodeList

class EpisodesListInteractorTests: XCTestCase {
    
    class MockEpisodeDataManager: EpisodeDataManager {
        
        let mockData: [EpisodeTitleProvider]
        
        init(mockData: [EpisodeTitleProvider]) {
            self.mockData = mockData
        }
        
        func getEpisodes(completion: @escaping ([EpisodeTitleProvider]) -> ()) {
            completion(self.mockData)
        }
    }
    
    class CapturingEpisodesListInteractorOutput: EpisodesListInteractorOutput {
        
        private(set) var episodes: [EpisodeTitleProvider] = []
        
        func retrievedEpisodes(_ episodes: [EpisodeTitleProvider]) {
            self.episodes = episodes
        }
    }
    
    func testRetrievedEpisodesPassedToOutput() {
        let dataManager = MockEpisodeDataManager(mockData: [MockEpisodeTitleProvider(title: "Eastenders")])
        let output = CapturingEpisodesListInteractorOutput()
        let interactor = EpisodesListInteractor(dataManager: dataManager, output: output)
        interactor.retrieveEpisodes()
        XCTAssertTrue(output.episodes.first?.title == "Eastenders")
    }
}
