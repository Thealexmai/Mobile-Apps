//
//  FirstViewController.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 10/26/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

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
        
//        print(ofAge.isOn)
        
        if let departLocationText = departLocation.text, let arrivalLocationText = arrivalLocation.text, let departureDateText = departureDate.text, let returnDateText = returnDate.text, let numTravelersText = numTravelers.text, let travelerNationalityText = travelerNationality.text, let budgetText = budget.text, let purposeText = purpose.text {
            
            var trip = Trip(departLocationText, arrivalLocationText, departureDateText, returnDateText, numTravelersText, travelerNationalityText, budgetText, ofAge.isOn, disabilities.isOn, purposeText)
            
            TripManager.sharedInstance.trips
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //insets
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

