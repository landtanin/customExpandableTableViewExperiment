//
//  Constants.swift
//  WL-Performance
//
//  Created by Tanin on 18/04/2018.
//  Copyright © 2018 forestrock. All rights reserved.
//

import Foundation

struct Constants {
    
//    static let stubAvaliableAlarmGroup = ["FIRE1", "LIFT", "PORCH", "MANOJ", "TANIN", "OLI"]
//    static let stubAvaliableAlarmGroup = ["FIRE1", "LIFT", "PORCH"]
//    static let stubAvaliableAlarmGroup = ["FIRE1"]
//    static let stubAvaliableAlarmGroup = ["Tony", "Steve"]
//    static let stubAvaliableAlarmGroup = ["Time", "Space", "Power", "Soul", "Mind", "Reality"]
//    static let stubAvaliableAlarmGroup = ["Time", "Space"]
    
    static let alarmGroupIdKey = "alarmGroupIdKey"
    static let alarmGroupKey = "alarmGroupKey"
    static let realtimeReadyKey = "realtimeReadyKey"
    static let filterRangeKey = "filterRangeKey"
    static let filterTimeRangeEnumKey = "filterTimeRangeEnumKey"

    static let alarmGroupTimeRange = ["today": "Today", "yesterday": "Yesterday", "thisMonth": "This Month", "lastMonth": "Last Month"]
    
//    var stubFilterOptionStrs = ["All time", "Live", "Today", "Yesterday", "This Month", "Last Month"]
    
    static let filterDialogCancelBtnStr: String = "Cancel"
    static let filterDialogApplyBtnStr: String = "Apply"
    
    static let ackNoteDialogCancelBtnStr: String = "Cancel"
    static let ackNoteDialogOkBtnStr: String = "OK"
    
//    static let ackFailedAlartMsg: String = "Acknowledge failed\nCannot extablish connection"
    static let ackFailedAlartMsg: String = "Acknowledge failed"
   
}
