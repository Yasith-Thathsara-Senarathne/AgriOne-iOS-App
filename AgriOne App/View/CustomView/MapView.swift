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
//        map.isMyLocationEnabled = true
//        map.settings.myLocationButton = true
        map.settings.scrollGestures = true
        map.settings.zoomGestures = true
        map.settings.rotateGestures = true
        map.settings.tiltGestures = true
        map.isIndoorEnabled = false
        let styleUrl = Bundle.main.url(forResource: "style_json", withExtension: "json")!
        map.mapStyle = try? GMSMapStyle.init(contentsOfFileURL: styleUrl)
        map.delegate = self
    }
    
    override func insertAndLayoutSubviews() {
        addSubview(map)
        
        map.activateLayouts(to: self)
    }
    
    func setUserRegion(){
//        guard let coodinate = locationManager.currentLocation?.coordinate else{return}
//        print("lat",coodinate.latitude)
//        print("lang",coodinate.longitude)
        let coodinate = CLLocationCoordinate2D.init(latitude: 7.139555303279309, longitude: 80.08497431874275)
        map.camera = GMSCameraPosition.init(target: coodinate, zoom: 15.8, bearing: 0, viewingAngle: 0)
    }
}

extension MapView:GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("Coordinates: ",coordinate)
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
