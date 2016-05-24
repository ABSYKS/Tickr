//
//  doneTableCell.swift
//  TickrApp
//
//  Created by Simon Bessey on 24/05/2016.
//  Copyright © 2016 Simon Bessey. All rights reserved.
//

import UIKit

class doneTableCell: UITableViewCell {
    @IBOutlet var taskD: UILabel!
    @IBOutlet var estD: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
