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
        
        trips["admin"] = [Trip("Saint Louis", "Rochester", "09091999", "10112014", "2", "American", "300", false, false, "For fun", "approved")]
        
        
    }
    
    func addTrip(_ login:String, _ trip:Trip) {
        
        if var arr = trips[login] {
            arr.append(trip)
            trips[login] = arr
            print("Done")
        }
    }
    
}
