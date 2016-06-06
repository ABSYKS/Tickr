//
//  clearView.swift
//  TickrApp
//
//  Created by Simon Bessey on 31/05/2016.
//  Copyright © 2016 Simon Bessey. All rights reserved.
//

import Foundation
import UIKit

class clearView: UIViewController {
    let storyButton = UIButton(type: .Custom)
    let taskButton = UIButton(type: .Custom)
    let backgroundButton = UIButton(type: .Custom)
    
    func backToList() {
        storyButton.hidden = true
        taskButton.hidden = true
        backgroundButton.hidden = true
    }
    
    func showButtons() {
    
        backgroundButton.frame = CGRectMake(10, 10, 500, 500)
        backgroundButton.backgroundColor = UIColor.clearColor()
        backgroundButton.center = CGPoint(x: 160, y: 250)
        backgroundButton.layer.cornerRadius = 0.5 * backgroundButton.bounds.size.width
        backgroundButton.addTarget(self, action: #selector(backToList), forControlEvents: .TouchUpInside)
        backgroundButton.clipsToBounds = true
        backgroundButton.setTitleShadowColor(UIColor.clearColor(), forState: .Normal)
        
        storyButton.frame = CGRectMake(110, 150, 45, 45)
        storyButton.backgroundColor = UIColor.blackColor()
        storyButton.center = CGPoint(x: 120, y: 460)
        storyButton.layer.cornerRadius = 0.5 * storyButton.bounds.size.width
        storyButton.addTarget(addNewItem(), action: #selector(addNewItem.segueNext), forControlEvents: .TouchUpInside)
        storyButton.clipsToBounds = true
        storyButton.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        
        taskButton.frame = CGRectMake(210, 150, 45, 45)
        taskButton.backgroundColor = UIColor.blackColor()
        taskButton.center = CGPoint(x: 200, y: 460)
        taskButton.layer.cornerRadius = 0.5 * taskButton.bounds.size.width
        taskButton.addTarget(addNewItem(), action: #selector(addNewItem.otherSegue), forControlEvents: .TouchUpInside)
        taskButton.clipsToBounds = true
        taskButton.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        view.addSubview(backgroundButton)
        view.addSubview(storyButton)
        view.addSubview(taskButton)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showButtons()
        view.backgroundColor = UIColor.clearColor()
        view.opaque = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}