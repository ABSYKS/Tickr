//
//  doneController.swift
//  TickrApp
//
//  Created by Simon Bessey on 24/05/2016.
//  Copyright © 2016 Simon Bessey. All rights reserved.
//

import Foundation
import UIKit

class doneController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var finalTable: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completed1.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = finalTable.dequeueReusableCellWithIdentifier("cell3", forIndexPath: indexPath) as! doneTableCell
        cell.taskD.text = completed1[indexPath.row]
        cell.estD.text = finalEst[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}