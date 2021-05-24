//
//  String+Extensions.swift
//  SmashHits
//
//  Convenience code to get the cache path
//
//  Created by Adam Winiecki on 5/22/21.
//

import Foundation

extension String {
  func buildCachePath() -> URL {
    let cachesDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
    let path = cachesDirectory.appendingPathComponent(self)
    return path
  }
}
