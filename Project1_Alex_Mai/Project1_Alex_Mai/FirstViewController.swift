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
        //resign first responder whichever is active
        departLocation.resignFirstResponder()
        arrivalLocation.resignFirstResponder()
        departureDate.resignFirstResponder()
        returnDate.resignFirstResponder()
        numTravelers.resignFirstResponder()
        travelerNationality.resignFirstResponder()
        budget.resignFirstResponder()
        purpose.resignFirstResponder()
        
        //reset the text fields to be blank
        departLocation.text = nil
        arrivalLocation.text = nil
        departureDate.text = nil
        returnDate.text = nil
        numTravelers.text = nil
        travelerNationality.text = nil
        budget.text = nil
        ofAge.isOn = false
        disabilities.isOn = false
        purpose.text = nil
        
        //take all valid inputs and pass to Second View Controller
        if let departLocationText = departLocation.text,
            let arrivalLocationText = arrivalLocation.text,
            let departureDateText = departureDate.text,
            let returnDateText = returnDate.text,
            let numTravelersText = numTravelers.text,
            let travelerNationalityText = travelerNationality.text,
            let budgetText = budget.text,
            let purposeText = purpose.text {
            
            //user-requested trips are pending a travel advisor's plan
            let trip = Trip(departLocationText, arrivalLocationText, departureDateText, returnDateText, numTravelersText, travelerNationalityText, budgetText, ofAge.isOn, disabilities.isOn, purposeText, "pending")
            
            dump(trip) //dumping for now, later will add to database
            
            confirmButtonPressed()
        }
    }
    
    //confirm button pressed
    func confirmButtonPressed() {
        let title = "Information captured!"
        let message = "The information you entered has been submitted to our team. One of our advisors will reach out to you for more information."
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let confirmAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        ac.addAction(confirmAction)

        
        present(ac, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //insets
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let tabBarHeight = self.tabBarController?.tabBar.frame.size.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: tabBarHeight!, right: 0)
        
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

