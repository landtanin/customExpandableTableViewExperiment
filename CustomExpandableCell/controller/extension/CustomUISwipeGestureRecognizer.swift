//
//  CustomUISwipeGestureRecognizer.swift
//  CustomExpandableCell
//
//  Created by Tanin on 04/06/2018.
//  Copyright © 2018 forestrock. All rights reserved.
//

import UIKit

class CustomUISwipeGestureRecognizer : UISwipeGestureRecognizer {
    
    var sectionNumber: Int = 0
    
    convenience init(target: Any?, action: Selector?, sectionNumber: Int) {
        self.init(target: target, action: action)
        self.sectionNumber = sectionNumber
    }
    
}
