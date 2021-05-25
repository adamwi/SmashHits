//
//  SmashHitsTests.swift
//  SmashHitsTests
//
//  Created by Adam Winiecki on 5/19/21.
//

import XCTest
@testable import SmashHits

class SmashHitsTests: XCTestCase {
    
    var app = XCUIApplication()

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testTopHitsServiceHost() throws {
        var host = ""
        if let top100URL = URL(string:ServiceURLList.AppleTop100.rawValue) {
            host = top100URL.host ?? ""
        }
        XCTAssertEqual(host, "apple.com")
    }
    
    func testCachePathExists() throws {
        let cachePath = "cache".buildCachePath()
        XCTAssertNotEqual(cachePath, "")
    }

    
    func testWriteCache() throws {
        let writeString:String = "cache-write-test"
        let cachePath = "cache".buildCachePath()
        do {
            try writeString.write(toFile:cachePath, atomically:false, encoding:String.Encoding.utf8)
        } catch {
            print(error)
        }
        let readString = try String(contentsOfFile:cachePath, encoding: .utf8)
        XCTAssertEqual(writeString, readString)
     }
  
    func testAuthor() throws {
        let author = Author(name: "John")
        XCTAssertEqual(author.name, "John")
    }

//    func testAuthorEncodeDecode() throws {
//        let author = Author (
//            name: "John"
//        )
//        let data = try author.encode()
//        let decodedAuthor = try data.decoded() as Author
//        XCTAssertEqual(author, decodedAuthor)
//    }

//    func test_contentLoad() throws {
//        let contentView = ContentView()
//        contentView.loadData()
//        //      XCTAssertNoThrow(try contentView.inspect().group().text(0))
//    }
//
//    func test_songDetail() throws {
//        let result =
//        let detailView = SongDetail(selection:result)
//    //      XCTAssertNoThrow(try contentView.inspect().group().text(0))
//    }

//  func test_content_for_build() throws {
//      let sut = ContentView(container: .defaultValue, isRunningTests: false)
//      XCTAssertNoThrow(try sut.inspect().group().view(CountriesList.self, 0))
//  }
//
//  func test_change_handler_for_colorScheme() throws {
//      var appState = AppState()
//      appState.routing.countriesList = .init(countryDetails: "USA")
//      let container = DIContainer(appState: .init(appState), interactors: .mocked())
//      let sut = ContentView(container: container)
//      sut.onChangeHandler(.colorScheme)
//      XCTAssertEqual(container.appState.value, appState)
//      container.interactors.verify()
//
//    XCTAssertTrue()
//  }
//
//  func test_change_handler_for_sizeCategory() throws {
//      var appState = AppState()
//      appState.routing.countriesList = .init(countryDetails: "USA")
//      let container = DIContainer(appState: .init(appState), interactors: .mocked())
//      let sut = ContentView(container: container)
//      XCTAssertEqual(container.appState.value, appState)
//      sut.onChangeHandler(.sizeCategory)
//      XCTAssertEqual(container.appState.value, AppState())
//      container.interactors.verify()
//  }

}

