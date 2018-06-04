//
//  MuteButton.swift
//  CustomExpandableCell
//
//  Created by Tanin on 04/06/2018.
//  Copyright © 2018 forestrock. All rights reserved.
//

import UIKit

class MuteButton : UIButton {
    
    var groupId: String!
    
    convenience init(frame: CGRect, groupId: String) {
        self.init(frame: frame)
        self.groupId = groupId
    }
    
}
