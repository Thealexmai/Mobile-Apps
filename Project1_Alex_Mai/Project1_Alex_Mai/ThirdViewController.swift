//
//  ThirdViewController.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 10/26/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class ThirdViewController: UITableViewController {
    
//    var ViewController: ViewController
    var accountKeeper: AccountKeeper!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var imageViewer: UIImageView!
    @IBOutlet var emergencyContact: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        accountKeeper = AccountKeeper()
        nameLabel.text = accountKeeper.accounts[0].name
        emailLabel.text = accountKeeper.accounts[0].email
        genderLabel.text = accountKeeper.accounts[0].gender
        ageLabel.text = (String) (accountKeeper.accounts[0].age)
        let image = UIImage(named: accountKeeper.accounts[0].image)
        imageViewer.image = image
        emergencyContact.text = accountKeeper.accounts[0].emergencyContact
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
