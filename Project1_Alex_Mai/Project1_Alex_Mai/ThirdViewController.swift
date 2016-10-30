//
//  ThirdViewController.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 10/26/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

//This class details the personal information of the user
class ThirdViewController: UITableViewController {
    
//    var ViewController: ViewController
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var imageViewer: UIImageView!
    @IBOutlet var emergencyContact: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //insets
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        //auto adjust table row height
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65  
        
        
        //autopopulate the user's information given login
        nameLabel.text = AccountManager.sharedInstance.accounts[0].name
        emailLabel.text = AccountManager.sharedInstance.accounts[0].email
        genderLabel.text = AccountManager.sharedInstance.accounts[0].gender
        ageLabel.text = (String) (AccountManager.sharedInstance.accounts[0].age)
        let image = UIImage(named: AccountManager.sharedInstance.accounts[0].image)
        imageViewer.image = image
        emergencyContact.text = AccountManager.sharedInstance.accounts[0].emergencyContact
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
