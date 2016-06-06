//
//  Controller.swift
//  TickrApp
//
//  Created by Simon Bessey on 11/05/2016.
//  Copyright © 2016 Simon Bessey. All rights reserved.
//

import Foundation
import UIKit
var categories = [String]()
//var sprint = [String]()
class Controller: UIViewController {
    var timer = NSTimer()
    @IBOutlet weak var plusCross: UIButton!
    @IBOutlet weak var task: UITextField!
    @IBOutlet weak var estimate: UITextField!
    
    func checkWhatsActive() {
        if (task.text?.isEmpty == false)&&(self.estimate.editing == true){
            plusCross.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
        }
    }
    
    @IBAction func add(sender: AnyObject) {
    //let sprintGoal = estimate.text
        if(estimate.text?.isEmpty == false)&&(task.text?.isEmpty == false) {
        performSegueWithIdentifier("listView", sender: nil)
        let taskLabel = task.text
        objects.append(taskLabel!)
        estimates.append(Int(estimate.text!)!)
        categories.append(taskLabel!)
        }
        
        else if (estimate.text?.isEmpty == true) || (task.text?.isEmpty == true) {
            performSegueWithIdentifier("listView", sender: nil)
        }
    }
    
override func viewDidLoad() {
    super.viewDidLoad()
    plusCross.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
    timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target:self, selector: #selector(Controller.checkWhatsActive), userInfo: nil, repeats: true)
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    }
}



    