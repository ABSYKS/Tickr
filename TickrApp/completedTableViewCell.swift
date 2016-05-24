//
//  completedTableViewCell.swift
//  TickrApp
//
//  Created by Simon Bessey on 11/05/2016.
//  Copyright © 2016 Simon Bessey. All rights reserved.
//

import UIKit

class completedTableViewCell: UITableViewCell {

    @IBOutlet weak var taskA: UILabel!
    @IBOutlet weak var estA: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
