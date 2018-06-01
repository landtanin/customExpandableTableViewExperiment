//
//  AlarmRecordVM.swift
//  WL-Performance
//
//  Created by Tanin on 20/04/2018.
//  Copyright © 2018 forestrock. All rights reserved.
//

import UIKit

struct AlarmRecordVM {
    
    let alarmRecord: AlarmRecordModel?
    private let dayFormatter = DateFormatter()
    
    // MARK: STUB
    var note: String {
        return "No notes"
    }
    
    // MARK: real data
    var id: String {
        
        return alarmRecord?.id ?? ""
        
    }
    
    var src: String {
        
        return alarmRecord?.source ?? "No src"
        
    }
    
    var time: String {
        
        dayFormatter.dateFormat = "HH:mm"
        if let alarmRecord = alarmRecord {
            return dayFormatter.string(from: alarmRecord.time)
        }
        return "-"
        
    }
    
    var date: String {
        
        dayFormatter.dateFormat = "dd MMM YY"
        if let alarmRecord = alarmRecord {
            return dayFormatter.string(from: alarmRecord.time)
        }
        return "-"
        
    }
    
    var group: String {
        if let alarmRecord = alarmRecord {
            return alarmRecord.alarmGroup
        }
        return "-"
    }
    
    var statusColor : UIColor {

        // ackState
//        acknowledged // = 0
//        unAcknowledged // = 1
        
        // alarmState
//        inAlarm // = 0
//        normal // = 1
        
        let alarmState = 0
        let ackState = 1
        
        if alarmState==0 {
            if ackState==0 {
                return UIColor.HomeScreen.Status.Green!
            } else if ackState == 1{
                return UIColor.HomeScreen.Status.Red!
            } else {
                return UIColor.flatGray
            }
        } else if alarmState==1 {
            if ackState==0 {
                return UIColor.HomeScreen.Status.Green!
            } else if ackState==1{
                return UIColor.HomeScreen.Status.Yellow!
            } else {
                return UIColor.flatGray
            }
        } else {
            return UIColor.flatGray
        }
        
    }
    
    var alarmType : String {
        
        switch 0 {
        case 0:
            return "Off normal"
        case 1:
            return "Alert"
        case 2:
            return "Fault"
        default:
            return "Default"
        }
        
    }
    
    var ackState: Int {
        
        return 0 // acknowledged as defaults
        
    }
    
}

extension AlarmRecordVM: HomeExpancedCellRepresentable {
    
}
