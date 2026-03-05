//
//  TestStore.swift
//  tiktok-swift-clone
//
//  Created by Tr NguyenH8 on 3/3/26.
//

import SwiftUI
import Combine

class AuthStore: ObservableObject {
    
    @Published var isLoggedIn: Bool = false
    @Published var token: String?
    
}
