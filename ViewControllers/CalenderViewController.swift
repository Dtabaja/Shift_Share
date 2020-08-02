//
//  CalenderViewController.swift
//  Shift-Share
//
//  Created by user167528 on 7/22/20.
//  Copyright © 2020 user167528. All rights reserved.
//

import UIKit
import FSCalendar
import Firebase
import FirebaseAuth

class CalenderViewController: UIViewController, FSCalendarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var calender: FSCalendar!
    var db = Firestore.firestore()
    var ShiftList = [MyShiftHour]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calender.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.reloadData()
        
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE dd/MM/yyyy"
        let string = formatter.string(from: date)
        self.ShiftList.removeAll()
        
        db.collection("Shifts").whereField("Start Date", isEqualTo: string).getDocuments { (querySnapshot, error) in
            if error != nil {
                return
            }else{
                for document in querySnapshot!.documents{
                    let name = document.get("Name") as! String
                    let startHour = document.get("Start Hour") as! String
                    let endHour = document.get("End Hour") as! String
                    let uid = document.get("uid") as! String
                    self.ShiftList.append(MyShiftHour(Name: name, startHour: startHour, endHour: endHour, uid: uid))
                    print(self.ShiftList)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShiftList.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShiftListCalender", for: indexPath) as? CalenderLabels
        
        let name = self.ShiftList[indexPath.row].Name
        let startShift = self.ShiftList[indexPath.row].startHour
        let endShift = self.ShiftList[indexPath.row].endHour
        
        cell?.nameLabel?.text = name
        cell?.startLabel?.text = startShift
        cell?.endLabel?.text = endShift
        
        
        cell?.nameLabel?.font = UIFont(name: "Arial", size: 15)
        cell?.startLabel?.font = UIFont(name: "Arial", size: 13)
        cell?.endLabel?.font = UIFont(name: "Arial", size: 13)
        
        return cell!
    }
    
    
}
class CalenderLabels: UITableViewCell{
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var endLabel: UILabel!
}
struct MyShiftHour {
    let Name: String
    let startHour: String
    let endHour: String
    let uid: String
    
}


