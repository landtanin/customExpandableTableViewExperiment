//
//  CAShapeLayer.swift
//  WL-Performance
//
//  Created by Tanin on 01/05/2018.
//  Copyright © 2018 forestrock. All rights reserved.
//

import UIKit

extension CAShapeLayer {
    
    private func drawCircleAtLocation(location: CGPoint, withRadius radius: CGFloat, andColor color: UIColor, filled: Bool) {
        fillColor = filled ? color.cgColor : UIColor.white.cgColor
        strokeColor = color.cgColor
        let origin = CGPoint(x: location.x - radius, y: location.y - radius)
        path = UIBezierPath(ovalIn: CGRect(origin: origin, size: CGSize(width: radius * 2, height: radius * 2))).cgPath
    }
    
}
