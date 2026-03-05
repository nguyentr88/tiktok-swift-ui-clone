//
//  FeedView.swift
//  tiktok-swift-clone
//
//  Created by Tr NguyenH8 on 3/2/26.
//

import SwiftUI
import AVKit

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    @State private var scrollPosition: String?
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.posts) { post in
                    FeedCell(post: post, player: viewModel.player(for: post))
                        .id(post.id)
                        .onAppear {
                            viewModel.preloadPlayers(around: post)
                            playInitialVideoIfNecessary()
                        }
                }
            }
            .scrollTargetLayout()
        }
        .scrollPosition(id: $scrollPosition)
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .scrollIndicators(.hidden)
        .onChange(of: scrollPosition) { _, postId in
            handleScrollChange(postId)
        }
    }
    
    private func handleScrollChange(_ postId: String?) {
        guard let postId,
              let post = viewModel.posts.first(where: { $0.id == postId })
        else { return }
        
        viewModel.pauseAll(except: postId)
        viewModel.player(for: post).play()
    }
    
    private func playInitialVideoIfNecessary() {
        guard scrollPosition == nil, let firstPost = viewModel.posts.first else { return }
        let firstPlayer = viewModel.player(for: firstPost)
        guard firstPlayer.timeControlStatus != .playing else { return }
        firstPlayer.play()
    }
}

#Preview {
    FeedView()
}
