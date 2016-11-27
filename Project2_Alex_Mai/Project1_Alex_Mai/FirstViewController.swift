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
    
    var departureDatePickerisVisible = false
    var returnDatePickerisVisible = false
  
    //MARK: Outlets
    @IBOutlet var departLocation: UITextField!
    @IBOutlet var arrivalLocation: UITextField!
    @IBOutlet weak var departureDatePickerOutlet: UIDatePicker!
    @IBOutlet weak var returnDatePickerOutlet: UIDatePicker!
    @IBOutlet weak var departureDateLabel: UILabel!
    @IBOutlet weak var returnDateLabel: UILabel!
//    @IBOutlet var departureDate: UITextField!
//    @IBOutlet var returnDate: UITextField!
    @IBOutlet var numTravelers: UITextField!
    @IBOutlet var travelerNationality: UITextField!
    @IBOutlet var budget: UITextField!
    @IBOutlet var ofAge: UISwitch!
    @IBOutlet var disabilities: UISwitch!
    @IBOutlet var purpose: UITextField!
    
    
    //MARK: Actions
    
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
    @IBAction func departureDatePicker(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-YYYY"
        let customDate = dateFormatter.string(from: departureDatePickerOutlet.date)
        
        departureDateLabel.text = customDate
        tempTrip.departureDateText = customDate
    }
    @IBAction func returnDatePicker(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-YYYY"
        let customDate = dateFormatter.string(from: returnDatePickerOutlet.date)
        
        returnDateLabel.text = customDate
        tempTrip.returnDateText = customDate
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
    
    
    
    @IBAction func submitPressed(sender: UIButton) {
        
        //takes all valid input and add to tripmanager
        if let departLocationText = departLocation.text,
            let arrivalLocationText = arrivalLocation.text,
            let departureDateText = departureDateLabel.text,
            let returnDateText = returnDateLabel.text,
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
        departureDateLabel.text = nil
        returnDateLabel.text = nil
        numTravelers.text = nil
        travelerNationality.text = nil
        budget.text = nil
        ofAge.isOn = false
        disabilities.isOn = false
        purpose.text = nil
        
    }

    //delegates used for hiding and showing the cell when dates are selected
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height: CGFloat = 44.0
        
        if (indexPath.row == 3) {
            height = departureDatePickerisVisible ? 193.0 : 0.0
        }
        if (indexPath.row == 5) {
            height = returnDatePickerisVisible ? 193.0 : 0.0
        }
        return height
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 2) {
            //if departure is selected, then it should not show return date
            hideDatePickerCell(returnDatePickerOutlet)
            
            if (!departureDatePickerisVisible) {
                showDatePickerCell(departureDatePickerOutlet)
            }
            else {
                hideDatePickerCell(departureDatePickerOutlet)
            }
        }
        else if (indexPath.row == 4) {
            //if return date is selected, then it should not show departure date
            hideDatePickerCell(departureDatePickerOutlet)
            
            if(!returnDatePickerisVisible) {
                showDatePickerCell(returnDatePickerOutlet)
            }
            else {
                hideDatePickerCell(returnDatePickerOutlet)
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //helper function 1
    func showDatePickerCell(_ picker: UIDatePicker) {
        if (picker == departureDatePickerOutlet) {
            departureDatePickerisVisible = true
            
        }
        else if (picker == returnDatePickerOutlet) {
            returnDatePickerisVisible = true
        }
        
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        
        picker.isHidden = false
        picker.alpha = 0.0
        
        UIView.animate(withDuration: 0.25, animations: { () -> Void in
            picker.alpha = 1.0})
    }
    
    //helper function 2
    func hideDatePickerCell(_ picker: UIDatePicker) {
        if (picker == departureDatePickerOutlet) {
            departureDatePickerisVisible = false
        }
        else if (picker == returnDatePickerOutlet) {
            returnDatePickerisVisible = false
        }
        
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        
        UIView.animate(withDuration: 0.25,
                       animations: { () -> Void in
                        picker.alpha = 0.0},
                       completion: { (bool) -> Void in
                        picker.isHidden = true})
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
    
    override func viewWillAppear(_ animated: Bool) {
        
        departureDatePickerOutlet.isHidden = true
        departureDatePickerOutlet.translatesAutoresizingMaskIntoConstraints = false
        

        returnDatePickerOutlet.isHidden = true
        returnDatePickerOutlet.translatesAutoresizingMaskIntoConstraints = false
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //make initial label to blank
        departureDateLabel.text = ""
        returnDateLabel.text = ""
        
        //insets
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        //Access app delegate to persist the form information
        let myDelegate = UIApplication.shared.delegate as! AppDelegate
        tempTrip = myDelegate.tempTripForm
        
        //load in data if it were previously entered in
        departLocation.text = tempTrip.departLocationText
        arrivalLocation.text = tempTrip.arrivalLocationText
        departureDateLabel.text = tempTrip.departureDateText
        returnDateLabel.text = tempTrip.returnDateText
        numTravelers.text = tempTrip.numTravelersText
        travelerNationality.text = tempTrip.travelerNationalityText
        budget.text = tempTrip.budgetText
        ofAge.isOn = tempTrip.ofAge
        disabilities.isOn = tempTrip.disabilities
        purpose.text = tempTrip.purposeText
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

