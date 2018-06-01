//
//  UIDevice.swift
//  WL-Performance
//
//  Created by Tanin on 17/04/2018.
//  Copyright © 2018 forestrock. All rights reserved.
//

import UIKit

extension UIDevice {
    
    var iPhoneX: Bool {
        return UIScreen.main.nativeBounds.height == 2436
    }
    
}
