//
//  DirectorTableViewCell.swift
//  UF EWeek
//
//  Created by Kevin Chow on 12/26/15.
//  Copyright © 2015 Kevin Chow. All rights reserved.
//

import UIKit

class DirectorTableViewCell: UITableViewCell {

    @IBOutlet weak var directorName: UILabel!
    @IBOutlet weak var directorPosition: UILabel!
    @IBOutlet weak var directorPhoto: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
