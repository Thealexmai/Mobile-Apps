//
//  FirstViewController.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 10/26/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

//This class is a form - user asks an agent to plan item for him/her
class FirstViewController: UITableViewController{
    
    @IBOutlet var departLocation: UITextField!
    @IBOutlet var arrivalLocation: UITextField!
    @IBOutlet var departureDate: UITextField!
    @IBOutlet var returnDate: UITextField!
    @IBOutlet var numTravelers: UITextField!
    @IBOutlet var travelerNationality: UITextField!
    @IBOutlet var budget: UITextField!
    @IBOutlet var ofAge: UISwitch!
    @IBOutlet var disabilities: UISwitch!
    @IBOutlet var purpose: UITextField!
    
    @IBAction func submitPressed(sender: UIButton) {
        //take all inputs and pass to Second View Controller
        
        purpose.resignFirstResponder()
        
        if let departLocationText = departLocation.text, let arrivalLocationText = arrivalLocation.text, let departureDateText = departureDate.text, let returnDateText = returnDate.text, let numTravelersText = numTravelers.text, let travelerNationalityText = travelerNationality.text, let budgetText = budget.text, let purposeText = purpose.text {
            
            //user-requested trips are pending a travel advisor's plan
            let trip = Trip(departLocationText, arrivalLocationText, departureDateText, returnDateText, numTravelersText, travelerNationalityText, budgetText, ofAge.isOn, disabilities.isOn, purposeText, "pending")
            
            TripManager.sharedInstance.addTrip(AccountManager.sharedInstance.whoAmI, trip)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

