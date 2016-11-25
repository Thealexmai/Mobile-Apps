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
    
    var loginTextFields: Login!
    
    //Outlets
    @IBOutlet var loginText: UITextField!
    @IBOutlet var passwordText: UITextField!

    //Action
    @IBAction func loginTextChanged(sender: UITextField) {
        if let loginValue = loginText.text {
            loginTextFields.login = loginValue
        }
    }
    @IBAction func passwordTextChanged(sender: UITextField) {
        if let passwordValue = passwordText.text {
            loginTextFields.password = passwordValue
        }
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
                let navController = self.storyboard!.instantiateViewController(withIdentifier: "NavController")
                
                
                self.present(navController, animated:true, completion: nil)
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
    
    //does same thing as if user presses login button - only used when the screen finishes launching for automated login with correct credentials
    func checkLogin(_ login:String, _ password:String) {
        
        if AccountManager.sharedInstance.validatedAccount(login, password) {
            let navController = self.storyboard!.instantiateViewController(withIdentifier: "NavController")
            
            self.present(navController, animated:true, completion: nil)
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Login successful")
        print(AccountManager.sharedInstance.whoAmI)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loginText.text = loginTextFields.login
        passwordText.text = loginTextFields.password
        
    }
    
    //automatically log the user in if the credentials are right
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let login = loginText.text, let password = passwordText.text {
            checkLogin(login, password)
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
