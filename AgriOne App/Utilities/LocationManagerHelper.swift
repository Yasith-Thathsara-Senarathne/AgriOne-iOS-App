//
//  LocationManagerHelper.swift
//  AgriOne App
//
//  Created by Yasith Thathsara Senarathne on 3/7/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationMangerHelperDelegate:class{
    func didUpdateLocation(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
}
class LocationMangerHelper:NSObject{
    weak var delegate:LocationMangerHelperDelegate?
    private let locationManager:CLLocationManager
    
    static var standard = LocationMangerHelper()
    override init() {
        locationManager = CLLocationManager()
        super.init()
        checkLocationServices()
    }
    
    var currentLocation:CLLocation?{
        return locationManager.location
    }
    
    private func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled(){
            configLocationManger()
            checkAuthentication()
        }else{
            //show location manger not activate alert
            print("location not arrived")
        }
    }
    
    private func configLocationManger(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func checkAuthentication(){
        switch CLLocationManager.authorizationStatus(){
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .authorizedAlways:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            break
        @unknown default:
            break
        }
    }
    
    func distance(from fromCoordinate:CLLocationCoordinate2D,to toCoordinate:CLLocationCoordinate2D)->Double{
        let fromLocation = CLLocation(latitude: fromCoordinate.latitude, longitude: fromCoordinate.longitude)
        let toLocation = CLLocation(latitude: toCoordinate.latitude, longitude: toCoordinate.longitude)
        return fromLocation.distance(from: toLocation) / 1000
    }
}

extension LocationMangerHelper:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        delegate?.didUpdateLocation(manager, didUpdateLocations: locations)
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkAuthentication()
    }
}
