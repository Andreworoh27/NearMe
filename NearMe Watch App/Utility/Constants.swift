//
//  Constants.swift
//  NearMe Watch App
//
//  Created by Andrew Oroh on 22/05/24.
//

import Foundation
import CoreLocation

var defaultUserLocation = CLLocationCoordinate2D(latitude: 42, longitude: -71)
var generateInitialData : Bool = false

var nearbyFriends : [User] = []
var nearbyStranger : [User] = []
var friendList : [User] = []

var friend : User = User(
    name: "Charlie",
    emoji: "🤠",
    location: CLLocationCoordinate2D(
        latitude: 41,
        longitude: -71))

var dummyFriendlist : [User] = [
    User(
        name: "Bob",
        emoji: "😎",
        location: CLLocationCoordinate2D(
            latitude: 41 ,
            longitude: -71)),
    
    User(
        name: "Charlie",
        emoji: "🤠",
        location: CLLocationCoordinate2D(
            latitude: 41 ,
            longitude: -71)),
]
