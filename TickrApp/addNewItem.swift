//
//  addNewItem.swift
//  TickrApp
//
//  Created by Simon Bessey on 22/05/2016.
//  Copyright © 2016 Simon Bessey. All rights reserved.
//

import Foundation
import UIKit

class addNewItem: UITabBarController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        let button = UIButton(type: .Custom)
        button.frame = CGRectMake(160, 100, 50, 50)
        button.backgroundColor = UIColor.greenColor()
        button.center = CGPoint(x: 160, y: 520)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.addTarget(self, action: #selector(segueNext), forControlEvents: .TouchUpInside)
        button.clipsToBounds = true
        button.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        label.text = "+"
        label.textColor = UIColor.whiteColor()
        label.font = UIFont(name: "Avenir Next", size: 45)
        label.numberOfLines = 1
        label.frame = CGRectMake(15, 54, 300, 500)
        label.center = CGPoint(x: 295, y: 520)
        view.addSubview(button)
        view.addSubview(label)
    }
    
    func segueNext() {
        performSegueWithIdentifier("newItem", sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}