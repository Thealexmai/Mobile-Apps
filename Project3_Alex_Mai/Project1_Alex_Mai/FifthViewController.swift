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
//map item https://developer.apple.com/reference/mapkit/mkmapitem

class FifthViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var tripDataSource: TripDataSource!
    var thisTrip: Trip! //is injected by 4thVC
    var placeIDFetcher: PlaceIDFetcher!
    var placeDetailFetcher: PlaceDetailFetcher!
    var urlToInject: String!
    
    
    //MARK: Outlets
    @IBOutlet weak var tripDestination: UILabel!
    @IBOutlet weak var timeline: UILabel!
    @IBOutlet weak var returnDate: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var locationHours: UILabel!
    @IBOutlet weak var locationReviews: UILabel!
    @IBOutlet weak var nextdestinationName: UILabel!
    @IBOutlet weak var readmoreButton: UIButton!

    
    //MARK: Actions
    @IBAction func alreadybeenClicked(_ sender: Any) {
        
        let tripDestinations = tripDataSource.getTripDestinations(trip: thisTrip)

        if (Int(thisTrip.leg) < (tripDestinations.count-1)) {
        //update table
        print(tripDataSource.updateLeg(trip: thisTrip, leg: thisTrip.leg+1))
        
        //update the view
            //next destination is leg + 1
        timeline.text = "Destination \(thisTrip.leg + 1) of \(tripDestinations.count)"

        nextdestinationName.text = "Next Destination: \(tripDestinations[Int(thisTrip.leg)])"
            
        }
        else {
            nextdestinationName.text = "Trip complete!"
            promptUser("Congratulations!", { (alert) in })

        }
        
    }
    
    @IBAction func directionsClicked(_ sender: Any) {

        let tripDestinations = tripDataSource.getTripDestinationsAsDestinations(trip: thisTrip)
        let nextDestination = tripDestinations[Int(thisTrip.leg)]
        
        let coordinate = CLLocationCoordinate2DMake(nextDestination.latittude, nextDestination.longitude)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        mapItem.name = nextDestination.place
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDefault])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FifthVC-to-SixthVC" {
            if let sixthVC = segue.destination as? SixthViewController {

                sixthVC.url = urlToInject

            }

        }
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
        returnDate.text = "Returning: \(thisTrip.returnDate)"
        
        
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
                                if let website = placeDetail.website {
                                    self.readmoreButton.isEnabled = true
                                    self.readmoreButton.setTitle("Click to read more", for: .normal)
                                    self.urlToInject = website
                                    
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
            
            
        }
        
        nextdestinationName.text = "Next Destination: \(tripDestinations[Int(thisTrip.leg)])"
        
    }
    
    //helper method for map
    func centerMap(_ location: CLLocation) {
        
        let locationDistance: CLLocationDistance = 1000
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, locationDistance*2, locationDistance*2)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    //helper method for prompt
    func promptUser(_ message: String, _ dismiss: @escaping (UIAlertAction) -> Void) {
        
            let title = NSLocalizedString("Trip Finished", comment: "Trip Finished!")
            let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let warningMessage = UIAlertAction(title: NSLocalizedString("You finished your trip! Let's plan another!", comment: "You finished your trip! Let's plan another!"), style: .cancel, handler: dismiss)
            ac.addAction(warningMessage)
            
            present(ac, animated: true, completion: nil)
        
    }
}
