//
//  MapView.swift
//  AgriOne App
//
//  Created by Yasith Thathsara Senarathne on 3/7/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities
import GoogleMaps

class MapView:MNkView {
    var map:GMSMapView!
    
    private let locationManager = LocationMangerHelper.standard
    
    override func config() {
        locationManager.delegate = self
    }
    
    override func createViews() {
        map = GMSMapView()
        map.isMyLocationEnabled = true
        let styleUrl = Bundle.main.url(forResource: "style_json", withExtension: "json")!
        map.mapStyle = try? GMSMapStyle.init(contentsOfFileURL: styleUrl)
    }
    
    override func insertAndLayoutSubviews() {
        addSubview(map)
        
        map.activateLayouts(to: self)
    }
    
    func setUserRegion(){
        guard let coodinate = locationManager.currentLocation?.coordinate else{return}
        map.camera = GMSCameraPosition.init(target: coodinate, zoom: 13, bearing: 0, viewingAngle: 0)
    }
}

/*....................................
 Mark:- Mapview delegate protocols
 ....................................*/
extension MapView:LocationMangerHelperDelegate{
    func didUpdateLocation(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        setUserRegion()
    }
}
