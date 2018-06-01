//
//  UINavigationItem.swift
//  WL-Performance
//
//  Created by Tanin on 04/05/2018.
//  Copyright © 2018 forestrock. All rights reserved.
//

import UIKit

extension UINavigationItem {
    func addSettingButtonOnRight(){
        let button = UIButton(type: .custom)
        button.setTitle("setting_icon", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        button.layer.cornerRadius = 5
        button.backgroundColor = .gray
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 25)
        button.addTarget(self, action: #selector(gotSettingPage), for: UIControlEvents.touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
        
        self.rightBarButtonItem = barButton
    }
    
    @objc func gotSettingPage(){
        
    }
}
