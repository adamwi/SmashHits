//
//  NetImage.swift
//  SmashHits
//
//  Created by Adam Winiecki on 5/19/21.
//

import Foundation
import UIKit

enum DownloadState {
  case new, complete, failed
}

class NetImage {
  let url: URL
  var state: DownloadState?
  var image: UIImage?
  init(url:String) {
    let foo:URL? = URL(string:url)
    self.url = foo!
    state = DownloadState.new
  }
}
