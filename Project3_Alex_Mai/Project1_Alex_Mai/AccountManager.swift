//
//  Singleton.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 10/27/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

//Singleton manages all accounts
//class AccountManager {
//    //this class is a Singleton
//    static let sharedInstance: AccountManager = {
//        let instance = AccountManager()
//        
//        return instance
//    }()
//    
//    //for encoding and decoding
//    static let accountsKey = "accounts"
//    static let whoAmIKey = "whoamI"
//    
//    var accounts: [Account]
//    var whoAmI: String
//    
//    private init() {
//        
//        //Create two generic accounts
//        accounts = [Account("Donald Trump", "Male", 8, "trump.jpg", "admin", "password", "donald.trump@trump.com", "hillary.clinton@clinton.com"), Account("Hillary Clinton", "Female", 90, "clinton.jpg", "hillary", "clinton", "hillary.clinton@clinton.com", "donald.trump@trump.com")]
//        
//        self.whoAmI = ""
//    }
//    
//    func addAccount(_ name: String, _ gender: String, _ age: Int, _ image: String, _ login:String, _ password: String, _ email:String, _ emergencyContact:String) {
//        let newAccount = Account(name, gender, age, image, login, password, email, emergencyContact)
//        accounts.append(newAccount)
//    }
//    
//    func addAccount(_ newAccount: Account) {
//        accounts.append(newAccount)
//    }
//    
//    //for log in validation
//    func validatedAccount(_ login:String, _ password:String) -> Bool {
//        
//        for i in 0..<accounts.count {
//            if login == accounts[i].login && password == accounts[i].password {
//                whoAmI = login
//                return true
//            }
//        }
//        
//        return false
//    }
//    
//    //for registration - validate the login doesn't already exist
//    func matchesOtherLogin(_ login: String) -> Bool {
//        for i in 0..<accounts.count {
//            //if the login matches one that's already in the accounts array, return false
//            if login == accounts[i].login {
//                return true
//            }
//        }
//        
//        return false
//    }
//    
//    //for ThirdViewController to display user info
//    func getAccountIndex(_ login: String) -> Int {
//        var accountIndex: Int = 0
//        for i in 0..<accounts.count {
//            if login == accounts[i].login {
//                accountIndex = i
//            }
//        }
//        
//        return accountIndex
//    }
//    
//
//    
////    //encode account stuff
////    func encode(with aCoder: NSCoder) {
////        aCoder.encode(accounts, forKey: AccountManager.accountsKey)
////        aCoder.encode(whoAmI, forKey: AccountManager.whoAmIKey)
////
////    }
////    
////    //decode account stuff
////    required init(coder aDecoder: NSCoder) {
////        accounts = aDecoder.decodeObject(forKey: AccountManager.accountsKey) as! Array
////        whoAmI = aDecoder.decodeObject(forKey: AccountManager.whoAmIKey) as! String
////    }
//    
//    
//}
