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

//  func testServiceHost() throws {
//    let servicePath = URL(string:ServiceURLList.AppleTop100.rawValue)
//    XCTAssertEqual(servicePath!.host, URL(string:"apple.com"))
//  }

    func testServiceBaseURL() throws {
        guard let servicePath = URL(string:ServiceURLList.AppleTop100.rawValue)
        else {
            return
        }
        //XCTAssertEqual(servicePath!.baseURL, URL(string:"apple.com"))
        let appleURL = URL(string:"apple.com")
        XCTAssertEqual(servicePath.baseURL!, appleURL!)
    }

    func testJSONHost() throws {
      let cachePath = ServiceURLList.AppleTop100.rawValue
      guard let url = URL(string:ServiceURLList.AppleTop100.rawValue) else {
        return
      }
      do {
        try "sampletext".write(toFile:cachePath, atomically:false, encoding:String.Encoding.utf8)
      } catch {
        print(error)
      }
      
//      //host, baseURL
//      print(cachePath)
//      XCTAssertEqual(cachePath.host, URL(string:"apple.com"))
    }

    func testCachePathExists() throws {
      let cachePath = "cache".buildCachePath()
      //let cachePath = "cache".buildCachePath()
      XCTAssertEqual(cachePath, URL(string:"apple.com"))
    }

//  StringProtocol
//  func testCanWriteToCache() throws {
//    let cachePath = "cache".buildCachePath()
//      do {
//        try "sampletext".write(toFile:cachePath, atomically:false, encoding:String.Encoding.utf8)
//      } catch {
//        print(error)
//      }
//  }
        
//  func testContentView() throws {
//      let contentView = ContentView()
//      XCTAssertNoThrow(try contentView.inspect().group().text(0))
//  }
  

  func testCString() throws {
      let contentView = ContentView()
//    func getCString(inout [CChar], maxLength: Int, encoding: String.Encoding) -> Bool
//      XCTAssertNoThrow(try contentView.inspect().group().text(0))
  }

  
//  func testAuthor() throws {
//      let author = Author (
//          name: "John"
//      )
//      let data = try author.encode()
//      let decodedAuthor = try data.decoded() as Author
//    //XCTAssertEqual(author, decodedAuthor)
//    XCTAssertEqual(author.name, "John")
//  }
  
//  func testReorderingOfSmallerIntegersFirst() {
//      var numbers = [5,2,3]
//      numbers.sort { (lhs: Comparable, rhs: Comparable) -> Bool in
//          return lhs < rhs
//      }
//      print(numbers)
//      XCTAssertEqual(values, [2, 3, 5],
//          "Expected \(values) to equal [2, 3, 5]")
//  }
  

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

