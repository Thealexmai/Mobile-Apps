//
//  SecondViewController.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 10/26/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

// Localize strings with variables - https://craiggrummitt.com/2015/02/13/localization-playing-nicely-with-string-interpolation-in-swift/


import UIKit

//This class displays the trips the user has stored
class SecondViewController: UITableViewController {
    //will need to use TripManager singleton because user can create trips from FirstVC
    
    //Actions
    @IBAction func spontaneousButtonPressed(_ sender: UIButton) {
        if let index = TripManager.sharedInstance.addSpontaneousTrip(AccountManager.sharedInstance.whoAmI) {
            let indexPath = NSIndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
            
        }
    }
    @IBAction func editButtonPressed(_ sender: UIButton) {
        if isEditing == false {
            setEditing(true, animated: true)
            sender.setTitle(NSLocalizedString("edit-done", comment: "Done"), for: UIControlState.normal)
        }
        else {
            setEditing(false, animated: true)
            sender.setTitle(NSLocalizedString("edit-edit", comment: "Edit"), for: UIControlState.normal)
        }
    }
    
    //how many cells need to be created
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var toReturnNumRows = 0
        //get the number of rows needed that's tied from the user's login
        if let numRows = TripManager.sharedInstance.trips[AccountManager.sharedInstance.whoAmI] {
            toReturnNumRows = numRows.count
            print(toReturnNumRows)
        }
        
        return toReturnNumRows
    }
    
    //what goes in each cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondViewCell", for: indexPath) as! SecondViewCell
        
        cell.updateLabels()
        
        //find all the trips that match the user's login and set the labels
        if let trip = TripManager.sharedInstance.trips[AccountManager.sharedInstance.whoAmI] {
            let trips = trip[indexPath.row]
            
            print("cell ran once")
            
            
            
            cell.arrivalDestination.text = String(format: NSLocalizedString("cell-trip-arrival", comment: "%@"), trips.arrivalLocationText)
            cell.departureDate.text = String(format: NSLocalizedString("cell-trip-departDate", comment: "depart: %@"), trips.friendlyDateFormat(trips.departureDateText))
            cell.returnDate.text = String(format: NSLocalizedString("cell-trip-returnDate", comment: "return: %@"), trips.friendlyDateFormat(trips.returnDateText))
            cell.statusLabel.text = String(format: NSLocalizedString("cell-trip-status", comment: "status: %@"), trips.statusText)
//            cell.purpose.text = trips.purposeText
        }

        
        return cell
    }
    
    //delete cell
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let trip = TripManager.sharedInstance.trips[AccountManager.sharedInstance.whoAmI] {
                let deleteTrip = trip[indexPath.row]
                //send alert to verify
                verifyDelete(deleteTrip.arrivalLocationText, { (UIAlertAction) in
                    TripManager.sharedInstance.removeTrip(AccountManager.sharedInstance.whoAmI, deleteTrip)
                    self.tableView.deleteRows(at: [indexPath], with: .automatic)
                })
                
            }
        }
    }
    
    //rearrange cells
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        TripManager.sharedInstance.moveTrip(AccountManager.sharedInstance.whoAmI, sourceIndexPath.row, destinationIndexPath.row)
    }
    
    //confirm delete helper method
    func verifyDelete(_ name: String, _ delete: @escaping (UIAlertAction) -> Void) {
        let title = String(format: NSLocalizedString("verifyDelete-title", comment: "Delete %@?"), name)
        let message = String(format: NSLocalizedString("verifyDelete-message", comment: "Are you sure that you want to delete %@?"), title)
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("verifyDelete-cancel", comment: "Cancel"), style: .cancel, handler: nil)
        ac.addAction(cancelAction)
        
        let deleteAction = UIAlertAction(title: NSLocalizedString("verifyDelete-delete", comment: "Delete"), style: .destructive, handler: delete)
        ac.addAction(deleteAction)
        
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
        
        //adjust height if necessary
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

