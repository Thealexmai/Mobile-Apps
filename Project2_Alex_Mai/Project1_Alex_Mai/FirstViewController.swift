//
//  FirstViewController.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 10/26/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

//This class is a form - user asks an agent to plan item for him/her
class FirstViewController: UITableViewController {
    
    var tempTrip: TempTrip!
//    var toReturnNumRows: Int!
    
    //MARK: Outlets
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
    
    
    //MARK: Actions
    @IBAction func submitPressed(sender: UIButton) {
        
        //takes all valid input and add to tripmanager
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
            
            //add this trip into the singleton
            
            _ = TripManager.sharedInstance.addTrip(AccountManager.sharedInstance.whoAmI, trip)
            
            confirmButtonPressed()
        }
        
        //resign first responder whichever is active
        view.endEditing(true)
        
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
        
    }
    
    @IBAction func departLocationValueChanged(_ sender: Any) {
        if let departLocationString = departLocation.text {
            tempTrip.departLocationText = departLocationString
        }
    }
    @IBAction func arrivalLocationValueChanged(_ sender: Any) {
        if let arrivalLocationString = arrivalLocation.text {
            tempTrip.arrivalLocationText = arrivalLocationString
        }

    }
    @IBAction func departureDateValueChanged(_ sender: Any) {
        if let departureDateString = departureDate.text {
            tempTrip.departureDateText = departureDateString
        }
    }
    @IBAction func returnDateValueChanged(_ sender: Any) {
        if let returnDateString = returnDate.text {
            tempTrip.returnDateText = returnDateString
        }
    }
    @IBAction func numTravelersValueChanged(_ sender: Any) {
        if let numTravelersString = numTravelers.text {
            tempTrip.numTravelersText = numTravelersString
        }
    }
    @IBAction func nationalitiesValueChanged(_ sender: Any) {
        if let nationalitiesString = travelerNationality.text {
            tempTrip.travelerNationalityText = nationalitiesString
        }
    }
    @IBAction func budgetValueChanged(_ sender: Any) {
        if let budgetString = budget.text {
            tempTrip.budgetText = budgetString
        }
    }
    @IBAction func ofAgeValueChanged(_ sender: Any) {
        tempTrip.ofAge = ofAge.isOn
    }
    @IBAction func disabilitiesValueChanged(_ sender: Any) {
        tempTrip.disabilities = disabilities.isOn
    }
    @IBAction func purposeValueChanged(_ sender: Any) {
        if let purposeString = purpose.text {
            tempTrip.purposeText = purposeString
        }
    }

    
    //confirm button pressed
    func confirmButtonPressed() {
        let title = NSLocalizedString("info-captured", comment: "Information captured!")
        let message = NSLocalizedString("info-submitted", comment: "The information you entered has been submitted to our team. One of our advisors will reach out to you for more information.")
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let confirmAction = UIAlertAction(title: NSLocalizedString("ok", comment: "Ok"), style: .default, handler: nil)
        ac.addAction(confirmAction)

        
        present(ac, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //insets
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        let myDelegate = UIApplication.shared.delegate as! AppDelegate
        tempTrip = myDelegate.tempTripForm
        
        //load in data if it were previously entered in
        departLocation.text = tempTrip.departLocationText
        arrivalLocation.text = tempTrip.arrivalLocationText
        departureDate.text = tempTrip.departureDateText
        returnDate.text = tempTrip.returnDateText
        numTravelers.text = tempTrip.numTravelersText
        travelerNationality.text = tempTrip.travelerNationalityText
        budget.text = tempTrip.budgetText
        ofAge.isOn = tempTrip.ofAge
        disabilities.isOn = tempTrip.disabilities
        purpose.text = tempTrip.purposeText
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

