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
    
    let storyButton = UIButton(type: .Custom)
    let taskButton = UIButton(type: .Custom)
    let backgroundButton = UIButton(type: .Custom)
    let stryLabel = UILabel()
    let taskLabel = UILabel()
    let pseudolabel = UILabel()
    let pseudobutton = UILabel()
    let plusColor = UIColor.init(red: 80/255, green: 252/255, blue: 171/255, alpha: 1)
    let darkColor = UIColor.init(red: 45/255, green: 45/255, blue: 45/255, alpha: 1)
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    func backToList() {
        
        animate(storyButton, label: stryLabel,x: -40, y: -50)
        delay(0.1){
            self.animate(self.taskButton, label: self.taskLabel,x: 40, y: -50)
        }
        delay(0.4){
        self.backgroundButton.hidden = true
        self.storyButton.hidden = true
        self.stryLabel.hidden = true
        self.taskButton.hidden = true
        self.taskLabel.hidden = true
        self.pseudolabel.hidden = true
        self.pseudobutton.hidden = true
    }
}
    
    func showButtons() {
        backgroundButton.hidden = false
        storyButton.hidden = false
        taskButton.hidden = false
        taskLabel.hidden = false
        stryLabel.hidden = false
        backgroundButton.frame = CGRectMake(10, 10, 500, 500)
        backgroundButton.backgroundColor = UIColor.clearColor()
        backgroundButton.center = CGPoint(x: 160, y: 250)
        backgroundButton.layer.cornerRadius = 0.5 * backgroundButton.bounds.size.width
        backgroundButton.addTarget(self, action: #selector(backToList), forControlEvents: .TouchUpInside)
        backgroundButton.clipsToBounds = true
        backgroundButton.setTitleShadowColor(UIColor.clearColor(), forState: .Normal)
        
        storyButton.frame = CGRectMake(110, 150, 48, 48)
        storyButton.backgroundColor = darkColor
        storyButton.center = CGPoint(x: 160, y: 510)
        storyButton.layer.cornerRadius = 0.5 * storyButton.bounds.size.width
        storyButton.addTarget(addNewItem(), action: #selector(addNewItem.segueNext), forControlEvents: .TouchUpInside)
        storyButton.clipsToBounds = true
        storyButton.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        stryLabel.text = "Story"
        stryLabel.textColor = UIColor.whiteColor()
        stryLabel.font = UIFont(name: "Avenir Next", size: 15)
        stryLabel.numberOfLines = 1
        stryLabel.frame = CGRectMake(110, 150, 48, 48)
        stryLabel.center = CGPoint(x: 167, y: 510)

        
        taskButton.frame = CGRectMake(210, 150, 48, 48)
        taskButton.backgroundColor = darkColor
        taskButton.center = CGPoint(x: 160, y: 510)
        taskButton.layer.cornerRadius = 0.5 * taskButton.bounds.size.width
        taskButton.addTarget(addNewItem(), action: #selector(addNewItem.otherSegue), forControlEvents: .TouchUpInside)
        taskButton.clipsToBounds = true
        taskButton.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        taskLabel.text = "Task"
        taskLabel.textColor = UIColor.whiteColor()
        taskLabel.font = UIFont(name: "Avenir Next", size: 15)
        taskLabel.numberOfLines = 1
        taskLabel.frame = CGRectMake(210, 150, 48, 48)
        taskLabel.center = CGPoint(x: 170, y: 510)
        view.addSubview(backgroundButton)
        view.addSubview(storyButton)
        view.addSubview(taskButton)
        view.addSubview(taskLabel)
        view.addSubview(stryLabel)
        animate(storyButton, label: stryLabel,x: 40, y: 50)
        delay(0.1){
        self.animate(self.taskButton, label: self.taskLabel,x: -40, y: 50)
        }
        pseudolabel.hidden = false
        pseudobutton.hidden = false
        pseudobutton.frame = CGRectMake(160, 150, 50, 50)
        pseudobutton.backgroundColor = plusColor
        pseudobutton.center = CGPoint(x: 160, y: 510)
        pseudobutton.layer.cornerRadius = 0.5 * pseudobutton.bounds.size.width
        pseudobutton.clipsToBounds = true
        pseudobutton.layer.shadowColor = UIColor.blackColor().CGColor
        pseudobutton.layer.shadowOffset = CGSizeMake(7, 7)
        pseudobutton.layer.shadowRadius = 10
        
        pseudolabel.text = "+"
        pseudolabel.textColor = UIColor.whiteColor()
        pseudolabel.font = UIFont(name: "Avenir Next", size: 45)
        pseudolabel.numberOfLines = 1
        pseudolabel.frame = CGRectMake(15, 54, 300, 500)
        pseudolabel.center = CGPoint(x: 295, y: 510)
        view.addSubview(pseudobutton)
        view.addSubview(pseudolabel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        let button = UIButton(type: .Custom)
        button.frame = CGRectMake(160, 150, 50, 50)
        button.backgroundColor = plusColor
        button.center = CGPoint(x: 160, y: 510)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.addTarget(self, action: #selector(showButtons), forControlEvents: .TouchUpInside)
        button.clipsToBounds = true
        button.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        button.layer.shadowColor = UIColor.blackColor().CGColor
        button.layer.shadowOffset = CGSizeMake(7, 7)
        button.layer.shadowRadius = 10
        
        label.text = "+"
        label.textColor = UIColor.whiteColor()
        label.font = UIFont(name: "Avenir Next", size: 45)
        label.numberOfLines = 1
        label.frame = CGRectMake(15, 54, 300, 500)
        label.center = CGPoint(x: 295, y: 510)
        view.addSubview(button)
        view.addSubview(label)
    }
    
    func segueNext() {
        performSegueWithIdentifier("newItem", sender: nil)
    }
    
    func otherSegue() {
        performSegueWithIdentifier("taskView", sender: nil)
    }

    func animate(let button: UIButton , label: UILabel, x: CGFloat, y: CGFloat){
        UIView.animateWithDuration(0.3, animations:{
            button.frame = CGRectMake(button.frame.origin.x - x, button.frame.origin.y - y, button.frame.size.width, button.frame.size.height)
            label.frame = CGRectMake(label.frame.origin.x - x, label.frame.origin.y - y, label.frame.size.width, label.frame.size.height)
        })

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}