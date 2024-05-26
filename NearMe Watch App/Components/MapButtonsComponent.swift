//
//  MapButtonsComponent.swift
//  NearMe Watch App
//
//  Created by Andrew Oroh on 22/05/24.
//

import SwiftUI
import MapKit

struct MapButtonsComponent: View {
    @StateObject var locationServiceManager = LocationServiceManager.shared
    @Binding var displayMode : String
    @Binding var followUser : Bool
    @State var navigateToFriendListView : Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            HStack{
                NavigationLink(destination: FriendListView(), isActive: $navigateToFriendListView) {
                    Button {
                        navigateToFriendListView = true
                    } label: {
                        Image(systemName: "list.bullet")
                    }
                    .background(.gray)
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                }
                .frame(width: 35, height: 35)
                .clipShape(Circle())

                
                Spacer()
                
                Text("\(displayMode)")
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .offset(x: -13)
                
                Spacer()
            }
            
            Spacer()
            
            HStack{
                Button {
                    followUser = followUser == true ? false : true
                } label: {
                    followUser == true ? Image(systemName: "location.fill") : Image(systemName: "location")
                }
                .background(.gray)
                .frame(width: 35, height: 35)
                .clipShape(Circle())
                
                Spacer()
                
                Button {
                    displayMode = displayMode == "Stranger" ? "Friends" : "Stranger"
                } label: {
                    Image(systemName: displayMode == "Stranger" ? "person.2.fill" : "person.fill.badge.plus")
                }
                .background(.gray)
                .frame(width: 35, height: 35)
                .clipShape(Circle())
            }
        }
        .padding(15)
    }
}

//#Preview {
//    MapButtonsComponent(displayMode: .constant("Friends"), mapCameraPosition: <#Binding<MapCameraPosition>#>)
//}
