//
//  TeamsTableViewCell.swift
//  UltimateFrisbeeTracker
//
//  Created by Christian.Grise on 11/9/16.
//  Copyright © 2016 Christian.Grise. All rights reserved.
//

import UIKit

class TeamsTableViewCell: UITableViewCell {

    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var detailsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
