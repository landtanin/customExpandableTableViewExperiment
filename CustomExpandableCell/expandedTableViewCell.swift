//
//  expandedTableViewCell.swift
//  CustomExpandableCell
//
//  Created by Tanin on 01/06/2018.
//  Copyright © 2018 forestrock. All rights reserved.
//

import UIKit

class expandedTableViewCell: UITableViewCell {

    @IBOutlet var expandLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
