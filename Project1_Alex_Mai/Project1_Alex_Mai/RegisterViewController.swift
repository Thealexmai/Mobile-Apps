//
//  RegisterViewController.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 11/1/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class RegisterViewController: UITableViewController {
    

    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var gender: UITextField!
    
    @IBOutlet weak var age: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var emergencyEmail: UITextField!
    
    @IBOutlet weak var login: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        
        //if all are not null
        if let nameText = name.text, let genderText = gender.text, let ageText = age.text, let emailText = email.text, let emergencyEmailText = emergencyEmail.text, let loginText = login.text, let passwordText = password.text {
            
            //convert login to lowercase
            let lowercaseLogin = loginText.lowercased()
            
            // if empty, then alert user to fill it in
            if (nameText.isEmpty || genderText.isEmpty || ageText.isEmpty || emailText.isEmpty || emergencyEmailText.isEmpty || lowercaseLogin.isEmpty || passwordText.isEmpty) {
                //exit out of the method tell user that something's empty
                promptUser("One of the fields is empty", true, { (UIAlertAction) in
                    return
                })
            }
            else if (AccountManager.sharedInstance.matchesOtherLogin(lowercaseLogin)) {
                //if login matches one of the logins already in the array, then deny account creation and alert user to choose another
                promptUser("Login already exists, please choose another one!", true, { (UIAlertAction) in
                    return
                })
            }
            else if (containsIllegalCharacters(nameText) || containsIllegalCharacters(ageText) || containsIllegalCharacters(emailText) || containsIllegalCharacters(emergencyEmailText) || containsIllegalCharacters(lowercaseLogin) || containsIllegalCharacters(passwordText)) {
                //blacklisted a few characters
                promptUser("Do not use any characters like /\\", true, { (UIAlertAction) in
                    return
                })
            }
            else {
                //insert into the Singleton
                let newAccount = Account(nameText, genderText, Int(ageText)!, "trump.jpg", lowercaseLogin, passwordText, emailText, emergencyEmailText)
                
                AccountManager.sharedInstance.addAccount(newAccount)
                
                //show alert saying true and dismiss this view controller
                promptUser("Your account has been created! Please log in", false, { (UIAlertAction) in
                    self.dismiss(animated: true, completion: nil)
                })
                
            }
        }
        
        
    }
    
    //to check the for bad strings
    func containsIllegalCharacters(_ string: String) -> Bool {
        if string.contains("/") {
            return true
        }
        else if string.contains("\\") {
            return true
        }
        else {
            return false
        }

    }
    
    //prompt User with message - warn and confirm account deletion
    func promptUser(_ message: String, _ warning:Bool, _ dismiss: @escaping (UIAlertAction) -> Void) {
        
        if (warning) {
            let title = "Error!"
            let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)

            let warningMessage = UIAlertAction(title: "Fix Error", style: .cancel, handler: dismiss)
            ac.addAction(warningMessage)
            
            present(ac, animated: true, completion: nil)
        }
        else {
            let title = "Registration Successful!"
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)

            let confirmMessage = UIAlertAction(title: "Return to login", style: .default, handler: dismiss)
            ac.addAction(confirmMessage)
            
            present(ac, animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
