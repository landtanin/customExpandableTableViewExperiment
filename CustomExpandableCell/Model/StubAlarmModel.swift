//
//  StubAlarmModel.swift
//  WL-Performance
//
//  Created by Tanin on 13/04/2018.
//  Copyright © 2018 forestrock. All rights reserved.
//

import Foundation

class StubAlarmModel {
    
    var id : String? {
        get {
            return self.id
        }
        set {
            self.id = newValue
        }
    }
    var alarm_group : String?
    var external_id : String?
    var source : String?
    var ack_required : Bool?
    var ack_time : String?
    var user : String?
    var last_updated : String?
    var processed_time : String?
    var alarm_state : String?
    var alarm_type : String?
    var ack_state : String?
    
}
