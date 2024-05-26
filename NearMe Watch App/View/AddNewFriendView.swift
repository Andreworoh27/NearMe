//
//  AddNewFriendView.swift
//  NearMe Watch App
//
//  Created by Andrew Oroh on 25/05/24.
//

import SwiftUI

struct AddNewFriendView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var addedNewFriend: Bool = false
    var newFriend: User
    var body: some View {
        VStack{
            VStack{
                Text(newFriend.getUserName())
                Spacer()
                Text(newFriend.getUserEmoji())
                    .font(.system(size: 80))
                    .fontWeight(.heavy)
                Spacer()
                Button{
                    friendList.append(newFriend)
                    addedNewFriend = true
                    self.presentationMode.wrappedValue.dismiss()
                }label: {
                    Text("Add Friend")
                }
            }
            .padding()
        }
    }
}

//#Preview {
//    AddNewFriendView(newFriend: nearbyStranger[0])
//}
