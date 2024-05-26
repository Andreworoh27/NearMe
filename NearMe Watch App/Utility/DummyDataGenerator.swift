//
//  DummyDataGenerator.swift
//  NearMe Watch App
//
//  Created by Andrew Oroh on 23/05/24.
//

import Foundation
import CoreLocation


func addNearby(near location : CLLocationCoordinate2D) {
    nearbyFriends.append(User(
        name: "Alice",
        emoji: "😀",
        location: CLLocationCoordinate2D(
            latitude: location.latitude - 0.003,
            longitude: location.longitude + 0.002))
    )
    
    nearbyFriends.append(User(
        name: "Bob",
        emoji: "😎",
        location: CLLocationCoordinate2D(
            latitude: location.latitude + 0.003,
            longitude: location.longitude + 0.002))
    )
    
    nearbyFriends.append(User(
        name: "Charlie",
        emoji: "🤠",
        location: CLLocationCoordinate2D(
            latitude: location.latitude - 0.005,
            longitude: location.longitude + 0.003))
    )
    
    
    nearbyStranger.append(User(
        name: "Aby",
        emoji: "😀",
        location: CLLocationCoordinate2D(
            latitude: location.latitude + 0.002,
            longitude: location.longitude - 0.004))
    )
    
    nearbyStranger.append(User(
        name: "David",
        emoji: "😎",
        location: CLLocationCoordinate2D(
            latitude: location.latitude + 0.003,
            longitude: location.longitude + 0.002))
    )
    
    nearbyStranger.append(User(
        name: "Gibby",
        emoji: "🤠",
        location: CLLocationCoordinate2D(
            latitude: location.latitude - 0.005,
            longitude: location.longitude + 0.003))
    )
    
    
    friendList.append(User(
        name: "Alice",
        emoji: "😀",
        location: CLLocationCoordinate2D(
            latitude: location.latitude - 0.003,
            longitude: location.longitude + 0.002))
    )
    
    friendList.append(User(
        name: "Bob",
        emoji: "😎",
        location: CLLocationCoordinate2D(
            latitude: location.latitude + 0.003,
            longitude: location.longitude + 0.002))
    )
    
    friendList.append(User(
        name: "Charlie",
        emoji: "🤠",
        location: CLLocationCoordinate2D(
            latitude: location.latitude - 0.005,
            longitude: location.longitude + 0.003))
    )
    
    friendList.append(User(
        name: "Alex",
        emoji: "😀",
        location: CLLocationCoordinate2D(
            latitude: location.latitude + 0.019,
            longitude: location.longitude + 0.004))
    )
    
    friendList.append(User(
        name: "Bennie",
        emoji: "🤡",
        location: CLLocationCoordinate2D(
            latitude: location.latitude + 0.003,
            longitude: location.longitude + 0.002))
    )
    
    friendList.append(User(
        name: "Frad",
        emoji: "👻",
        location: CLLocationCoordinate2D(
            latitude: location.latitude - 0.005,
            longitude: location.longitude + 0.003))
    )
}
