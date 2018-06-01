//
//  CustomHeader.swift
//  CustomExpandableCell
//
//  Created by Tanin on 01/06/2018.
//  Copyright © 2018 forestrock. All rights reserved.
//

import Foundation
import UIKit

// if you want your header to be able to inform view controller of key events, create protocol

protocol CustomHeaderDelegate: class {
    func didTapButton(in section: Int)
}

// define CustomHeader class with necessary `delegate`, `@IBOutlet` and `@IBAction`:

class CustomHeader: UITableViewHeaderFooterView {
    weak var delegate: CustomHeaderDelegate?
    
    @IBOutlet weak var customLabel: UILabel!
    
    var sectionNumber: Int!  // you don't have to do this, but it can be useful to have reference back to the section number so that when you tap on a button, you know which section you came from
    
    @IBAction func didTapButton(_ sender: AnyObject) {
        delegate?.didTapButton(in: sectionNumber)
    }
    
}
