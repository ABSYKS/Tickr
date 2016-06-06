//
//  CustomButton.swift
//  TickrApp
//
//  Created by Simon Bessey on 23/05/2016.
//  Copyright © 2016 Simon Bessey. All rights reserved.
//


import Foundation
import UIKit

class CustomButton: UIButton {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.frame = CGRectMake(0, 0, 15, 0)
self.center = CGPoint(x: 0, y: 0)
self.layer.cornerRadius = 0.5 * self.bounds.size.width
self.addTarget(ViewController(), action: #selector(ViewController.nextAction(_:)), forControlEvents: .TouchUpInside)
self.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)

    }
}