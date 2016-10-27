//
//  FirstViewController.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 10/26/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController{

    var trip: [String] = []
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

