//
//  ViewController.swift
//  TickrApp
//
//  Created by Simon Bessey on 11/05/2016.
//  Copyright © 2016 Simon Bessey. All rights reserved.
//

import UIKit


var completed = [String]()
var estimates = [Int]()
var completedEstimates = [Int]()
var completed1 = [String]()
var finalEst = [Int]()
var objects = [String]();
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet var table: UITableView!
    @IBOutlet weak var complete: UIProgressView!
    @IBOutlet weak var sprintTotal: UILabel!
    let storyCellColor = UIColor.init(red: 204/255, green: 0/255, blue: 102/255, alpha: 1)
    let pinkColor = UIColor.init(red: 255/255, green: 0/255, blue: 127/255, alpha: 1)
    let orangeColor = UIColor.init(red: 255/255, green: 171/255, blue: 0/255, alpha: 1)
    let darkGray = UIColor.init(red: 58/255, green: 58/255, blue: 58/255, alpha: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().barTintColor = darkGray
        circleGenerator(128, y: UIColor.grayColor(), z: (M_PI * 2), w: 1.0)
        circleGenerator(128, y: UIColor.greenColor(), z: (M_PI * 1.5), w: 1.5)
        circleGenerator(198, y: UIColor.grayColor(), z: (M_PI * 2), w: 1.0)
        circleGenerator(198, y: orangeColor, z: (M_PI * 0.3), w: 1.5)
        circleGenerator(268, y: UIColor.grayColor(), z: (M_PI * 2), w: 1.0)
        circleGenerator(268, y: pinkColor, z: (M_PI * 0.75), w: 1.5)
            }
    override func viewDidAppear(animated: Bool) {

        let sum = estimates.reduce(0, combine: +)
        sprintTotal.text = String(sum)
        uploadProgress()
        if(objects.count > 0){
            let longpress = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPressGestureRecognized(_:)))
            table.addGestureRecognizer(longpress)
        }
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

    }
    
    func uploadProgress() {
        if(completed.count != 0) && (objects.count != 0){
            let total = Float(completed.count + objects.count)
            let value = Float(completed.count)/total
            complete.progress = value
        }
        
        if(objects.count == 0){
            complete.progress = 1
        }

        if(completed.count == 0) {
            complete.progress = 0
        }
    }

    func longPressGestureRecognized(gestureRecognizer: UIGestureRecognizer) {
        let longPress = gestureRecognizer as! UILongPressGestureRecognizer
        
        let state = longPress.state
        
        let locationInView = longPress.locationInView(table)
        
        let indexPath = table.indexPathForRowAtPoint(locationInView)
        
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
                
                let cell = table.cellForRowAtIndexPath(indexPath!) as UITableViewCell!
                
                My.cellSnapshot  = snapshopOfCell(cell)
                
                var center = cell.center
                
                My.cellSnapshot!.center = center
                
                My.cellSnapshot!.alpha = 0.0
                
                table.addSubview(My.cellSnapshot!)
                
                
                
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
                
               swap(&objects[indexPath!.row], &objects[Path.initialIndexPath!.row])
               swap(&estimates[indexPath!.row], &estimates[Path.initialIndexPath!.row])
                
                table.moveRowAtIndexPath(Path.initialIndexPath!, toIndexPath: indexPath!)
                
                Path.initialIndexPath = indexPath
                
            }
            
        default:
            let cell = table.cellForRowAtIndexPath(Path.initialIndexPath!) as UITableViewCell!
            
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.table.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
        cell.title.text = objects[indexPath.row]as String!
        
        if(estimates[indexPath.row] != 0){
        cell.est.text = String(estimates[indexPath.row] as Int!)
        cell.backgroundColor = storyCellColor
        cell.est.textColor = UIColor.whiteColor()
        cell.title.textColor = UIColor.whiteColor()
        cell.sdf.backgroundColor = UIColor.init(red: 41/255, green: 41/255, blue: 41/255, alpha: 1)
        }
        
        else if(estimates[indexPath.row] == 0){
            cell.est.text = ""
            cell.sdf.backgroundColor = UIColor.init(red: 41/255, green: 41/255, blue: 41/255, alpha: 1)
        }

        return cell
    }
    

    @IBAction func nextAction(sender: UIButton) {
        let titleString = objects[sender.tag]
        let firstAction =  "\(titleString)"
        completed.append(firstAction)
        if(estimates[sender.tag] != 0){
            let estString = estimates[sender.tag]
            completedEstimates.append(estString)
        }
        else if(estimates[sender.tag] == 0){
            completedEstimates.append(0)
        }
        
        let myPath = NSIndexPath(forRow: sender.tag, inSection: 0)
        objects.removeAtIndex(sender.tag)
        if(estimates[sender.tag] != 0){
            estimates.removeAtIndex(sender.tag)
        }
        table.deleteRowsAtIndexPaths([myPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        table.reloadData()
        self.uploadProgress()
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    /*
 circle formula = ( M_PI * ( (completed/estimates) / 2) )
 */
    
    
    func circleGenerator(let x: Int, y: UIColor, z: Double, w: CGFloat) {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: x,y:70), radius: CGFloat(19), startAngle: CGFloat(0), endAngle:CGFloat(z), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.CGPath
        //change the fill color
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        //you can change the stroke color
        shapeLayer.strokeColor = y.CGColor
        //you can change the line width
        shapeLayer.lineWidth = w
        view.layer.addSublayer(shapeLayer)
    }

}

