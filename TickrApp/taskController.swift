//
//  taskController.swift
//  TickrApp
//
//  Created by Simon Bessey on 31/05/2016.
//  Copyright © 2016 Simon Bessey. All rights reserved.
//

import Foundation
import UIKit

class taskController: UIViewController {
    
    @IBOutlet weak var task: UITextField!
    @IBAction func add(sender: AnyObject) {
    
        if(task.text?.isEmpty == false) {
            performSegueWithIdentifier("listView2", sender: nil)
            let taskLabel = task.text
            objects.append(taskLabel!)
            estimates.append(0)
            
        }
        
        else if (task.text?.isEmpty == true){
            let alert = UIAlertController(title: "No Task", message: "You have not entered a task", preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: .Default) { _ in
            }
            alert.addAction(action)
            self.presentViewController(alert, animated: true){}
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}