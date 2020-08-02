//
//  CreateShiftViewController.swift
//  Shift-Share
//
//  Created by user167528 on 7/26/20.
//  Copyright © 2020 user167528. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class CreateShiftViewController: UIViewController, UITextFieldDelegate {
    
    // @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var startDatePicker: UIDatePicker!
    
    @IBOutlet weak var NameText: UITextField!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    var db = Firestore.firestore()
    
    
   // public var completion: ((String, Date, Date) -> Void)?
    // var startShift:String = ""
    //   var endShift:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NameText.delegate = self
      //  navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSaveButton))
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
//    @objc func didTapSaveButton() {
//        if let titleText = NameText.text, !titleText.isEmpty
//
//        {
//
//            let startDate = startDatePicker.date
//            let endDate = endDatePicker.date
//            completion?(titleText,startDate,endDate)
//         _ = navigationController?.popViewController(animated: true)
//        }
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    @IBAction func saveClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "Save", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="Save"{
          //  let homeViewController = segue.destination as? HomeViewController
//            if let titleText = NameText.text, !titleText.isEmpty
//
//                  {
//            let startDate = startDatePicker.date
//            let endDate = endDatePicker.date
//            completion?(titleText,startDate,endDate)
//            }
//            homeViewController?.startDate = startDatePicker.date
//            homeViewController?.endDate = endDatePicker.date
//            homeViewController!.name = NameText.text!
            let formatter = DateFormatter()
            let formatterCalender = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy EEEE HH:MM a"
            formatterCalender.dateFormat = "EEEE dd/MM/yyyy"
            let startDate1 = formatter.string(from: startDatePicker.date)
            let endDate1 = formatter.string(from: endDatePicker.date)
            
            let startDate2 = formatterCalender.string(from: startDatePicker.date)
            let endDate2 = formatterCalender.string(from: endDatePicker.date)

            db.collection("Shifts").addDocument(data:["Start Shift" : startDate1,"End Shift":endDate1, "Name": NameText.text!, "uid": Auth.auth().currentUser!.uid])
            db.collection("CalenderShifts").addDocument(data: ["Start Shift" : startDate2,"End Shift":endDate2, "Name": NameText.text!, "uid": Auth.auth().currentUser!.uid])
            
            
            }
        
    }
    
}



//
//    @IBAction func startdateSelectedFromDatePicker(_ : AnyObject){
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd/MM/yyyy EEEE HH:MM"
//        startShift = formatter.string(from: startDatePicker.date)
//
//    }
//    @IBAction func enddateSelectedFromDatePicker(_ : AnyObject){
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd/MM/yyyy EEEE HH:MM"
//        endShift = formatter.string(from: endDatePicker.date)
//
//    }
//    @IBAction func saveTapped(_ sender: Any) {
//
////        if(startShift>endShift){
////            print("error")
////            return
////            //   print(self.startShift)
////            //   print(self.endShift)
////
////
////        }else{
//            self.performSegue(withIdentifier: "BackToHome", sender: self)
////        }
//    }
//    //MARK: Navigation == Intent(Android)
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier == "BackToHome"){
//            let saveView = segue.destination as! HomeViewController
//            saveView.startShift = self.startShift
//            saveView.endShift = self.endShift
//
//        }
//    }

