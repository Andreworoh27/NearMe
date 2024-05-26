//
//  FriendDetailView.swift
//  NearMe Watch App
//
//  Created by Andrew Oroh on 24/05/24.
//

import SwiftUI
import MapKit

struct FriendDetailView: View {
    var friend : User
    var body: some View {
        VStack{
            Text(friend.getUserName())
            Spacer()
            Text(friend.getUserEmoji())
                .font(.system(size: 80))
                .fontWeight(.heavy)
            Spacer()
            Button{
                let userItem = MKMapItem(placemark: MKPlacemark(coordinate: friend.getUserLocation()))
                userItem.openInMaps()
                
            }label: {
                Text("Navigate")
            }
        }
        .padding()
//        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    FriendDetailView(friend: friend)
}
