//
//  Model.swift
//  SmashHits
//
//  Created by Adam Winiecki on 5/22/21.
//

import Foundation

struct Author: Codable {
    var name: String
    init(name: String = "") {
        self.name = name
    }
    enum CodingKeys: CodingKey {
        case name
    }
}
struct Genre: Codable {
  var genreId: String
  var name: String
  var url: String
}

struct Result: Codable {
  var artistName: String
  var artistUrl: String
  var artworkUrl100: String?
  var copyright: String
  var artistId: String?
  var genres:[Genre]
  var id: String
  var kind: String
  var name: String
  var releaseDate: String
  var url: String
}
class Feed: Codable {
  var title: String?
  var author: Author
  var copyright: String
  var results: [Result]
  init(title: String = "", copyright: String = "") {
    self.title = title
    self.copyright = copyright
    self.author = Author()
    self.results = [Result]()
  }
}
struct Response:Codable {
  var feed:Feed
}
