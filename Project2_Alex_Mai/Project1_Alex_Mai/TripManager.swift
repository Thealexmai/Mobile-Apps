//
//  TripManager.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 10/27/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation

//Singelton Manages all the trips
class TripManager {
    static let sharedInstance: TripManager = {
        let instance = TripManager()
        
        return instance
    }()
    
    //Local - key = login, value = stored trips
    var trips: [String: [Trip]]
    
    
    private init() {

        trips = [String: [Trip]]()
        
        //initialize the array
        trips[AccountManager.sharedInstance.whoAmI] = []
        trips["admin"] = [Trip("Saint Louis", "Rochester", "09092018", "10112018", "2", NSLocalizedString("American", comment: "American"), "900", false, false, NSLocalizedString("For fun", comment: "For fun purpose of trip"), NSLocalizedString("approved", comment: "approved status"))]
        
        
    }
    
    //adding trips
    func addSpontaneousTrip(_ login: String) -> Int? {
        
        //for localization
        let statusApproved = NSLocalizedString("approved", comment: "approved status")
        let rochester = NSLocalizedString("Rochester", comment: "Rochester as a location")
        
        
        let hardCodedTrips = [
            Trip(rochester, String(format: NSLocalizedString("%@", comment: "location"), "Hawaii"), "01012017", "05012017", "2", "American", "10000", true, false, String(format: NSLocalizedString("%@", comment: "reason"), "Spontaneous vacation"), statusApproved),
            Trip(rochester, String(format: NSLocalizedString("%@", comment: "location"), "New York City"), "12232016", "01162016", "1", String(format: NSLocalizedString("%@", comment: "nationality"), "American"), "1000", true, false, String(format: NSLocalizedString("%@", comment: "reason"), "Winter Break"), statusApproved),
            Trip(rochester, String(format: NSLocalizedString("%@", comment: "location"), "Los Angeles"), "01162017", "06302017", "1", String(format: NSLocalizedString("%@", comment: "nationality"), "American"), "6000", false, true, String(format: NSLocalizedString("%@", comment: "reason"), "Running away from winter"), statusApproved),
            Trip(rochester, String(format: NSLocalizedString("%@", comment: "location"), "Seattle"), "06012017", "08282017", "1", String(format: NSLocalizedString("%@", comment: "nationality"), "Chinese"), "800", false, false, String(format: NSLocalizedString("%@", comment: "reason"), "Eat, Pray, Love"), statusApproved),
            Trip(rochester, String(format: NSLocalizedString("%@", comment: "location"), "Toronto"), "11242017", "11282017", "5", String(format: NSLocalizedString("%@", comment: "nationality"), "American, Indian"), "600", false, true, String(format: NSLocalizedString("%@", comment: "reason"), "Thanksgiving break"), statusApproved)]
        
        let randomIndex = arc4random_uniform(UInt32(hardCodedTrips.count))
        let randomTrip = hardCodedTrips[Int(randomIndex)]
        
        return addTrip(login, randomTrip)
        
    }
    
    func addTrip(_ login:String, _ trip:Trip) -> Int {
        
        if var arr = trips[login] {
            arr.append(trip)
            trips[login] = arr
            print("Done")
        }
        
        
        return trips[login]!.index(of: trip)!
    }
    
    //deleting trips
    func removeTrip(_ login:String, _ trip:Trip) {
        if let tripExists = trips[login] {
            if let index = tripExists.index(of: trip) {
                trips[login]!.remove(at: index)
            }
        }
    }
    
    //moving trips around to prioritize
    func moveTrip(_ login:String, _ from:Int, _ to:Int) {
        //if from index not the same as to index
        if from != to {
            if let tripExists = trips[login] {
                let trip = tripExists[from]
                trips[login]!.remove(at: from)
                trips[login]!.insert(trip, at: to)
            }
        }
    }
}
