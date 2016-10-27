//
//  AccountKeeper.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 10/26/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation

class AccountKeeper: NSObject{
    var accounts: [Account] = []
    
    func addAccount() {
        accounts.append(Account("Alex Mai", "Male", 20, "trump.jpg", "admin", "password"))
    }
    
    
}
