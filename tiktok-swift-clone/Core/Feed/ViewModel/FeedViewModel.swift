//
//  FeedViewModel.swift
//  tiktok-swift-clone
//
//  Created by Tr NguyenH8 on 3/4/26.
//

import Foundation
import Combine
import AVKit

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    private var playerCache: [String: AVPlayer] = [:]
    
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
    
    func player(for post: Post) -> AVPlayer {
           if let cached = playerCache[post.id] {
               return cached
           }
           let player = AVPlayer(url: URL(string: post.videoUrl)!)
           playerCache[post.id] = player
           return player
       }
    
    func preloadPlayers(around post: Post) {
            guard let index = posts.firstIndex(where: { $0.id == post.id }) else { return }
            
            let range = max(0, index - 1)...min(posts.count - 1, index + 1)
            for i in range {
                let _ = player(for: posts[i]) // tạo & cache nếu chưa có
            }
        }
    
    func pauseAll(except currentId: String) {
           playerCache.forEach { id, player in
               if id != currentId { player.pause() }
           }
       }
}
