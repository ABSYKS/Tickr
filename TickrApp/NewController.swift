//
//  NewController.swift
//  TickrApp
//
//  Created by Simon Bessey on 11/05/2016.
//  Copyright © 2016 Simon Bessey. All rights reserved.
//

import Foundation
import UIKit

class NewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var completedTsks: UITableView!
    @IBOutlet weak var comp: UIProgressView!

func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return completed.count
}

func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = completedTsks.dequeueReusableCellWithIdentifier("cell2", forIndexPath: indexPath) as! completedTableViewCell
    cell.taskA.text = completed[indexPath.row]
    cell.estA.text = completedEstimates[indexPath.row]
    return cell
}
    
    
override func viewDidLoad() {
    //        self.label.text = self.labelString
    super.viewDidLoad()
    uploadProgress()
    let date = NSDate()
    let calendar = NSCalendar.currentCalendar()
    let components = calendar.components([.Day , .Month , .Year], fromDate: date)
    let mnth = components.month
    day.text! = String(components.day)
    
    switch(mnth) {
    case 1: month.text! = "JAN"
    break;
    case 2: month.text! = "FEB"
    break;
    case 3: month.text! = "MAR"
    break;
    case 4: month.text! = "APR"
    break;
    case 5: month.text! = "MAY"
    break;
    case 6: month.text! = "JUN"
    break;
    case 7: month.text! = "JUL"
    break;
    case 8: month.text! = "AUG"
    break;
    case 9: month.text! = "SEP"
    break;
    case 10: month.text! = "OCT"
    break;
    case 11: month.text! = "NOV"
    break;
    case 12: month.text! = "DEC"
        
    default: "N/A"
    break;
    }

    
    // Do any additional setup after loading the view.
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}
    
    func uploadProgress() {
        if(completed1.count != 0) && (completed.count != 0){
            let total = Float(completed1.count + completed.count)
            let value = Float(completed1.count)/total
            comp.progress = value
        }
        
        if(completed.count == 0){
            comp.progress = 1
        }
        
        if(completed1.count == 0) {
            comp.progress = 0
        }
    }

    @IBAction func nextActionTwo(sender: UIButton) {
        let titleString = completed[sender.tag]
        let firstAction =  "\(titleString)"
        let estString = completedEstimates[sender.tag]
        let secondAction = "\(estString)"
        completed1.append(firstAction)
        finalEst.append(secondAction)
        let myPath = NSIndexPath(forRow: sender.tag, inSection: 0)
        completed.removeAtIndex(sender.tag)
        completedEstimates.removeAtIndex(sender.tag)
        completedTsks.deleteRowsAtIndexPaths([myPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        completedTsks.reloadData()
        self.uploadProgress()
    }

    func longPressGestureRecognized(gestureRecognizer: UIGestureRecognizer) {
        let longPress = gestureRecognizer as! UILongPressGestureRecognizer
        
        let state = longPress.state
        
        let locationInView = longPress.locationInView(completedTsks)
        
        let indexPath = completedTsks.indexPathForRowAtPoint(locationInView)
        
        struct My {
            
            static var cellSnapshot : UIView? = nil
            
        }
        struct Path {
            
            static var initialIndexPath : NSIndexPath? = nil
            
        }
        
        switch state {
        case UIGestureRecognizerState.Began:
            
            if indexPath != nil {
                
                Path.initialIndexPath = indexPath
                
                let cell = completedTsks.cellForRowAtIndexPath(indexPath!) as UITableViewCell!
                
                My.cellSnapshot  = snapshopOfCell(cell)
                
                var center = cell.center
                
                My.cellSnapshot!.center = center
                
                My.cellSnapshot!.alpha = 0.0
                
                completedTsks.addSubview(My.cellSnapshot!)
                
                
                
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    
                    center.y = locationInView.y
                    
                    My.cellSnapshot!.center = center
                    
                    My.cellSnapshot!.transform = CGAffineTransformMakeScale(1.05, 1.05)
                    
                    My.cellSnapshot!.alpha = 0.98
                    
                    cell.alpha = 0.0
                    
                    
                    
                    }, completion: { (finished) -> Void in
                        
                        if finished {
                            
                            cell.hidden = true
                            
                        }
                        
                })
                
            }
            
        case UIGestureRecognizerState.Changed:
            var center = My.cellSnapshot!.center
            
            center.y = locationInView.y
            
            My.cellSnapshot!.center = center
            
            if ((indexPath != nil) && (indexPath != Path.initialIndexPath)) {
                
                //                swap(&objects[indexPath!.row], &objects[Path.initialIndexPath!.row])
                
                completedTsks.moveRowAtIndexPath(Path.initialIndexPath!, toIndexPath: indexPath!)
                
                Path.initialIndexPath = indexPath
                
            }
            
        default:
            let cell = completedTsks.cellForRowAtIndexPath(Path.initialIndexPath!) as UITableViewCell!
            
            cell.hidden = false
            
            cell.alpha = 0.0
            
            UIView.animateWithDuration(0.25, animations: { () -> Void in
                
                My.cellSnapshot!.center = cell.center
                
                My.cellSnapshot!.transform = CGAffineTransformIdentity
                
                My.cellSnapshot!.alpha = 0.0
                
                cell.alpha = 1.0
                
                }, completion: { (finished) -> Void in
                    
                    if finished {
                        
                        Path.initialIndexPath = nil
                        
                        My.cellSnapshot!.removeFromSuperview()
                        
                        My.cellSnapshot = nil
                    }
            })
        }
    }
    
    
    
    func snapshopOfCell(inputView: UIView) -> UIView {
        UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, false, 0.0)
        
        inputView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext() as UIImage
        
        UIGraphicsEndImageContext()
        
        let cellSnapshot : UIView = UIImageView(image: image)
        
        cellSnapshot.layer.masksToBounds = false
        
        cellSnapshot.layer.cornerRadius = 0.0
        
        cellSnapshot.layer.shadowOffset = CGSizeMake(-5.0, 0.0)
        
        cellSnapshot.layer.shadowRadius = 5.0
        
        cellSnapshot.layer.shadowOpacity = 0.4
        
        return cellSnapshot
        
    }
    
/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */

}
