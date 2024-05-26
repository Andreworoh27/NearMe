//
//  StrangersView.swift
//  NearMe Watch App
//
//  Created by Andrew Oroh on 22/05/24.
//

import SwiftUI

struct StrangerView: View {
    @State var strangers : [User] = []
    @Binding var displayMode : String
    @State var localDisplayMode : String = ""
    @State var addedNewFriend : Bool = false
    var body: some View {
        NavigationView(content: {
            ZStack(alignment: .center){
                MapComponent(otherUsers: strangers,displayMode: $displayMode)
                    .onAppear{
                        localDisplayMode = displayMode
                    }
                //
                //            //page marker
                //            VStack{
                //                Spacer()
                //                PageMarkerComponent(displayMode: displayMode)
                //            }
                //            .padding(10)
            }
            .onAppear{
                listStrangers()
            }
            .ignoresSafeArea()
            .onChange(of: localDisplayMode) { oldValue, newValue in
                displayMode = localDisplayMode
            }
            .onChange(of: friendList){
                listStrangers()
            }
        })
    }
    
    func listStrangers(){
        strangers.removeAll()
        nearbyStranger.forEach { stranger in
            let contain = friendList.contains(where: {$0  == stranger})
            if contain{
                print("stanger \(stranger.getUserName()) is friend")
            }
            else{
                print("stanger \(stranger.getUserName()) not friend")
                strangers.append(stranger)
            }
        }
    }
}
