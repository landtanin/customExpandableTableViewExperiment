//
//  HomeMainCellRepresentable.swift
//  WL-Performance
//
//  Created by Tanin on 17/05/2018.
//  Copyright © 2018 forestrock. All rights reserved.
//

import UIKit

protocol HomeMainCellRepresentable {
    
    var id: String {get}
    var time: String {get}
    var openAlarm: String {get}
    var totalAlarm: String {get}
    var statusColor: UIColor {get}
    
}
