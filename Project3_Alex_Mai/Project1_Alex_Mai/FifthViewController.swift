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
    var placeIDFetcher: PlaceIDFetcher!
    var placeDetailFetcher: PlaceDetailFetcher!
    
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
    @IBOutlet weak var readmoreButton: UIButton!

    
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
        placeIDFetcher = PlaceIDFetcher()
        placeDetailFetcher = PlaceDetailFetcher()
        
        readmoreButton.setTitle("", for: .disabled)
        
        
        //MARK: Load in known data
        
        //get the trip destinations
        let tripDestinations = tripDataSource.getTripDestinations(trip: thisTrip)
        print(tripDestinations)
        
        tripDestination.text = thisTrip.arrivalLocation
        timeline.text = "Destination \(thisTrip.leg + 1) of \(tripDestinations.count)"
        
        if let userLocation = locationManager.location {
            print("\(userLocation.coordinate.latitude) , \(userLocation.coordinate.longitude)")
            //get the user's location and make the map point to it
            centerMap(userLocation)
            
            //fill in details about this place
            //1. reverse geo-locate to get place ID from coordinates, 2. do place details search
            placeIDFetcher.fetchPlaceID(for: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude) {
                (PlaceIDResult) -> Void in
                
                switch(PlaceIDResult) {
                case let .PlaceIDSuccess(placeID):
                    //make a Google Place details search
                    self.placeDetailFetcher.fetchPlaceDetails(for: placeID.id!) {
                        (placeDetailInfo) -> Void in
                        
                        switch(placeDetailInfo) {
                        case let .PlaceDetailSuccess(placeDetail):
                            OperationQueue.main.addOperation() {
                                self.address.text = placeDetail.formattedAddress
                                self.locationName.text = "Name: \(placeDetail.name!)"
                                if let open_now = placeDetail.open_now {
                                    self.locationHours.text = "Open now: \(open_now.description))"
                                }
                                else {
                                    self.locationHours.text = "Open now information unavailable"
                                }
                                if let rating = placeDetail.rating {
                                    self.locationReviews.text = "Rating: \(rating.description)"
                                }
                                else {
                                    self.locationReviews.text = "Rating information unavailable"
                                }
                                //if the website exists, then enable it to segue into 6thVC to link it there
                                if (placeDetail.website != nil) {
                                    self.readmoreButton.isEnabled = true
                                    self.readmoreButton.setTitle("Click to read more", for: .normal)
                                    
                                }
                            }
                        case let .PlaceDetailFailure(error):
                            print("error \(error)")
                        
                        }
                    } //end .fetchPlaceDetails()
                case let .PlaceIDFailure(error):
                    print("error: \(error)")
                }
            } //end fetchPlaceID()
            
            
            //search around user
            
            
        }
        
        
    }
    
    //helper method for map
    func centerMap(_ location: CLLocation) {
        
        let locationDistance: CLLocationDistance = 1000
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, locationDistance*2, locationDistance*2)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
}
