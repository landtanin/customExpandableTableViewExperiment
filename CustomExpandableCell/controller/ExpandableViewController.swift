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
    
    var expandData = [NSMutableDictionary]()
    
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
        
        headerView.alarmGroupNameLbl.text = "Name lbl"
        headerView.alarmGroupTimeLbl.text = "Time lbl works"
//        headerView.expandableCellCellDelegate = self
        headerView.backgroundColor = UIColor.blue
//        headerView.contentView.backgroundColor = UIColor.brown
        
        headerView.tag = section + 100
        
        let tapgesture = UITapGestureRecognizer(target: self , action: #selector(self.sectionTapped(_:)))
        headerView.addGestureRecognizer(tapgesture)
        
        return headerView

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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 122
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}

//extension ExpandableViewController: ExpandableCellNavBtnDelegator {
//    
//    func callSegueFromHomeCell(in section: Int) {
//        print("It works!")
//    }
//  
//}
