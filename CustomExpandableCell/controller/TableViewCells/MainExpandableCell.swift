//
//  ExpandableCell.swift
//  WL-Performance
//
//  Created by Tanin on 10/04/2018.
//  Copyright © 2018 forestrock. All rights reserved.
//

import UIKit
import SwipeCellKit

protocol SwipeMuteDelegator {
    func mute(groupId: String)
    func unMute(groupId: String)
}

class MainExpandableCell: SwipeTableViewCell, SwipeTableViewCellDelegate {

    public var swipeMuteDelegate: SwipeMuteDelegator!
    public var groupId: String!
    public var isMuted: Bool!
    var isOpen = false
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        delegate = self

    }
    
    func open() {
        self.isOpen = true
    }
    
    func close() {
        self.isOpen = false
    }
    
    open func isExpanded() -> Bool {
        return isOpen
    }
    
    // swiping actions
    public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {

        let muteAlarmAction: SwipeAction
        let ackWithNote: SwipeAction

        if orientation == .left {
           
            muteAlarmAction = SwipeAction(style: .default, title: "Mute") { action, indexPath in
                // handle action by updating model with deletion
                if self.swipeMuteDelegate != nil {
                 
                    if self.isMuted {
                        self.swipeMuteDelegate.unMute(groupId: self.groupId)
                    } else {
                        self.swipeMuteDelegate.mute(groupId: self.groupId)
                    }
                    
                    self.isMuted = !self.isMuted
                    
                }
                
            }
            
            if isMuted {
                muteAlarmAction.title = "Unmute"
                muteAlarmAction.image = UIImage(named: "unmute_icon")
            } else {
                muteAlarmAction.title = "Mute"
                muteAlarmAction.image = UIImage(named: "mute_icon")
            }

            // customize the action appearance
            muteAlarmAction.backgroundColor = UIColor(hexString: "EFF0F1")
            muteAlarmAction.textColor = UIColor(hexString: "999999")

            return [muteAlarmAction]

        }

        return nil

    }

}

