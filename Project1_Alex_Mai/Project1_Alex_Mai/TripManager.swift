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
        trips["admin"] = [Trip("Saint Louis", "Rochester", "09092018", "10112018", "2", "American", "900", false, false, "For fun", "approved")]
        
        
    }
    
    //adding trips
    func addSpontaneousTrip(_ login: String) -> Int? {
        let hardCodedTrips = [
            Trip("Rochester", "Hawaii", "01012017", "05012017", "2", "American", "10000", true, false, "Spontaneous vacation", "approved"),
            Trip("Rochester", "New York City", "12232016", "01162016", "1", "American", "1000", true, false, "Winter Break", "approved"),
            Trip("Rochester", "Los Angeles", "01162017", "06302017", "1", "American", "6000", false, true, "Running away from winter", "approved"), Trip("Rochester", "Seattle", "06012017", "08282017", "1", "Chinese", "800", false, false, "Eat, Pray, Love", "approved"),
            Trip("Rochester", "Toronto", "11242017", "11282017", "5", "American, Indian", "600", false, true, "Thanksgiving break", "approved")]
        
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
