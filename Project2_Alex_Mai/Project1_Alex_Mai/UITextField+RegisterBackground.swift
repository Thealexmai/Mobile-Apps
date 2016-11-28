//
//  UIButton+RegisterBackground.swift
//  Project2_Alex_Mai
//
//  Created by Alex Mai on 11/28/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func setBottomBorder()
    {
        self.borderStyle = UITextBorderStyle.none;
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.gray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width,   width:  self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
