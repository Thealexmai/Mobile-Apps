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

    var tripsDataSource: TripDataSource!
    var userTrips: [Trip]?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //find out which cell is clicked
        
//        if segue.identifier == "SecondVC-to-FourthVC" {
//            
//            //get the cell row that has been selected and pass to 4th VC
//            let indexPath:Int = self.tableView.indexPathForSelectedRow!.row
//
//            if let fourthVC = segue.destination as? FourthViewController {
//            
//                fourthVC.cellClicked = indexPath
//                
//            }
//            
//        }
    }
    
    //MARK: Actions
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Hi \(indexPath.row)")
        
        if let trips = userTrips {
            let trip = trips[indexPath.row]
            
            //if the selected row's trip is active, show the 5th view controller
            if(trip.status=="Active") {
                
                
                let fifthViewController = self.storyboard?.instantiateViewController(withIdentifier: "FifthViewController") as! FifthViewController
                
                //pass the array of destinations as a string
                fifthViewController.thisTrip = trip
                
                self.navigationController?.pushViewController(fifthViewController, animated: true)
            }
            else {
                //otherwise show the 4th view controller
                let fourthViewController = self.storyboard?.instantiateViewController(withIdentifier: "FourthViewController") as! FourthViewController
                fourthViewController.cellClicked = indexPath.row
                
                self.navigationController?.pushViewController(fourthViewController, animated: true)
            }
            
            
        }
        
        
    }
    
    //how many cells need to be created
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var toReturnNumRows = 0
        
        //get the number of rows needed that's tied from the user's login
        if let numRows = userTrips {
            toReturnNumRows = numRows.count
        }
        
        return toReturnNumRows
    }
    
    //what goes in each cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondViewCell", for: indexPath) as! SecondViewCell
        
        cell.updateLabels()
        
        //find all the trips that match the user's login and set the labels
        if let trips = userTrips {
            let trip = trips[indexPath.row]
            
            cell.arrivalDestination.text = String(format: NSLocalizedString("cell-trip-arrival", comment: "%@"), trip.arrivalLocation!)
            cell.departureDate.text = String(format: NSLocalizedString("cell-trip-departDate", comment: "depart: %@"), trip.departureDate!)
            cell.returnDate.text = String(format: NSLocalizedString("cell-trip-returnDate", comment: "return: %@"), trip.returnDate!)

        }

        return cell
    }

//    
//    //confirm delete helper method
//    func verifyDelete(_ name: String, _ delete: @escaping (UIAlertAction) -> Void) {
//        let title = String(format: NSLocalizedString("verifyDelete-title", comment: "Delete %@?"), name)
//        let message = String(format: NSLocalizedString("verifyDelete-message", comment: "Are you sure that you want to delete %@?"), title)
//        
//        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
//        
//        let cancelAction = UIAlertAction(title: NSLocalizedString("verifyDelete-cancel", comment: "Cancel"), style: .cancel, handler: nil)
//        ac.addAction(cancelAction)
//        
//        let deleteAction = UIAlertAction(title: NSLocalizedString("verifyDelete-delete", comment: "Delete"), style: .destructive, handler: delete)
//        ac.addAction(deleteAction)
//        
//        present(ac, animated: true, completion: nil)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //insets
        let statusBarHeight = UIApplication.shared.statusBarFrame.height

        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tripsDataSource = TripDataSource()
        userTrips = tripsDataSource.getUserTrips()
        
        self.tableView.reloadData()
        
    }


}

