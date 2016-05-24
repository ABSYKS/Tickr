//
//  Controller.swift
//  TickrApp
//
//  Created by Simon Bessey on 11/05/2016.
//  Copyright © 2016 Simon Bessey. All rights reserved.
//

import Foundation
import UIKit
//var sprint = [String]()
class Controller: UIViewController, UIPopoverPresentationControllerDelegate {
    
    var myArray = ["1","2","3","4","5","6","7","8","9","0"]
    @IBOutlet weak var task: UITextField!
    @IBOutlet weak var estimate: UITextField!

    @IBOutlet var colorr: UIButton!
       
    // Override the iPhone behavior that presents a popover as fullscreen
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        // Return no adaptive presentation style, use default presentation behaviour
        return .None
    }
    
    @IBAction func add(sender: AnyObject) {
        let taskLabel = task.text
        //let sprintGoal = estimate.text
        
        if(taskLabel?.isEmpty == true){
                let alert = UIAlertController(title: "No task", message: "You have not entered a task", preferredStyle: .Alert)
                let defaultAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
                alert.addAction(defaultAction)
                presentViewController(alert, animated: true, completion: nil)
            }
     
            else if (taskLabel?.isEmpty == false) {
                objects.append(taskLabel!)
                performSegueWithIdentifier("listView", sender: nil)
            }

        if(estimate.text?.isEmpty == false) {
        estimates.append(estimate.text!)
        }
    }
    
override func viewDidLoad() {
    super.viewDidLoad()
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    }
    
    func setButtonColor (colors: UIColor) {
        colorr.backgroundColor = colors
    }
}



    