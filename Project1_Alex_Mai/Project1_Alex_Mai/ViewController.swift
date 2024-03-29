//
//  ViewController.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 10/26/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

//This class handles the login
class ViewController: UIViewController, UITextFieldDelegate {
        
    //Outlets
    @IBOutlet var loginText: UITextField!
    @IBOutlet var passwordText: UITextField!

    //Action
    @IBAction func loginTextChanged(sender: UITextField) {
        
    }
    @IBAction func passwordTextChanged(sender: UITextField) {
        
    }
    
    //Gesture recognize to dismiss keyboard
    @IBAction func dismissKeyboard(sender: AnyObject) {
        loginText.resignFirstResponder()
        passwordText.resignFirstResponder()
    }
    
    //Login button pressed
    @IBAction func loginButtonPressed(sender: UIButton) {
        
        //if login and password validates, then move to next view
        if let userLogin = loginText.text, let userPassword = passwordText.text {
            if AccountManager.sharedInstance.validatedAccount(userLogin, userPassword) {
                print("Login successful")
                print(AccountManager.sharedInstance.whoAmI)
                let firstViewController = self.storyboard!.instantiateViewController(withIdentifier: "TabBarController")
                
                
                self.present(firstViewController, animated:true, completion: nil)
            }
        }
        
        
        
    }
    
    
    
    //Delegate - Make sure "/" cannot be used in textfields to prevent injections
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

        switch string {
            case "/", " ", "\\":
                return false
            default:
                return true
        }
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
