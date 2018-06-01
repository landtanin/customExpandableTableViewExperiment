//
//  Utils.swift
//  WL-Performance
//
//  Created by Tanin on 30/04/2018.
//  Copyright © 2018 forestrock. All rights reserved.
//

import UIKit

class Utils {
    
    static func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    static func getGroupName(from id: String) -> String {
        
        let defaults = UserDefaults.standard
        let alarmGroups = defaults.array(forKey: Constants.alarmGroupKey) as! [String]
        let alarmIds = defaults.array(forKey: Constants.alarmGroupIdKey) as! [String]
        
        guard let groupIndex = alarmIds.index(of: id) else {
            return ""
        }
        
        var groupName = alarmGroups[groupIndex]

        return groupName
        
    }
    
//    static func clearCache() -> Bool {
//        let realm = try! Realm()
//        
//        do {
//            
//            try realm.write {
//                realm.deleteAll()
//
//            }
//            return true
//            
//        } catch {
//            print("Error clearing cache")
//
//            return false
//        }
//    }

}
