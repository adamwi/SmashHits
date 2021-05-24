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

//struct ContentView: View {
//    var body: some View {
//        Text("ViewTests")
//    }
//}

class ViewTests: XCTestCase {
    
    var app = XCUIApplication()

    func testContentView() throws {
        let mainContent = ContentView()
        let message = app.staticTexts["View in iTunes Store"]
        let fields = app.textFields["name"]
        XCTAssertEqual(message, fields)
    }



//    func testVStackOfTexts() throws {
//        let view = VStack {
//            Text("1")
//            Text("2")
//            Text("3")
//        }
//        let values = try view.inspect().map { try $0.text().string() }
//        print(values)
//        XCTAssertEqual(values, ["1", "2", "3"])
//    }

}
