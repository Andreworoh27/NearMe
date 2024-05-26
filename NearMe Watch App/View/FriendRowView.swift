//
//  FriendRowView.swift
//  NearMe Watch App
//
//  Created by Andrew Oroh on 24/05/24.
//

import SwiftUI

struct FriendRowView: View {
    var friend : User

    var body: some View {
        HStack {
            Text(friend.getUserEmoji())
                .font(.title)
            Text(friend.getUserName())
            Spacer()
        }
        .padding()
    }
    
}

#Preview {
    FriendRowView(friend: friend)
}
