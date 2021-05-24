//
//  ImageDownloader
//  SmashHits
//
//  Created by Adam Winiecki on 5/19/21.
//  Copyright © 2021 Adam Winiecki. All rights reserved.
//

import Foundation
import UIKit

class PendingDownloads {
  lazy var downloadsInProgress: [IndexPath: Operation] = [:]
  lazy var downloadQueue: OperationQueue = {
    var queue = OperationQueue()
    queue.maxConcurrentOperationCount = 1
    queue.name = "image downloads"
    return queue
  }()
}

class ImageDownloader: Operation {
  let netImage: NetImage
  init(_ netImage: NetImage) {
    self.netImage = netImage
  }
  override func main() {
    if isCancelled == false {
      guard let imageData = try? Data(contentsOf: netImage.url) else {
        return
      }
      if !imageData.isEmpty && isCancelled == false {
        if let image = UIImage(data:imageData){
          netImage.image = image
        }
        netImage.state = .complete
      }
    }
  }
}


