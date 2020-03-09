//
//  LocationsViewController.swift
//  AgriOne App
//
//  Created by Yasith Thathsara Senarathne on 3/7/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import MNkSupportUtilities
import GoogleMaps
import CoreLocation

class LocationsViewController:MNkViewController {
    private var mapView:MapView!
    
    override func config() {
        title = "Location Spreding"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        mapView.setUserRegion()
        setMapPolyLine()
    }
    
    override func createViews() {
        mapView = MapView()
        mapView.map.padding.bottom = -10
    }
    
    override func insertAndLayoutSubviews() {
        view.addSubview(mapView)
        
        mapView.activateLayouts(to: self.view, [.top:0,.leading:0,.traling:0,.bottom:0], true)
    }
    
    private func setMapPolyLine() {
        let path = GMSMutablePath()
        path.add(CLLocationCoordinate2D(latitude: 7.144, longitude: 80.081))
        path.add(CLLocationCoordinate2D(latitude: 7.135, longitude: 80.083))
        path.add(CLLocationCoordinate2D(latitude: 7.135, longitude: 80.089))
        path.add(CLLocationCoordinate2D(latitude: 7.144, longitude: 80.086))
        path.add(CLLocationCoordinate2D(latitude: 7.144, longitude: 80.081))

        let rectangle = GMSPolyline(path: path)
        rectangle.strokeColor = AppColor.chambray
        rectangle.map = mapView.map
    }
}
