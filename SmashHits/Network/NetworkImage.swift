//
//  NetworkImage.swift
//  SmashHits
//
//  struct which handles async image retrieval from the server and/or cache
//
//  Created by Adam Winiecki on 5/17/21.
//  Copyright © 2021 Adam Winiecki. All rights reserved.
//

import SwiftUI
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
struct NetworkImage: View {
  @ObservedObject var urlImageModel: URLImageModel
    init(urlString: String?) {
        urlImageModel = URLImageModel(urlString: urlString)
    }
    var body: some View {
        Image(uiImage: urlImageModel.image ?? NetworkImage.defaultImage!)
            .resizable()
            .scaledToFill()
    }
    static var defaultImage = UIImage(systemName: "photo")
    }
    class URLImageModel: ObservableObject {
    @Published var image: UIImage?
    var urlString: String?
    init(urlString: String?) {
        self.urlString = urlString
        loadImage()
    }
    func loadImage() {
        guard let urlString = urlString else {
            return
        }
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cachedImage
            return
        }
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: getImageFromResponse(data:response:error:))
        task.resume()
    }

    func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil else {
            return
        }
        guard let data = data else {
            return
        }
        DispatchQueue.main.async {
            guard let loadedImage = UIImage(data: data) else {
                return
            }
          imageCache.setObject(loadedImage, forKey: self.urlString as AnyObject)
          self.image = loadedImage
        }
    }
}


