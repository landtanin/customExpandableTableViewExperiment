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
//        let headerView: UIView!
//        if section == 0 {
//            headerView = (Bundle.main.loadNibNamed("ExpandableCell", owner: self, options: nil)![0] as? UIView)!
//        } else {
//            headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
//            headerView.backgroundColor = UIColor.gray
//            let label = UILabel(frame: CGRect(x: 5, y: 3, width: headerView.frame.size.width - 5, height: 27))
//            label.text = "\(section)"
//            headerView.addSubview(label)
//        }
//
////        UINib(nibName: "ExpandableCell", bundle: nil)
////        let headerView: UIView = (Bundle.main.loadNibNamed("ExpandableCell", owner: self, options: nil)![0] as? UIView)!
//        headerView.tag = section + 100
//
//        let tapgesture = UITapGestureRecognizer(target: self , action: #selector(self.sectionTapped(_:)))
//        headerView.addGestureRecognizer(tapgesture)
//        return headerView

        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ExpandableCell") as! ExpandableCellCell
        
        headerView.alarmGroupNameLbl.text = headerTitles[section]
        headerView.alarmGroupTimeLbl.text = "Time lbl works"
        headerView.sectionNumber = section
//        headerView.expandableCellCellDelegate = self
        headerView.backgroundColor = UIColor.blue
        
        headerView.tag = section + 100
        
        let tapgesture = UITapGestureRecognizer(target: self , action: #selector(self.sectionTapped(_:)))
        headerView.addGestureRecognizer(tapgesture)
        
//        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let leftSwipe = CustomUISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)), sectionNumber: section)
        let rightSwipe = CustomUISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)), sectionNumber: section)
        
//        leftSwipe.setValue(section, forKey: "sectionKey")
//        rightSwipe.setValue(section, forKey: "sectionKey")
        
//        leftSwipe.setValue(section, forKeyPath: "sectionKey")
//        rightSwipe.setValue(section, forKeyPath: "sectionKey")
        
//        leftSwipe.setValue(section, forUndefinedKey: "sectionKey")
//        rightSwipe.setValue(section, forUndefinedKey: "sectionKey")
        
//        leftSwipe.setValuesForKeys(["sectionKey": section])
//        rightSwipe.setValuesForKeys(["sectionKey": section])
        
//        leftSwipe.setValue(section, forKeyPath: "sectionKey")
//        rightSwipe.setValue(section, forKeyPath: "sectionKey")
        
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        headerView.addGestureRecognizer(leftSwipe)
        headerView.addGestureRecognizer(rightSwipe)
        
//        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
//        headerView.addGestureRecognizer(panGesture)
        
        let bgViewWidth: CGFloat = 145
        let bgViewHeight: CGFloat = 122
        let muteBtnBGView = UIView(frame: CGRect(x: headerView.frame.origin.x - 145, y: headerView.frame.origin.y, width: bgViewWidth, height: bgViewHeight))
        muteBtnBGView.backgroundColor = UIColor.HomeScreen.Swipe.GrayBG
        
        let buttonWidth: CGFloat = 130
        let buttonHeight: CGFloat = 107 // (bgHeight - 15)
        let button = UIButton(frame: CGRect(x: headerView.frame.origin.x - 130, y: headerView.frame.origin.y + 10, width: buttonWidth, height: buttonHeight))
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor.HomeScreen.Swipe.MuteBtnWhite
        let muteIcon = Utils.resizeImage(image: UIImage(named: "mute_icon")!, targetSize: CGSize(width: 30.0, height: 30.0))
        button.setImage(muteIcon, for: .normal)
        button.addTarget(self, action: #selector(self.newDataAvailableBtnTapped), for: .touchUpInside)
//        button.layer.shadowRadius = 2
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOffset = CGSize(width: 2, height: 2)
//        button.layer.shadowOpacity = 0.3
        
        headerView.addSubview(muteBtnBGView)
        headerView.addSubview(button)
        headerView.clipsToBounds = false
        
        return headerView

    }
    
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
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
            let labelPosition = CGPoint(x: headerCell.frame.origin.x - 145.0, y: headerCell.frame.origin.y)
            UIView.animate(withDuration: 0.4, delay: 0.0, options: [], animations: {
                
                headerCell.frame = CGRect(x: labelPosition.x, y: labelPosition.y, width: headerCell.frame.size.width, height: headerCell.frame.size.height)
                
            }, completion: nil)

        }

        if (sender.direction == .right && headerCell.frame.origin.x == 0) {
            print("Swipe Right")
            let labelPosition = CGPoint(x: headerCell.frame.origin.x + 145.0, y: headerCell.frame.origin.y)
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
    @objc func newDataAvailableBtnTapped(sender: UIButton!) {
        print("Button tapped")
        
        let top = CGAffineTransform(translationX: 0, y: -43)
        UIView.animate(withDuration: 0.4, delay: 0.0, options: [], animations: {
            // Add the transformation in this block
            sender.transform = top
        }, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 122
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
