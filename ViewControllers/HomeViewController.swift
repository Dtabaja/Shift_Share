//
//  HomeViewController.swift
//  Shift_Share
//
//  Created by user167528 on 7/20/20.
//  Copyright © 2020 user167528. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class HomeViewController: UIViewController
{
   

      @IBOutlet weak var tableView: UITableView!

        var ShiftList = [MyShifts]()
       // var name:String = ""
      //  var startDate = Date()
     //   var endDate = Date()
    //    var userId = ""
        var db = Firestore.firestore()

        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.delegate = self
            tableView.dataSource = self
            addtoTable()
            tableView.reloadData()
        //    let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backPressed(_:)))
            //navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }
//    @objc func backPressed(_ sender: Any){
//        self.navigationController?.popViewController(animated: true)
//
//    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
        @IBAction func didTapAdd() {
    
            self.performSegue(withIdentifier: "add", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier=="add"{
               _ = segue.destination as? CreateShiftViewController
            if segue.identifier=="calender"{
                _ = segue.destination as? CalenderViewController
            }
    
        }
    }
    func addtoTable(){
        db.collection("Shifts").whereField("uid", isEqualTo: Auth.auth().currentUser!.uid).getDocuments { (querySnapshot, error) in
            if error != nil {
                return
            }else{
                for document in querySnapshot!.documents{
                    let name = document.get("Name") as! String
                    let startShiftDate = document.get("Start Shift") as! String
                    let endShiftDate = document.get("End Shift") as! String
                    let endDate = document.get("End Date") as! String
                    let startDate = document.get("Start Date") as! String
                    let uid = document.get("uid") as! String
                    self.ShiftList.append(MyShifts(Name: name, startShift: startShiftDate, endShift: endShiftDate, startDate: startDate, endDate: endDate, uid: uid))
         
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        
    }

        @IBAction func didTppedCalender() {
            self.performSegue(withIdentifier: "calender", sender: self)
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
            
            let startShift = self.ShiftList[indexPath.row].startShift
            let endShift = self.ShiftList[indexPath.row].endShift
            

            let formatter = DateFormatter()
            let formatter2 = DateFormatter()
            
            formatter.dateFormat = "dd/MM/yyyy EEEE HH:MM a"
            formatter2.dateFormat = "dd/MM/yyyy EEEE HH:MM a"

            cell.textLabel?.text = startShift
            cell.detailTextLabel?.text = endShift
            cell.textLabel?.font = UIFont(name: "Arial", size: 15)
            cell.detailTextLabel?.font = UIFont(name: "Arial", size: 15)
            
            return cell
        }
        
        

    }


    struct MyShifts {
        let Name: String
        let startShift: String
        let endShift: String
        let startDate: String
        let endDate: String
        let uid: String
    
}
