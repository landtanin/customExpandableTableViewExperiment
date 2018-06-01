//
//  AckAlarmViewModel.swift
//  WL-Performance
//
//  Created by Tanin on 27/04/2018.
//  Copyright © 2018 forestrock. All rights reserved.
//

import Foundation

class AckAlarmVM {
    
    // Closures for binding
    var alarmAcked: ((Bool, String, IndexPath) -> ())?
    
    public var ackResponseSuccess: Bool = false {
        didSet {
            alarmAcked?(ackResponseSuccess, alarmId, indexPath)
        }
    }
    
    var alarmId: String = "" {
        didSet {
//            updateAckAlarm(ackAlarmId: alarmId, haveNote: haveNote, note: note)
        }
    }
    
    var haveNote: Bool {
        return note != ""
    }
    
    var note: String = ""
    var indexPath: IndexPath!
    
//    private func updateAckAlarm(ackAlarmId: String, haveNote: Bool, note: String) {
//
//        var ackAlarmRequest = UkCoForestrockWorklife_AckAlarmRequest()
//        ackAlarmRequest.alarmID = ackAlarmId
//        if haveNote {
//            var ackAlarmNote = UkCoForestrockWorklife_Note()
//            ackAlarmNote.user = "User: Tanin"
//            ackAlarmNote.note = note
//        }
//
//        AlarmService.instance.ackAlarm(request: ackAlarmRequest) { (response, error) in
//
//            if let error = error {
//
//                print("AckAlarmVM updateAckAlarm error = \(error)")
//                // trigger back to VCs to update their views
//                self.ackResponseSuccess = false
//
//            } else if let response = response {
//
//                print("AckAlarmVM updateAckAlarm response = \(response.debugDescription)")
//                // trigger back to VCs to update their views
//                self.ackResponseSuccess = true
//
//            } else { // Alarm already acknowledged
//
//                print("AckAlarmVM updateAckAlarm (already acknowledged) response = \(response.debugDescription)")
//                self.ackResponseSuccess = true
//
//            }
//
//        }
//
//    }
    
}

























