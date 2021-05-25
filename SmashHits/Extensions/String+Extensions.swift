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
    func buildCachePath() -> String {
        let cachesDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        for directory in cachesDirectory {
            let path = directory.appendingPathComponent(self)
            return path.absoluteString //return the first cache path
        }
        return "" //no caches available, return empty
    }
}
