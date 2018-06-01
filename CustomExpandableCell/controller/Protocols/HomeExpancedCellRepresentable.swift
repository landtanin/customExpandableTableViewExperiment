//
//  HomeExpandedCellRepresentable.swift
//  WL-Performance
//
//  Created by Tanin on 20/04/2018.
//  Copyright © 2018 forestrock. All rights reserved.
//

import UIKit

protocol HomeExpancedCellRepresentable {
    
    var id: String {get}
    var src: String {get}
    var time: String {get}
    var date: String {get}
    var note: String {get}
    var group: String {get}
    var statusColor: UIColor {get}
    var alarmType: String {get}
    var ackState: Int {get}
    
}
