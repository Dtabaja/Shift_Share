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
    
    
    
    @IBOutlet weak var startDatePicker: UIDatePicker!
    
    @IBOutlet weak var NameText: UITextField!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    var db = Firestore.firestore()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NameText.delegate = self
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    @IBAction func saveClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "Save", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="Save"{
            if(NameText.text == ""){
                showAlert("Warning", "Please enter a name")
                return
            }else if(startDatePicker.date>endDatePicker.date)
            {
                showAlert("Warning", "Invalid Schedule")
                return
            }else{
                let formatterStart = DateFormatter()
                let formatterEnd = DateFormatter()
                let formatterCalender = DateFormatter()
                let formatterHourStart = DateFormatter()
                let formatterHourEnd = DateFormatter()
                
                formatterStart.dateFormat = "'Start Shift: 'EEEE dd/MM/yyyy  HH:MM a"
                formatterEnd.dateFormat = "'End Shift: ' EEEE dd/MM/yyyy  HH:MM a"
                formatterCalender.dateFormat = "EEEE dd/MM/yyyy"
                formatterHourStart.dateFormat = "'Start:'HH:MM a"
                formatterHourEnd.dateFormat = "'End:'EEEE HH:MM a"
                
                let startDate1 = formatterStart.string(from: startDatePicker.date)
                let endDate1 = formatterEnd.string(from: endDatePicker.date)
                
                let startDate2 = formatterCalender.string(from: startDatePicker.date)
                let endDate2 = formatterCalender.string(from: endDatePicker.date)
                
                let startHour = formatterHourStart.string(from: startDatePicker.date)
                let endHour = formatterHourEnd.string(from: endDatePicker.date)
                
                db.collection("Shifts").addDocument(data:["Start Shift" : startDate1,"End Shift":endDate1,"Start Date" : startDate2,"End Date":endDate2,"Start Hour" : startHour,"End Hour":endHour, "Name":NameText.text!, "uid": Auth.auth().currentUser!.uid])
            }
        }
        
    }
    
    func showAlert(_ title:String, _ message:String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(alertAction)
        
        present(alert, animated: true, completion: nil)
        
    }
}

