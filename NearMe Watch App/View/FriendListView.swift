//
//  FriendListPage().swift
//  NearMe Watch App
//
//  Created by Andrew Oroh on 24/05/24.
//

import SwiftUI

struct FriendListView: View {
    var body: some View {
        List(friendList){ friend in
            NavigationLink {
                FriendDetailView(friend: friend)
            } label: {
                FriendRowView(friend: friend)
            }
            .navigationTitle("All Friends")
        }
    }
}

#Preview {
    FriendListView()
}
