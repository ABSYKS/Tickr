//
//  storyTableViewCell.swift
//  TickrApp
//
//  Created by Simon Bessey on 30/05/2016.
//  Copyright © 2016 Simon Bessey. All rights reserved.
//

import UIKit

class storyTableViewCell: UITableViewCell {
    @IBOutlet weak var taskLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
