//
//  ContentView.swift
//  SmashHits
//
//  Created by Adam Winiecki on 5/19/21.
//

import SwiftUI

struct UISizeHelper {
  static let MediumThumbnailSize = 60.0
  static let LargeThumbnailSize = 200.0

  static let DetailVerticalSpacing = 60.0
  static let DetailBottomSpacing = 20.0
}

struct ContentView: View {
  @State private var feed = Feed()
  
  func loadData() {
        guard let url = URL(string:ServiceURLList.AppleTop100.rawValue) else {
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                      DispatchQueue.main.async {
                          self.feed = decodedResponse.feed
                      }
                      return
                }
            }
        }.resume()
    }

  var body: some View {
    NavigationView {
      List(feed.results, id: \.artistName) { result in
      NavigationLink(destination: SongDetail(selection:result)) {
        LazyHStack {
            let artworkURL = result.artworkUrl100
            let size = CGFloat(UISizeHelper.MediumThumbnailSize)
            NetworkImage(urlString: artworkURL)
              .frame(width:size, height:size)
              .foregroundColor(.black)
            LazyVStack(alignment: .leading) {
              Text(result.artistName)
                .foregroundColor(.black)
                .fixedSize()
                .accessibilityIdentifier("name")
              Text(result.name)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
            }
          }
        }
      }
    }
    .navigationViewStyle(StackNavigationViewStyle())
    .onAppear(perform: self.loadData)
  }
}

struct SongDetail: View {
    @State private var feed = Feed()

    let selection: Result

    var body: some View {
    GeometryReader { geometry in
        let viewWidth = geometry.size.width
        List {
            let verticalSpacing = CGFloat(UISizeHelper.DetailVerticalSpacing)
            HStack {
                let artworkURL = selection.artworkUrl100
                NetworkImage(urlString: artworkURL)
            }
            VStack(alignment: .center) {
                Text(selection.name)
                .frame(width:viewWidth, height:verticalSpacing, alignment: .center)
                .font(.title3)
                Text(selection.artistName)
                .frame(width:viewWidth, height:verticalSpacing, alignment: .center)
                .font(.footnote)
                .foregroundColor(.secondary)
                Text(selection.genres[0].name)
                .frame(width:viewWidth, height:verticalSpacing, alignment: .center)
                .font(.title3)
                .foregroundColor(.secondary)
                Text(selection.releaseDate)
                .frame(width:viewWidth, height:verticalSpacing, alignment: .center)
                .font(.headline)
                .foregroundColor(.secondary)
                Text(selection.copyright)
                .frame(width:viewWidth, height:verticalSpacing, alignment: .center)
                .font(.subheadline)
                .foregroundColor(.secondary)
                HStack(alignment: .bottom) {
                    Button("View in iTunes Store") {
                        guard let url = URL(string: selection.url) else {
                            return
                        }
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        } else {
                            UIApplication.shared.openURL(url)
                        }
                    }
                    .frame(width:viewWidth, height:CGFloat(UISizeHelper.DetailBottomSpacing), alignment: .center)
                    }
                }
            }
        }
    }
}

