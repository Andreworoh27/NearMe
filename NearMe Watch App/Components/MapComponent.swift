//
//  MapComponents.swift
//  NearMe Watch App
//
//  Created by Andrew Oroh on 22/05/24.
//

import SwiftUI
import MapKit

struct MapComponent: View {
    @StateObject var locationServiceManager = LocationServiceManager.shared
    var otherUsers : [User]
    @Binding var displayMode : String
    @State var followUser : Bool = true
    @State var mapCamera : MapCameraPosition = .userLocation(
        followsHeading: true,
        fallback: .item(MKMapItem(
            placemark: MKPlacemark(
                coordinate: LocationServiceManager.shared.userLocation
            ))))
    @State var showValidationSheet : Bool = false
    @State var navigateUsingMap : Bool = false
    
    var mapCameraBounds = MapCameraBounds(minimumDistance: 2000,maximumDistance: 5000)
    
    var body: some View {
        ZStack{
            Map(position: $mapCamera,
                bounds: mapCameraBounds
            ){
                if !followUser{
                    // User's annotation
                    Annotation("", coordinate: locationServiceManager.userLocation) {
                        ZStack {
                            Circle()
                                .strokeBorder(.white, lineWidth: 2)
                                .background(Circle().fill(Color.blue))
                                .frame(width: 25, height: 25)
                        }
                    }
                }
                
                //other user's annotation
                ForEach(otherUsers) { user in
                    Annotation(user.getUserName(), coordinate: user.getUserLocation()) {
                        ZStack {
                            if displayMode == "Friends"{
                                Button{
                                    showValidationSheet = true
                                }label: {
                                    ZStack{
                                        Circle()
                                            .strokeBorder(.white, lineWidth: 2)
                                            .background(Circle().fill(Color.green))
                                            .frame(width: 25, height: 25)
                                        Text(user.getUserEmoji())
                                    }
                                }
                                .sheet(isPresented: $showValidationSheet, content: {
                                    NagivateUsingMapValidationComponent(navigateUsingMap: $navigateUsingMap, showValidationSheet: $showValidationSheet,userItem: MKMapItem(placemark: MKPlacemark(coordinate: user.getUserLocation())))
                                })
                                .frame(width: 27, height: 27)
                                .clipShape(Circle())
                            }
                            else{
                                NavigationLink(destination: AddNewFriendView(newFriend: user)) {
                                    ZStack {
                                        Circle()
                                            .strokeBorder(.white, lineWidth: 2)
                                            .background(Circle().fill(Color.green))
                                            .frame(width: 25, height: 25)
                                        Text(user.getUserEmoji())
                                    }
                                    .frame(width: 27, height: 27)
                                    .clipShape(Circle())
                                }
                                .frame(width: 27, height: 27)
                                .clipShape(Circle())
                            }
                        }
                    }
                }
            }
            .onChange(of: mapCamera.positionedByUser, { oldValue, newValue in
                
                if newValue{
                    mapCamera = .item(MKMapItem(
                        placemark: MKPlacemark(
                            coordinate: LocationServiceManager.shared.getCurrentLocationCoordinate()
                        )
                    ))
                    followUser = false
                }
                
            })
            .onChange(of: followUser) { oldValue, newValue in
                if followUser {
                    mapCamera = .userLocation(followsHeading: true, fallback: .item(MKMapItem(
                        placemark: MKPlacemark(
                            coordinate: LocationServiceManager.shared.userLocation
                        )
                    )))
                    followUser = true
                }
                else{
                    mapCamera = .item(MKMapItem(
                        placemark: MKPlacemark(
                            coordinate: LocationServiceManager.shared.getCurrentLocationCoordinate()
                        )
                    ))
                    followUser = false
                }
            }
            MapButtonsComponent(displayMode: $displayMode, followUser: $followUser)
        }
    }
}
