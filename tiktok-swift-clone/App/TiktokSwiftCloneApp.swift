//
//  tiktok_swift_cloneApp.swift
//  tiktok-swift-clone
//
//  Created by Tr NguyenH8 on 3/2/26.
//

import SwiftUI

@main
struct tiktok_swift_cloneApp: App {
    @StateObject var authStore = AuthStore()
    
    var body: some Scene {
        WindowGroup {
            Group {
                MainTabBar()
            }
            .environmentObject(authStore)
        }
    }
}
