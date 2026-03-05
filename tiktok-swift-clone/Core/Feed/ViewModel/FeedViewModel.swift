//
//  FeedViewModel.swift
//  tiktok-swift-clone
//
//  Created by Tr NguyenH8 on 3/4/26.
//

import Foundation
import Combine

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    static let videoUrls = [
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"
    ]
    
    init () {
        fetchPosts()
    }
    
    func fetchPosts() {
        self.posts = [
            .init(id: NSUUID().uuidString, videoUrl: FeedViewModel.videoUrls[0]),
            .init(id: NSUUID().uuidString, videoUrl: FeedViewModel.videoUrls[1]),
            .init(id: NSUUID().uuidString, videoUrl: FeedViewModel.videoUrls[2]),
            .init(id: NSUUID().uuidString, videoUrl: FeedViewModel.videoUrls[3]),
        ]
    }
}
