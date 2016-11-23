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
        
        alphaConstraint() //alpha
        backgroundColorChange() //color
        labelFly() //constraint
        
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
    
    func backgroundColorChange() {
        UIView.animate(
            withDuration: 2,
            animations: { () -> Void in
                self.view.backgroundColor = UIColor.green},
            completion: {(Bool) -> Void in
                UIView.animate(
                    withDuration: 2,
                    animations: { () -> Void in
                    self.view.backgroundColor = UIColor.white})
        })
    }
    
    func labelFly() {
        let height = view.frame.height
        let width = view.frame.width
        
        UIView.animate(
            withDuration: 2,
            delay: 0,
            options: [.curveLinear],
            animations: { () -> Void in
                self.takeoffLabel.text = NSLocalizedString("label-fly", comment: "And off I go")
                self.takeoffX.constant += width
                self.takeoffY.constant -= height
                self.view.layoutIfNeeded() },
            completion: {(Bool) -> Void in
                UIView.animate(
                    withDuration: 2,
                    delay: 0,
                    options: [.curveLinear],
                    animations: { () -> Void in
                        self.takeoffLabel.text = NSLocalizedString("label-fly-return", comment: "Coming back")
                        self.takeoffX.constant -= width
                        self.takeoffY.constant += height
                        self.view.layoutIfNeeded() },
                    completion: { (Bool) -> Void in
                        self.takeoffLabel.text = NSLocalizedString("label-fly-takeoff", comment: "Watch me takeoff")
                })
        })
        
    }
   
    
    
}
