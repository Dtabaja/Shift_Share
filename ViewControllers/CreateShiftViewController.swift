//
//  CreateShiftViewController.swift
//  Shift-Share
//
//  Created by user167528 on 7/26/20.
//  Copyright © 2020 user167528. All rights reserved.
//

import UIKit

class CreateShiftViewController: UIViewController, UITextFieldDelegate {
    
    // @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var startDatePicker: UIDatePicker!
    
    @IBOutlet weak var NameText: UITextField!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    public var completion: ((String, Date, Date) -> Void)?
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
    
    @objc func didTapSaveButton() {
        if let titleText = NameText.text, !titleText.isEmpty
            
        {
            
            let startDate = startDatePicker.date
            let endDate = endDatePicker.date
            completion?(titleText,startDate,endDate)
         _ = navigationController?.popViewController(animated: true)
        }
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
            let homeViewController = segue.destination as? HomeViewController
            if let titleText = NameText.text, !titleText.isEmpty
                      
                  {
            let startDate = startDatePicker.date
            let endDate = endDatePicker.date
            completion?(titleText,startDate,endDate)
            }
            homeViewController?.startDate = startDatePicker.date
            homeViewController?.endDate = endDatePicker.date
            homeViewController!.name = NameText.text!
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

