//
//  colorPopUp.swift
//  TickrApp
//
//  Created by Simon Bessey on 24/05/2016.
//  Copyright © 2016 Simon Bessey. All rights reserved.
//

import Foundation
import UIKit

class colorPopUp: UIViewController {
    
    func addRed(){
        color.append(UIColor.redColor())
        performSegueWithIdentifier("listView", sender: nil)
    }
    
    func addBlue(){
        color.append(UIColor.blueColor())
        performSegueWithIdentifier("listView", sender: nil)
    }
    
    func addGray(){
        color.append(UIColor.grayColor())
        performSegueWithIdentifier("listView", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(type: .Custom)
        button.frame = CGRectMake(40, 20, 35, 35)
        button.backgroundColor = UIColor.greenColor()
        button.center = CGPoint(x: 160, y: 520)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.addTarget(self, action: #selector(addRed), forControlEvents: .TouchUpInside)
        button.clipsToBounds = true
        button.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        
        let button2 = UIButton(type: .Custom)
        button2.frame = CGRectMake(100, 20, 35, 35)
        button2.backgroundColor = UIColor.greenColor()
        button2.center = CGPoint(x: 160, y: 520)
        button2.layer.cornerRadius = 0.5 * button.bounds.size.width
        button2.addTarget(self, action: #selector(addBlue), forControlEvents: .TouchUpInside)
        button2.clipsToBounds = true
        button2.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)

        let button3 = UIButton(type: .Custom)
        button3.frame = CGRectMake(160, 20, 35, 35)
        button3.backgroundColor = UIColor.greenColor()
        button3.center = CGPoint(x: 160, y: 520)
        button3.layer.cornerRadius = 0.5 * button.bounds.size.width
        button3.addTarget(self, action: #selector(addBlue), forControlEvents: .TouchUpInside)
        button3.clipsToBounds = true
        button3.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)


    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}