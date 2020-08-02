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
    var ShiftList = [MyShifts]()

   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calender.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.reloadData()
        

        // Do any additional setup after loading the view.
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE dd/MM/yyyy"
        let string = formatter.string(from: date)
        self.ShiftList.removeAll()
        
        db.collection("CalenderShifts").whereField("Start Shift", isEqualTo: string).getDocuments { (querySnapshot, error) in
                  if error != nil {
                      return
                  }else{
                      for document in querySnapshot!.documents{
                          let name = document.get("Name") as! String
                          let startShiftDate = document.get("Start Shift") as! String
                          let endShiftDate = document.get("End Shift") as! String
                          let uid = document.get("uid") as! String
                          self.ShiftList.append(MyShifts(Name: name, startDate: startShiftDate, endDate: endShiftDate, uid: uid))
                        print(self.ShiftList)
                      }
                      DispatchQueue.main.async {
                          self.tableView.reloadData()
                      }
                  }
              }
        
        print("\(string)")
        print(ShiftList)
        
        
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
                    let startShift = self.ShiftList[indexPath.row].startDate
                    let endShift = self.ShiftList[indexPath.row].endDate
                    

                    let formatter = DateFormatter()
                    let formatter2 = DateFormatter()
                    
                    formatter.dateFormat = "dd/MM/yyyy EEEE HH:MM a"
                    formatter2.dateFormat = "dd/MM/yyyy EEEE HH:MM a"

                    
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
    
//    @IBOutlet weak var endLabel: UILabel!
//
//    @IBOutlet weak var startLabel: UILabel!
//
//    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var startLabel: UILabel!
    
    @IBOutlet weak var endLabel: UILabel!
    
}
   


