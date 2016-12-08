//
//  FifthViewController.swift
//  Project3_Alex_Mai
//
//  Created by Alex Mai on 12/4/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class FifthViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var locationValue: CLLocationCoordinate2D = (manager.location?.coordinate)!
        print("locations \(locationValue.latitude) \(locationValue.longitude)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //when app running request permission from user to use location
        locationManager.requestAlwaysAuthorization()
        
        //when app is in foreground request
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}
