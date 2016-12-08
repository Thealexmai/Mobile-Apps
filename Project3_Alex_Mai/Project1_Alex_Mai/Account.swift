//
//  Account.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 10/26/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation

//This class allows the user to create an account
class Account: NSObject {
    var name: String
    var gender: String
    var age: Int
    var image: String
    var login:String
    var password: String
    var email: String
    var emergencyContact: String
    
    init(_ name: String, _ gender: String, _ age: Int, _ image: String, _ login:String, _ password: String, _ email:String, _ emergencyContact:String) {
        self.name = name
        self.gender = gender
        self.age = age
        self.image = image
        self.login = login
        self.password = password
        self.email = email
        self.emergencyContact = emergencyContact
    }
    
    
}
