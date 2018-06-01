//
//  AlarmsGroupStatsVM.swift
//  WL-Performance
//
//  Created by Tanin on 17/05/2018.
//  Copyright © 2018 forestrock. All rights reserved.
//

import UIKit

struct AlarmsGroupStatsVM {
    
    let alarmsGroupStats: AlarmsGroupStatsModel?
    private let dayFormatter = DateFormatter()
    
    var id: String {
        return alarmsGroupStats?.alarmGroupId ?? ""
    }
    
    var time: String {
        dayFormatter.dateFormat = "dd MMM, HH:mm"
        // TODO: Provide default
        return dayFormatter.string(from: alarmsGroupStats?.timeOfLastAlarm ?? Date(timeIntervalSince1970: 0))
    }
    
    var openAlarm: String {
        return alarmsGroupStats?.openAlarmCount ?? "-"
    }
    
    var totalAlarm: String {
        return alarmsGroupStats?.alarmCount ?? "-"
    }
    
    var statusColor: UIColor {
        if let numberOfOpenAlarm = alarmsGroupStats?.openAlarmCount {
            if numberOfOpenAlarm == "0" {
                return UIColor.HomeScreen.Status.Green!
            } else {
                return UIColor.HomeScreen.Status.Red!
            }
        } else {
            return UIColor.flatGray
        }
    }
    
}

extension AlarmsGroupStatsVM: HomeMainCellRepresentable {
    
}

