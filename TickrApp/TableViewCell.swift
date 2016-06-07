//
//  TableViewCell.swift
//  TickrApp
//
//  Created by Simon Bessey on 11/05/2016.
//  Copyright © 2016 Simon Bessey. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var est: UILabel!
    @IBOutlet weak var sdf: UIButton!
    @IBOutlet weak var button: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

