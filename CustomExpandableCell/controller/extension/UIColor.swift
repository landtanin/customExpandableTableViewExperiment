//
//  UIColor.swift
//  WL-Performance
//
//  Created by Tanin on 17/04/2018.
//  Copyright © 2018 forestrock. All rights reserved.
//

import UIKit
import ChameleonFramework

extension UIColor{
    
//    var tabBarTextColor: UIColor {
//        return UIColor(hexString: "636363")!
//    }
 
    struct TabBarScreen {
        static let TextColor = UIColor(hexString: "636363")
    }
    
    struct HomeScreen {
        
        struct Status {
            
            static let Red = UIColor(hexString: "E34040")
            static let Yellow = UIColor(hexString: "EFCC3A")
            static let Green = UIColor(hexString: "70C7A6")
            
        }
        
        struct Swipe {
            
            static let Green = UIColor(hexString: "66BD45")
            static let Blue = UIColor(hexString: "00B0D4")
            
        }
        
    }
    
    struct FilterDialog {
        
        static let Default = UIColor(hexString: "616161")!
        static let Highlighted = UIColor(hexString: "0D6FBC")!
        
    }
    
    struct App {
        
        static let NavBarWhite = UIColor(hexString: "FFFFFF")
        
        struct Text {
            
            static let TitleDarkGray = UIColor(hexString: "2C2C2C")
            static let SubTitleDarkGray = UIColor(hexString: "636363")
            static let ContentLightGray = UIColor(hexString: "989898")
            static let ContentLightWhite = UIColor(hexString: "EDECEC")
            
        }
        
        struct Tint {
        
            static let DarkGray = UIColor(hexString: "636363")
            static let LightGray = UIColor(hexString: "989898")
            
        }
        
    }
    
    
}
