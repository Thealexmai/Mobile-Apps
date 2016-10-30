//
//  Plan.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 10/27/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation

//Creates a trip object - used for displaying all the trips
class Trip:NSObject {
    var departLocationText:String , arrivalLocationText:String, departureDateText:String, returnDateText:String, numTravelersText:String, travelerNationalityText:String, budgetText:String, ofAge:Bool, disabilities:Bool, purposeText:String, statusText: String
    
    init(_ departLocationText:String , _ arrivalLocationText:String, _ departureDateText:String, _ returnDateText:String, _ numTravelersText:String, _ travelerNationalityText:String, _ budgetText:String, _ ofAge:Bool, _ disabilities:Bool, _ purposeText:String, _ statusText:String) {
        
        self.departLocationText = departLocationText
        self.arrivalLocationText = arrivalLocationText
        self.departureDateText = departureDateText
        self.returnDateText = returnDateText
        self.numTravelersText = numTravelersText
        self.travelerNationalityText = travelerNationalityText
        self.budgetText = budgetText
        self.ofAge = ofAge
        self.disabilities = disabilities
        self.purposeText = purposeText
        self.statusText = statusText
        
    }
}
