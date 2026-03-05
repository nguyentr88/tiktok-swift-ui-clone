//
//  CurrentUserProfileView.swift
//  tiktok-swift-clone
//
//  Created by Tr NguyenH8 on 3/3/26.
//

import SwiftUI

struct CurrentUserProfileView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (spacing: 2) {
                    ProfileHeaderView()
                    PostGridView()
                }
                .padding(.top)
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
