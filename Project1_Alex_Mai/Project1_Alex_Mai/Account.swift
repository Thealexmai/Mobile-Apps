//
//  Account.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 10/26/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation

class Account:User {
    var login:String
    var password: String
    
    init(_ name: String, _ gender: String, _ age: Int, _ image: String, _ login:String, _ password: String) {
        self.login = login
        self.password = password
        super.init(name, gender, age, image)
    }
    
    
}
