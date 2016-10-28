//
//  Plan.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 10/27/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation

class Trip:NSObject {
    var departLocationText:String , arrivalLocationText:String, departureDateText:String, returnDateText:String, numTravelersText:String, travelerNationalityText:String, budgetText:String, ofAge:Bool, disabilities:Bool, purposeText:String
    
    init(_ departLocationText:String , _ arrivalLocationText:String, _ departureDateText:String, _ returnDateText:String, _ numTravelersText:String, _ travelerNationalityText:String, _ budgetText:String, _ ofAge:Bool, _ disabilities:Bool, _ purposeText:String) {
        
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
        
    }
}
