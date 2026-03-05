//
//  NotificationCell.swift
//  tiktok-swift-clone
//
//  Created by Tr NguyenH8 on 3/3/26.
//

import SwiftUI

struct NotificationCell: View {
    
    var notificationText: AttributedString {
        var name = AttributedString("max.versad")
        name.font = .footnote.bold()

        var message = AttributedString(" liked one of your posts qwe as dqwd qw qw qweq wqwr. ")
        message.font = .footnote

        var time = AttributedString("3d")
        time.font = .caption
        time.foregroundColor = .gray

        return name + message + time
    }
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .frame(width: 32, height: 32)
                .foregroundColor(Color(.systemGray5))
            
            HStack {
                Text(notificationText)
            }
            Spacer()
            Rectangle()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationCell()
}   
