//
//  NotificationView.swift
//  tiktok-swift-clone
//
//  Created by Tr NguyenH8 on 3/3/26.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(0..<10) { notification in
                        NotificationCell()
                            .padding(.top)
                    }
                }
            }
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.vertical)
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    NotificationView()
}
