//
//  ExploreView.swift
//  tiktok-swift-clone
//
//  Created by Tr NguyenH8 on 3/3/26.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack (spacing: 16){
                    ForEach(0..<20) { user in
                        UserCell()
                        
                    }
                }
            }
            .padding(.vertical)
            .scrollIndicators(.hidden)
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    
        
    }
}

#Preview {
    ExploreView()
}
