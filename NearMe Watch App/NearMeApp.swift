//
//  NearMeApp.swift
//  NearMe Watch App
//
//  Created by Andrew Oroh on 22/05/24.
//

import SwiftUI

@main
struct NearMe_Watch_AppApp: App {
   @State var displayMode = "Friends"
    var body: some Scene {
        WindowGroup {
            if displayMode == "Friends"{
                FriendsView(displayMode: $displayMode)
            }else{
                StrangerView(displayMode: $displayMode)
            }
        }
    }
}
