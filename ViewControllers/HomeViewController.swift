//
//  HomeViewController.swift
//  Shift_Share
//
//  Created by user167528 on 7/20/20.
//  Copyright © 2020 user167528. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController
{
   

      @IBOutlet weak var tableView: UITableView!

        var ShiftList = [MyShifts]()
        var name:String = ""
        var startDate = Date()
        var endDate = Date()

        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.delegate = self
            tableView.dataSource = self
            tableView.reloadData()
            addtoTable()
        }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
        @IBAction func didTapAdd() {
            // show add vc
           // guard let vc = storyboard?.instantiateViewController(identifier: "add") as? CreateShiftViewController else {
             //   return
            //}
            self.performSegue(withIdentifier: "add", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier=="add"{
               _ = segue.destination as? CreateShiftViewController
            if segue.identifier=="calender"{
                _ = segue.destination as? CalenderViewController
            }
         //   vc.title = "Create New Shift"
       //     vc.navigationItem.largeTitleDisplayMode = .never
           // vc.completion = { title, startDate, endDate in
            //   DispatchQueue.main.async {
                    //self.navigationController?.popToRootViewController(animated: true)
//                    
//                    let new = MyShifts(Name: self.name, startDate: self.startDate, endDate: self.endDate)
//                    self.ShiftList.append(new)
//                    self.tableView.reloadData()

                  
              //  }
           // }
         //   navigationController?.pushViewController(vc, animated: true)

        }
    }
    func addtoTable(){
        let new = MyShifts(Name: self.name, startDate: self.startDate, endDate: self.endDate)
        self.ShiftList.append(new)
        
    }

        @IBAction func didTppedCalender() {
            //TODO: move to calender
            self.performSegue(withIdentifier: "calender", sender: self)
//            guard let vc1 = storyboard?.instantiateViewController(identifier: "calender") as? CalenderViewController else {
//                return
//            }
//             vc1.title = "Calender"
//             vc1.navigationItem.largeTitleDisplayMode = .never
//            navigationController?.pushViewController(vc1, animated: true)
        }
    

      

    }

    extension HomeViewController: UITableViewDelegate {

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }

    }


    extension HomeViewController: UITableViewDataSource {

        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return ShiftList.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "shiftCell", for: indexPath)
            let startShift = ShiftList[indexPath.row].startDate
            let endShift = ShiftList[indexPath.row].endDate
            

            let formatter = DateFormatter()
            let formatter2 = DateFormatter()
            
            formatter.dateFormat = "dd/MM/yyyy EEEE HH:MM a"
            formatter2.dateFormat = "dd/MM/yyyy EEEE HH:MM a"

            cell.textLabel?.text = formatter.string(from: startShift)
            cell.detailTextLabel?.text = formatter2.string(from: endShift)

            cell.textLabel?.font = UIFont(name: "Arial", size: 15)
            cell.detailTextLabel?.font = UIFont(name: "Arial", size: 15)
            
            return cell
        }

    }


    struct MyShifts {
        let Name: String
        let startDate: Date
        let endDate: Date
    
}
//   var shiftCell: ShiftUtil?
//   var shiftList =  [ShiftUtil]()
//   var startShift:String = ""
//   var endShift:String = ""
//
//    @IBOutlet weak var tableView: UITableView!
//    let dataID = "key"
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
//      //  tableView.reloadData()
//        // Do any additional setup after loading the view.
//     //   ShowShiftTable()
//        print(startShift)
//        print(endShift)
//    }
//    func addToShiftList(){
//         shiftCell?.startDate = startShift
//         shiftCell?.endDate = endShift
//     }
//}
//
//        //MARK: Delegate & DataSource Functions
//extension HomeViewController: UITableViewDelegate{
//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            tableView.deselectRow(at: indexPath, animated: true)
//        }
//
//    }
//extension HomeViewController: UITableViewDataSource{
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//                   return shiftList.count
//               }
//
//               func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//                   let cell = self.tableView.dequeueReusableCell(withIdentifier: "ShiftList") as?ShiftTableViewCell
//                   addToShiftList()
//                   cell?.startShiftLabel.text = shiftList[indexPath.row].startDate
//                   cell?.endShiftLabel.text = shiftList[indexPath.row].endDate
//
//
//
//                   return cell!
//               }
//    }
//
//
//
////        func ShowShiftTable(){
////            shiftCell?.startDate = startShift
////            shiftCell?.endDate = endShift
////            shiftList.append(shiftCell!)
////
////
//////            self.shiftList = readFromUserDF()
//////            if(shiftCell != nil){
//////            appendToShiftList(shiftCell:shiftCell!)
//////
//////            }
////
////
////        }
////        //MARK: UserDefaults Functions
////        func readFromUserDF()-> [ShiftUtil]{
////            if let data = UserDefaults.standard.data(forKey: dataID){
////                do{
////                    let JSONdecoder = JSONDecoder()
////                    self.shiftList =
////                        try
////                            JSONdecoder.decode([ShiftUtil].self, from: data)
////                    return self.shiftList
////                }catch{
////                    print("can't read from UserDefaults")
////                }
////
////            }
////            return [ShiftUtil]()
////        }
////
////        func writeToUserDF(ShiftListarray:[ShiftUtil]){
////            do{
////                let JSONencoder = JSONEncoder()
////                let data =
////                    try
////                        JSONencoder.encode(ShiftListarray)
////                UserDefaults.standard.set(data, forKey: dataID)
////                self.shiftList = readFromUserDF()
////            }catch{
////                print("can't write to UserDefaults")
////            }
////
////
////        }
////        //MARK: appand and update score list
////        func appendToShiftList(shiftCell:ShiftUtil){
////                self.shiftList.append(shiftCell)
////                //bsortHighScoreList()
////               // writeToUserDF(highScoreListarray: self.shiftList)
////
////        }
////
////
////
////}
//
//
//    //MARK: Inner Class
//    class ShiftTableViewCell
//    : UITableViewCell{
//
//
//        @IBOutlet weak var startShiftLabel: UILabel!
//
//        @IBOutlet weak var endShiftLabel: UILabel!
//
//
//}
