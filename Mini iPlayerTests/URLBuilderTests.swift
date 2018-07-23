//
//  URLBuilderTests.swift
//  Mini iPlayerTests
//
//  Created by William Robinson on 23/07/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import XCTest
@testable import Mini_iPlayer

class URLBuilderTests: XCTestCase {
    
    func testCreate() {
        
        do {
            let urlBuilder = try URLBuilder(fileName: "TestCategory")
            let url = urlBuilder.create()
            XCTAssertNotNil(url.absoluteString, "URLBuilder failed to correctly build URL.")
        } catch {
            XCTFail()
        }
    }
}
