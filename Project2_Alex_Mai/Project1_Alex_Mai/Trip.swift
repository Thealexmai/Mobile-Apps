//
//  Plan.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 10/27/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation

//Creates a trip object - used for displaying all the trips
class Trip: NSObject {
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
    
    func friendlyDateFormat(_ date: String) -> String {
        //there should be 8 chars in MMDDYYYY, only need MMDDYY
        let stringArray = Array(date.characters)
        var month = ""
        month.append(stringArray[0])
        month.append(stringArray[1])
        var day = ""
        day.append(stringArray[2])
        day.append(stringArray[3])
        var year = ""
        year.append(stringArray[6])
        year.append(stringArray[7])

        return month + "/" + day + "/" + year
    }
}
