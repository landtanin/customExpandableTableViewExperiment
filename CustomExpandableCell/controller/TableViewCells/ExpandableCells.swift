//
//  ExpandableCells.swift
//  ExpandableCell
//
//  Created by Seungyoun Yi on 2017. 8. 7..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit
import SwipeCellKit

//protocol ExpandableCellNavBtnDelegator {
//    func callSegueFromHomeCell(in section: Int)
//}

class SeeMoreCell: UITableViewCell {
    static let ID = "NormalCell"
    @IBOutlet var seeMoreCellMsgLbl: UILabel!
}

class ExpandableCellCell: UITableViewHeaderFooterView {
    
    @IBOutlet var alarmGroupNameLbl: UILabel!
    @IBOutlet var alarmGroupSubLbl: UILabel!
    @IBOutlet var alarmGroupAlarmNoLbl: UILabel!
    @IBOutlet var alarmGroupAlarmInfoLbl: UILabel!
    @IBOutlet var alarmGroupLastTimeLbl: UILabel!
    @IBOutlet var alarmGroupTimeLbl: UILabel!
    @IBOutlet var leftStatusStripeUiView: UIView!
    @IBOutlet var rightStatusStripeUiView: UIView!
    @IBOutlet var arrowImg: UIImageView!
    @IBOutlet var cardViewUIView: CardView!
    @IBOutlet var cardViewBound: UIView!
    
//    public var expandableCellCellDelegate:ExpandableCellNavBtnDelegator!
    static let ID = "ExpandableCell"
    
    var sectionNumber: Int = 0  // you don't have to do this, but it can be useful to have reference back to the section number so that when you tap on a button, you know which section you came from

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // TODO: this takes the shadows away, fix it
//        cardViewBound.layer.masksToBounds = true
//        cardViewBound.layer.cornerRadius = 5.0
        
    }
    
//    @IBAction func cellHiddenNavBtnTapped(_ sender: UIButton) {
//
//        if self.expandableCellCellDelegate != nil {
//            self.expandableCellCellDelegate.callSegueFromHomeCell(in: sectionNumber)
//        } else {
//            print("delegate == nil")
//        }
//
//    }
    
//    func configure(withViewModel viewModel: HomeMainCellRepresentable, groupId: String, mute: Bool) {
//
//        // swipeDelegator
//        self.groupId = groupId
//        isMuted = mute
//
//        // content
////        alarmGroupNameLbl.text = groupId
//        alarmGroupNameLbl.text = Utils.getGroupName(from: groupId)
//        alarmGroupAlarmNoLbl.text =   "No. of open alarms: \(viewModel.openAlarm)"
//        alarmGroupTimeLbl.text = "\(viewModel.time)"
//        alarmGroupAlarmInfoLbl.text = "No. of total alarm    : \(viewModel.totalAlarm)"
//        alarmGroupSubLbl.text = ""
//
//        // color
//        alarmGroupNameLbl.textColor = UIColor.App.Text.TitleDarkGray
//        alarmGroupSubLbl.textColor = UIColor.App.Text.SubTitleDarkGray
//        alarmGroupAlarmNoLbl.textColor = UIColor.App.Text.ContentLightGray
//        alarmGroupAlarmInfoLbl.textColor = UIColor.App.Text.ContentLightGray
//        alarmGroupLastTimeLbl.textColor = UIColor.App.Text.ContentLightGray
//        alarmGroupTimeLbl.textColor = UIColor.App.Text.ContentLightGray
//
//        if mute {
//            leftStatusStripeUiView.backgroundColor = UIColor.flatGray
//            rightStatusStripeUiView.backgroundColor = UIColor.flatGray
//        } else {
//            leftStatusStripeUiView.backgroundColor = viewModel.statusColor
//            rightStatusStripeUiView.backgroundColor = viewModel.statusColor
//        }
//
//    }
    
}

class ExpandedCellCell: WLExpandedCell {
    static let ID = "ExpandedCell"
    
    @IBOutlet var separatorView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var circleStatusUiImg: UIImageView!
    @IBOutlet var sourceOfAlarmLabel: UILabel!
    @IBOutlet var aboveAlarmLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    public var group: String?
    public var src: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
//    func configure(withViewModel viewModel: HomeExpancedCellRepresentable) {
//
//        // for alarmAcknowledging
//        alarmId = viewModel.id
////        self.realtimeReady = realtimeReady
//
//        // content
////        titleLabel.text = Utils.getGroupName(from: viewModel.group)
//        titleLabel.text = viewModel.src
//        sourceOfAlarmLabel.text = viewModel.alarmType
//        timeLabel.text = viewModel.time
//        self.group = viewModel.group
//        self.src = viewModel.src
//
//        // color
//        circleStatusUiImg.tintColor = viewModel.statusColor
//        titleLabel.textColor = UIColor.App.Text.SubTitleDarkGray
//        timeLabel.textColor = UIColor.App.Text.ContentLightGray
//        sourceOfAlarmLabel.textColor = UIColor.App.Text.ContentLightGray
//        aboveAlarmLabel.textColor = UIColor.App.Text.ContentLightGray
//
//    }
    
}
