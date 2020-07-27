//
//  CreateShiftViewController.swift
//  Shift-Share
//
//  Created by user167528 on 7/26/20.
//  Copyright © 2020 user167528. All rights reserved.
//

import UIKit

class CreateShiftViewController: UIViewController {
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var startDatePicker: UIDatePicker!
    
    @IBOutlet weak var endDatePicker: UIDatePicker!
    var startShift:String = ""
    var endShift:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        let formatter = DateFormatter()
        //        formatter.dateFormat = "dd/MM/yyyy EEEE HH:MM"
        //        startShift = formatter.string(from: startDatePicker.date)
        //        endShift = formatter.string(from: endDatePicker.date)
        //               // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func startdateSelectedFromDatePicker(_ : AnyObject){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy EEEE HH:MM"
        startShift = formatter.string(from: startDatePicker.date)
        
    }
    @IBAction func enddateSelectedFromDatePicker(_ : AnyObject){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy EEEE HH:MM"
        endShift = formatter.string(from: endDatePicker.date)
        
    }
    @IBAction func saveTapped(_ sender: Any) {
        
//        if(startShift>endShift){
//            print("error")
//            return
//            //   print(self.startShift)
//            //   print(self.endShift)
//
//
//        }else{
            self.performSegue(withIdentifier: "BackToHome", sender: self)
//        }
    }
    //MARK: Navigation == Intent(Android)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "BackToHome"){
            let saveView = segue.destination as! HomeViewController
            saveView.startShift = self.startShift
            saveView.endShift = self.endShift
            
        } 
    }
}
