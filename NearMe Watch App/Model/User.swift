//
//  User.swift
//  NearMe Watch App
//
//  Created by Andrew Oroh on 22/05/24.
//

import Foundation
import CoreLocation

class User:Identifiable,Equatable{
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    private var name : String
    private var emoji : String
    private var location : CLLocationCoordinate2D
    
    init(name: String, emoji: String, location: CLLocationCoordinate2D) {
        self.name = name
        self.emoji = emoji
        self.location = location
    }
    
    func getUserName() -> String{
        return name
    }
    func getUserEmoji() -> String{
        return emoji
    }
    func getUserLocation() -> CLLocationCoordinate2D{
        return location
    }
    
    func setUserName(name : String){
        self.name = name
    }
    func setUserEmoji(emoji : String){
        self.emoji = emoji
    }
    func setUserName(location : CLLocationCoordinate2D){
        self.location = location
    }
    
}
