//
//  Singleton.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 10/27/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation

class AccountManager {
    //this class is a Singleton
    static let sharedInstance: AccountManager = {
        let instance = AccountManager(array: [])
        
        return instance
    }()
    
    var accounts: [Account]
    
    private init(array: [Account]) {
        accounts = array
        
        accounts = [Account("Donald Trump", "Male", 8, "trump.jpg", "admin", "password", "donald.trump@trump.com", "hillary.clinton@clinton.com"), Account("Hillary Clinton", "Female", 90, "clinton.jpg", "hillary", "clinton", "hillary.clinton@clinton.com", "donald.trump@trump.com")]
    }
    
    func addAccount(_ name: String, _ gender: String, _ age: Int, _ image: String, _ login:String, _ password: String, _ email:String, _ emergencyContact:String) {
        let Alex = Account(name, gender, age, image, login, password, email, emergencyContact)
        accounts.append(Alex)
    }
    
    func validatedAccount(_ login:String, _ password:String) -> Bool {
        
        for i in 0..<accounts.count {
            if login == accounts[i].login && password == accounts[i].password {
                return true
            }
        }
        
        return false
    }
    
}
