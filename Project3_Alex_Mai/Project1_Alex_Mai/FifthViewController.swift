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
import MapKit

class FifthViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    //MARK: Outlets
    @IBOutlet weak var tripDestination: UILabel!
    @IBOutlet weak var timeline: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var locationHours: UILabel!
    @IBOutlet weak var locationReviews: UILabel!
    @IBOutlet weak var aroundYou: UILabel!
    @IBOutlet weak var nextdestinationName: UILabel!

    
    //MARK: Actions
    @IBAction func readmoreClicked(_ sender: Any) {
    }
    @IBAction func alreadybeenClicked(_ sender: Any) {
    }
    @IBAction func directionsClicked(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userLocation = locationManager.location {
            print(userLocation.coordinate.latitude)
            print(userLocation.coordinate.longitude)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}
