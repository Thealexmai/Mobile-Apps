//
//  TripManager.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 10/27/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation

class TripManager {
    static let sharedInstance: TripManager = {
        let instance = TripManager(trips: [:])
        
        return instance
    }()
    
    //Local - key = login, value = stored trips
    var trips: Dictionary<String, [Trip]>
    
    
    private init(trips: Dictionary<String, [Trip]>) {
        self.trips = trips
    }
    
    
    
}
