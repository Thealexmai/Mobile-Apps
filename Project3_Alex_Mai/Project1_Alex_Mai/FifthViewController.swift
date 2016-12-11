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

//mapkit help: https://www.raywenderlich.com/90971/introduction-mapkit-swift-tutorial 
class FifthViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var tripDataSource: TripDataSource!
    var thisTrip: Trip!
    
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
        
        tripDataSource = TripDataSource()
        
        //MARK: Load in known data
        
        //get the trip destinations
        let tripDestinations = tripDataSource.getTripDestinations(trip: thisTrip)
        print(tripDestinations)
        
        tripDestination.text = thisTrip.arrivalLocation
        timeline.text = "Destination \(thisTrip.leg + 1) of \(tripDestinations.count)"
        
        //get the user's location and make the map point to it
        if let userLocation = locationManager.location {
            centerMap(userLocation)
        }
        
        
        
    }
    
    //helper method for map
    func centerMap(_ location: CLLocation) {
        
        let locationDistance: CLLocationDistance = 1000
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, locationDistance*2, locationDistance*2)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
}
