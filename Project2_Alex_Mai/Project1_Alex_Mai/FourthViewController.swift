//
//  FourthViewController.swift
//  Project2_Alex_Mai
//
//  Created by Alex Mai on 11/25/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    
    var cellClicked: Int!
    
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var destinationImageView: UIImageView!
    @IBOutlet weak var departFromLabel: UILabel!
    @IBOutlet weak var departureDateLabel: UILabel!
    @IBOutlet weak var returnDateLabel: UILabel!
    @IBOutlet weak var numTravelersLabel: UILabel!
    @IBOutlet weak var purposeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let trips = TripManager.sharedInstance.trips[AccountManager.sharedInstance.whoAmI] {
            let thisTrip = trips[cellClicked]
            //assign thisTrip to the SPECIFIC one clicked
            
            destinationLabel.text = thisTrip.arrivalLocationText
            departFromLabel.text = "Depart From: \(thisTrip.departLocationText)"
            departureDateLabel.text = "Depart Date: \(thisTrip.friendlyDateFormat(thisTrip.departureDateText))"
            returnDateLabel.text = "Return Date: \(thisTrip.friendlyDateFormat(thisTrip.returnDateText))"
            numTravelersLabel.text = "Num Travelers: \(thisTrip.numTravelersText)"
            purposeLabel.text = "Purpose of Trip: \(thisTrip.purposeText)"
            statusLabel.text = "Status: \(thisTrip.statusText)"
            
            let imageToDisplay: UIImage
            
            //eventually I want to make API Calls to grab the first image off of Google's search engine
            switch thisTrip.arrivalLocationText {
            case "Rochester, NY":
                imageToDisplay = UIImage(named: "rochester")!
            case "Los Angeles, CA":
                imageToDisplay = UIImage(named: "la")!
            case "Saint Louis, Missouri":
                imageToDisplay = UIImage(named: "stlouis")!
            case "Toronto, Ontario":
                imageToDisplay = UIImage(named: "toronto")!
            case "Honolulu, HI":
                imageToDisplay = UIImage(named: "honolulu")!
            case "New York, NY":
                imageToDisplay = UIImage(named: "nyc")!
            case "Los Angeles, CA":
                imageToDisplay = UIImage(named: "la")!
            case "Seattle, Washington":
                imageToDisplay = UIImage(named: "seattle")!
            default:
                imageToDisplay = UIImage(named: "cruise")!
            }
            
            destinationImageView.image = imageToDisplay
            
        }
            
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
    }
    
}
