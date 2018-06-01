//
//  ExpandedCell.swift
//  WL-Performance
//
//  Created by Tanin on 24/04/2018.
//  Copyright © 2018 forestrock. All rights reserved.
//

import UIKit
import SwipeCellKit

protocol SwipeAckDelegator {
    func ackWithOutNote(indexPath: IndexPath, alarmId: String)
    func ackWithNote(indexPath: IndexPath, alarmId: String)
}

class WLExpandedCell: SwipeTableViewCell, SwipeTableViewCellDelegate {
    
    public var swipeAckDelegate:SwipeAckDelegator!
    public var alarmId:String!
//    public var realtimeReady: Bool!
    let defaults = UserDefaults.standard
    public var disableSwipe: Bool?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        
        let ackSwipeAct: SwipeAction
        let ackWithNoteSwipeAct: SwipeAction
        
        if let disableSwipe = disableSwipe {
            if disableSwipe {
                return []
            }
        }
//        if defaults.bool(forKey: Constants.realtimeReadyKey) {
        
            if orientation == .left {
                
                ackSwipeAct = SwipeAction(style: .destructive, title: "Acknowledge\n") { action, indexPath in
                    
                    // handle action by updating model with deletion
                    if self.swipeAckDelegate != nil {
                        
                        guard let id = self.alarmId else {
                            // TODO notify user that something's wrong
                            return
                        }
                        
                        self.swipeAckDelegate.ackWithOutNote(indexPath: indexPath, alarmId: id)
                    }
                    
                }
                
                ackSwipeAct.image = Utils.resizeImage(image: UIImage(named: "tick_mark")!, targetSize: CGSize(width: 18.0, height: 100.0))
                ackSwipeAct.backgroundColor = UIColor.HomeScreen.Swipe.Green
                ackSwipeAct.identifier = "swipe ack identifier"
                ackSwipeAct.fulfill(with: .delete)
                ackSwipeAct.font = UIFont(name: "SFUIDisplay-Light", size: 12.0) ?? UIFont.systemFont(ofSize: 12.0)
                
                return [ackSwipeAct]
                
            } else {
                
                ackWithNoteSwipeAct = SwipeAction(style: .destructive, title: "Acknowledge with note\n") { action, indexPath in
                    // handle action by updating model with deletion
                    if self.swipeAckDelegate != nil {
                        print("WLExpandedCell dialog presented")
                        self.swipeAckDelegate.ackWithNote(indexPath: indexPath, alarmId: self.alarmId)
                    }
                }
                
                // customize the action appearance
                ackWithNoteSwipeAct.image = Utils.resizeImage(image: UIImage(named: "tick_mark")!, targetSize: CGSize(width: 18.0, height: 100.0))
                ackWithNoteSwipeAct.backgroundColor = UIColor.HomeScreen.Swipe.Blue
                ackWithNoteSwipeAct.fulfill(with: .delete)
                ackWithNoteSwipeAct.font = UIFont(name: "SFUIDisplay-Light", size: 12.0) ?? UIFont.systemFont(ofSize: 12.0)
                
                return [ackWithNoteSwipeAct]
                
            }
            
//        }
//
//        return []
        
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeTableOptions {
        
        var options = SwipeTableOptions()
        options.transitionStyle = .border
        options.expansionStyle = .destructive(automaticallyDelete: false)
//        options.expansionStyle = .fill
        //        options.expansionStyle = .selection
        return options
        
    }
    
}
