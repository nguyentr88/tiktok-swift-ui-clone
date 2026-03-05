//
//  PostGridView.swift
//  tiktok-swift-clone
//
//  Created by Tr NguyenH8 on 3/3/26.
//

import SwiftUI

struct PostGridView: View {
    private let items = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1)
    ]
        
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(0..<20) {post in
                Rectangle()
                    .frame(height: 160)
                    .clipped()
            }
        }
        .padding(.horizontal, 2)
    }
}

#Preview {
    PostGridView()
}
