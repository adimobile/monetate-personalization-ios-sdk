//
//  TrackLocation.swift
//  monetate-ios-sdk-example
//
//  Created by Umar Sayyed on 23/09/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation
import CoreLocation

class MLocation : NSObject {
    
    var monetateLM = CLLocationManager()
    func getLocationSerStatus()-> String {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined, .restricted, .denied:
                return "NotAuthorised"
            case .authorizedWhenInUse:
                return "AuthorizedWhenInUse"
            case .authorizedAlways:
                return "AuthorizedAlways"
            @unknown default:
                return "Unknown"
            }
        }
        else {
            return "Location services is not enabled"
        }
    }
    
    func getCoordinates () {
        if getLocationSerStatus().contains("AuthorizedAlways") || getLocationSerStatus().contains("AuthorizedWhenInUse") {
            monetateLM.delegate = self
        }
    }
}

extension MLocation: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let loc = locations.last else {return }
//        let lat = loc.coordinate.latitude
//        let lng = loc.coordinate.longitude
    }
}



