//
//  UserStatView.swift
//  tiktok-swift-clone
//
//  Created by Tr NguyenH8 on 3/3/26.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.bold)
            Text(title)
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .frame(width: 50, alignment: .center)
    }
}

#Preview {
    UserStatView(value: 100, title: "Followers")
}
