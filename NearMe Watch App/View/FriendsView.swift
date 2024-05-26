//
//  FriendsView.swift
//  NearMe Watch App
//
//  Created by Andrew Oroh on 22/05/24.
//

import SwiftUI
import MapKit

struct FriendsView: View {
    @StateObject var locationServiceManager = LocationServiceManager()
    @Binding var displayMode : String
    @State var localDisplayMode : String = ""
    
    
    var body: some View {
        NavigationView(content: {
            ZStack(alignment: .center){
                MapComponent(otherUsers: nearbyFriends,displayMode: $displayMode)
                
//                //page marker
//                VStack{
//                    Spacer()
//                    PageMarkerComponent(displayMode: localDisplayMode)
//                }
//                .padding(10)
            }
            .onAppear {
                localDisplayMode = displayMode
                if !generateInitialData{
                    fetchUserLocationAndAddFriends()
                    
                }
            }
            .ignoresSafeArea()
            .onChange(of: localDisplayMode) { oldValue, newValue in
                displayMode = localDisplayMode
            }
        })
        
    }
    
    private func fetchUserLocationAndAddFriends() {
        addNearby(near: locationServiceManager.getCurrentLocationCoordinate())
        generateInitialData = true
    }
}


//#Preview {
//    FriendsView(displayMode: .constant("Friends"))
//}

