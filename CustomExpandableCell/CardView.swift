//
//  CardView.swift
//  HabitTracker
//
//  Created by Tanin on 16/03/2018.
//  Copyright © 2018 landtanin. All rights reserved.
//

import UIKit

@IBDesignable
class CardView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 5
    @IBInspectable var shadowOffsetWidth: CGFloat = 3
    @IBInspectable var shadowOffsetHeight: CGFloat = 3
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: CGFloat = 0.06
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowOpacity = Float(shadowOpacity)
        layer.shadowPath = shadowPath.cgPath
    }
    
}

