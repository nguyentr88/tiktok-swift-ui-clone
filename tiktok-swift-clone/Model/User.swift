//
//  User.swift
//  tiktok-swift-clone
//
//  Created by Tr NguyenH8 on 3/5/26.
//

import Foundation

struct User: Identifiable, Codable {
    
    let id: UUID
    let name: String
    let tax: String
    
    init(name: String, tax: String) {
        self.id = UUID()
        self.name = name
        self.tax = tax
    }
}
