//
//  SecondViewController.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 10/26/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

//This class displays the trips the user has stored
class SecondViewController: UITableViewController {
    //will need to use TripManager singleton because user can create trips from FirstVC
    
    //how many cells need to be created
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var toReturnNumRows = 0
        //get the number of rows needed that's tied from the user's login
        if let numRows = TripManager.sharedInstance.trips[AccountManager.sharedInstance.whoAmI] {
            toReturnNumRows = numRows.count
        }
        
        return toReturnNumRows
    }
    
    //what goes in each cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondViewCell", for: indexPath) as! SecondViewCell
        
        //find all the trips that match the user's login and set the labels
        if let trip = TripManager.sharedInstance.trips[AccountManager.sharedInstance.whoAmI] {
            let trips = trip[indexPath.row]
            
            cell.arrivalDestination.text = trips.arrivalLocationText
            cell.statusLabel.text = trips.statusText
            cell.departureDate.text = trips.departureDateText
            cell.returnDate.text = trips.returnDateText
            cell.purpose.text = trips.purposeText
        }

        
        return cell
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
        tableView.estimatedRowHeight = 130
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

