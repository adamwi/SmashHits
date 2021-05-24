//
//  PlaygroundTests.swift
//  SmashHitsTests
//
//  Created by Adam Winiecki on 5/23/21.
//

import XCTest
@testable import SmashHits

// For running tests in Swift Playground
class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}
/*
in playground:
        let testObserver = TestObserver()
        XCTestObservationCenter.shared.addTestObserver(testObserver)
        PlaygroundTests.defaultTestSuite.run()
*/
