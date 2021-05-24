//
//  JSONParseTests.swift
//  SmashHitsTests
//
//  Created by Adam Winiecki on 5/23/21.
//

import XCTest
@testable import SmashHits

let tinyJSON = "{\"name\":\"Taylor Swift\"}".data(using: .utf8)

class JSONParseTests: XCTestCase {

    func testDecoder() throws {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
          
            if let tinyJSON = tinyJSON {
                let author = try decoder.decode(Author.self, from: tinyJSON)
                XCTAssertEqual(author.name, "Taylor Swift")
            }
            
        } catch (let decodingError) {
          print(decodingError)
        }
    }

    func testDecoderFalsePositive() throws {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
          
            if let tinyJSON = tinyJSON {
                let author = try decoder.decode(Author.self, from: tinyJSON)
                XCTAssertNotEqual(author.name, "John")
            }
            
        } catch (let decodingError) {
          print(decodingError)
        }
    }

}
