//
//  AlarmRecordModel.swift
//  WL-Performance
//
//  Created by Tanin on 25/04/2018.
//  Copyright © 2018 forestrock. All rights reserved.
//

import Foundation

class AlarmRecordModel {
    
    // 1-5
    @objc dynamic var time = Date()
    @objc dynamic var id: String = ""
    @objc dynamic var alarmGroup: String = ""
    @objc dynamic var externalId: String = ""
    @objc dynamic var source: String = ""
    // 6-10
    @objc dynamic var ackRequired: Bool = false
    @objc dynamic var ackTime = Date()
    @objc dynamic var user: String = ""
    @objc dynamic var lastUpdated = Date()
    @objc dynamic var processedTime = Date()
    
}
