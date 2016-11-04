//
//  AnimationsViewController.swift
//  Project1_Alex_Mai
//
//  Created by Alex Mai on 11/1/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class AnimationsViewController: UIViewController {
    
    //outlet and actions
    @IBOutlet weak var disappearLabel: UILabel!
    @IBOutlet weak var takeoffLabel: UILabel!
    
    //constraints for takeoffLabel
    @IBOutlet weak var takeoffX: NSLayoutConstraint!
    @IBOutlet weak var takeoffY: NSLayoutConstraint!
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        alphaConstraint()
    }
    
    func alphaConstraint() {
        UIView.animate(
            withDuration: 2,
            animations: {() -> Void in
                self.disappearLabel.alpha = 0},
            completion: {(Bool) -> Void in
                UIView.animate(
                    withDuration: 2,
                    animations: {() -> Void in
                        self.disappearLabel.alpha = 1.0})
        })
    }
    
    
}
