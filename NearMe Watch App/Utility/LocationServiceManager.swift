//
//  LocationServiceManager.swift
//  NearMe Watch App
//
//  Created by Andrew Oroh on 22/05/24.
//

import Foundation
import CoreLocation

class LocationServiceManager: NSObject,ObservableObject, CLLocationManagerDelegate{
    static let shared = LocationServiceManager()
    
    private let locationManager = CLLocationManager()
    @Published var userLocation = CLLocationCoordinate2D()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        print(locationManager.authorizationStatus)
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = CLLocationDistance(50)
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
        userLocation = locationManager.location?.coordinate ?? CLLocationCoordinate2D(latitude: 41, longitude: -71)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus{
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            manager.stopUpdatingLocation()
        case .authorizedWhenInUse, .authorizedAlways:
            manager.startUpdatingLocation()
        @unknown default:
            print("Unknown location authorization status")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.count)
        if let lastLocation = locations.last {
            DispatchQueue.main.async {
                self.userLocation = lastLocation.coordinate
            }
        }
    }
    
    func getCurrentLocationCoordinate()->CLLocationCoordinate2D{
        return locationManager.location!.coordinate
    }
}

