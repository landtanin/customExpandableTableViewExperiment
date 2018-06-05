//
//  ViewController.swift
//  CustomExpandableCell
//
//  Created by Tanin on 01/06/2018.
//  Copyright © 2018 forestrock. All rights reserved.
//

import UIKit

class ExpandableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var expandTable: UITableView!
//    var header: UIView!
    var offset:CGFloat = 0
    let bgViewWidth: CGFloat = 100
    let bgViewHeight: CGFloat = 122
    
    var expandData = [NSMutableDictionary]()
    var headerTitles = ["lbl 1", "lbl 2", "lbl 3", "lbl 4", "lbl 5", "lbl 6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.expandData.append(["isOpen":"1","data":["banana","mango","mango","mango","mango"]])
        self.expandData.append(["isOpen":"1","data":["banana","mango","apple","mango","mango"]])
        self.expandData.append(["isOpen":"1","data":["banana","mango","mango","mango","mango"]])
        self.expandData.append(["isOpen":"1","data":["banana","mango"]])
        self.expandData.append(["isOpen":"1","data":["banana","mango","apple"]])
        self.expandData.append(["isOpen":"1","data":["banana"]])
        
        expandTable.delegate = self
        expandTable.dataSource = self
        
        expandTable.register(UINib(nibName: "ExpandedCell", bundle: nil), forCellReuseIdentifier: "ExpandedCell")
        
        expandTable.register(UINib(nibName: "ExpandableCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "ExpandableCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.expandData[section].value(forKey: "isOpen") as! String == "1"{
            return 0
        }else{
            let dataarray = self.expandData[section].value(forKey: "data") as! NSArray
            return dataarray.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.expandData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandedCell", for: indexPath) as! ExpandedCellCell
        
        let dataarray = self.expandData[indexPath.section].value(forKey: "data") as! NSArray
        cell.sourceOfAlarmLabel.text = dataarray[indexPath.row] as? String
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {

        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ExpandableCell") as! ExpandableCellCell
        
        headerView.alarmGroupNameLbl.text = headerTitles[section]
        headerView.alarmGroupTimeLbl.text = "Time lbl works"
        headerView.sectionNumber = section
        headerView.backgroundColor = UIColor.blue
        headerView.backgroundView?.backgroundColor = UIColor.green
        
        headerView.tag = section + 100
        
        let buttonWidth: CGFloat = bgViewWidth - 15
        let buttonHeight: CGFloat = bgViewHeight - 15
        let button = MuteButton(frame: CGRect(x: headerView.frame.origin.x - buttonWidth, y: headerView.frame.origin.y + 10, width: buttonWidth, height: buttonHeight), groupId: String(section))
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor.HomeScreen.Swipe.MuteBtnWhite
        let muteIcon = Utils.resizeImage(image: UIImage(named: "mute_icon")!, targetSize: CGSize(width: 30.0, height: 30.0))
        button.setImage(muteIcon, for: .normal)
        button.addTarget(self, action: #selector(muteBtnTapped(_:)), for: .touchUpInside)
        
//        button.layer.shadowRadius = 2
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOffset = CGSize(width: 2, height: 2)
//        button.layer.shadowOpacity = 0.3
//        headerView.isUserInteractionEnabled = true
        headerView.clipsToBounds = false
        headerView.addSubview(button)
//        headerView.contentView.isUserInteractionEnabled = false
        headerView.contentView.clipsToBounds = false
        headerView.bringSubview(toFront: button)
//        headerView.subviews[0].isUserInteractionEnabled = false
//        headerView.subviews[1].isUserInteractionEnabled = false
//        headerView.subviews[2].layer.zPosition = 3;
        
//        headerView.isUserInteractionEnabled = true
//        headerView.bringSubview(toFront: button)
//        print("headerView.subviews.count = \(headerView.subviews.count)")
//        print("headerView.subviews[0] = \(headerView.subviews[0])")
//        print("headerView.subviews[1] = \(headerView.subviews[1])")
//        print("headerView.subviews[2] = \(headerView.subviews[2])")
        
        
        let tapgesture = UITapGestureRecognizer(target: self , action: #selector(self.sectionTapped(_:)))
        headerView.addGestureRecognizer(tapgesture)
        
        let leftSwipe = CustomUISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)), sectionNumber: section)
        let rightSwipe = CustomUISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)), sectionNumber: section)
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        headerView.addGestureRecognizer(leftSwipe)
        headerView.addGestureRecognizer(rightSwipe)
        
        return headerView

    }

    @objc func handleSwipes(_ sender:CustomUISwipeGestureRecognizer) {
        
        let sectionNum = sender.sectionNumber
        let headerCell = expandTable.headerView(forSection: sectionNum)!
        
//        self.expandTable.beginUpdates()
//        self.expandTable.deleteSections([0], with: .right)
//        self.expandTable.insertSections([2], with: .left)
//        self.expandTable.endUpdates()
        
        if (sender.direction == .left && headerCell.frame.origin.x != 0) {

            print("Swipe Left")
            let labelPosition = CGPoint(x: headerCell.frame.origin.x - bgViewWidth, y: headerCell.frame.origin.y)
            UIView.animate(withDuration: 0.4, delay: 0.0, options: [], animations: {
                
                headerCell.frame = CGRect(x: labelPosition.x, y: labelPosition.y, width: headerCell.frame.size.width, height: headerCell.frame.size.height)
                
            }, completion: nil)

        }

        if (sender.direction == .right && headerCell.frame.origin.x == 0) {
            print("Swipe Right")
            let labelPosition = CGPoint(x: headerCell.frame.origin.x + bgViewWidth, y: headerCell.frame.origin.y)
            UIView.animate(withDuration: 0.4, delay: 0.0, options: [], animations: {
                
                headerCell.frame = CGRect(x: labelPosition.x, y: labelPosition.y, width: headerCell.frame.size.width, height: headerCell.frame.size.height)
                
            }, completion: nil)

        }
    }
    
    @objc func sectionTapped(_ sender: UITapGestureRecognizer){
        
        print("sectionTapped")
        if(self.expandData[(sender.view?.tag)! - 100].value(forKey: "isOpen") as! String == "1"){
            self.expandData[(sender.view?.tag)! - 100].setValue("0", forKey: "isOpen")
        }else{
            self.expandData[(sender.view?.tag)! - 100].setValue("1", forKey: "isOpen")
        }
        self.expandTable.reloadSections(IndexSet(integer: (sender.view?.tag)! - 100), with: .automatic)
        
    }
    
    // MARK: Action methods
    @objc func muteBtnTapped(_ sender: MuteButton!) {
        print("mute btn tapped : \(sender.groupId)")
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 122
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
