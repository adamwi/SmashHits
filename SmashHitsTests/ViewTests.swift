//
//  ViewTests.swift
//  SmashHitsTests
//
//  Created by Adam Winiecki on 5/23/21.
//

import SwiftUI
import Foundation
import XCTest
@testable import SmashHits

class ViewTests: XCTestCase {
    
    var app = XCUIApplication()

    func testStaticTextsAreNotEmpty() throws {
        let message = app.staticTexts["View in iTunes Store"]
        print("message \(message)")
        let fields = app.textFields["name"]
        print("fields \(fields)")
        XCTAssertNotEqual(message, fields)
    }

    func testTextFieldsExist() throws {
        let fields:XCUIElement = app.textFields["name"]
        XCTAssert(fields.exists)
    }

    func testStaticTextsExist() throws {
        let texts:XCUIElement = app.staticTexts["View in iTunes Store"]
        XCTAssert(texts.exists)
    }
}
