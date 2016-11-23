//
//  SecondViewCell.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 10/29/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class SecondViewCell: UITableViewCell {
    @IBOutlet var arrivalDestination: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var departureDate: UILabel!
    @IBOutlet var returnDate: UILabel!
//    @IBOutlet var purpose: UILabel!
    
    func updateLabels() {
        let bodyFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        arrivalDestination.font = bodyFont
        
        let caption1Font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption1)
        statusLabel.font = caption1Font
        departureDate.font = caption1Font
        returnDate.font = caption1Font
    }
    
    
}
