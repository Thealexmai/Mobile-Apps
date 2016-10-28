//
//  Singleton.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 10/27/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

class Singleton {
    static let sharedInstance: Singleton = {
        let instance = Singleton(array: [])
        
        return instance
    }()
    
    var accountKeeper: [Account]
    
    private init(array: [Account]) {
        self.accountKeeper = array
    }
    
    
}
