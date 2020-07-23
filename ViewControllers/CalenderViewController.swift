//
//  CalenderViewController.swift
//  Shift-Share
//
//  Created by user167528 on 7/22/20.
//  Copyright © 2020 user167528. All rights reserved.
//

import UIKit
import FSCalendar

class CalenderViewController: UIViewController, FSCalendarDelegate {
    @IBOutlet weak var calender: FSCalendar!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        calender.delegate = self

        // Do any additional setup after loading the view.
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-yyyy"
        let string = formatter.string(from: date)
        print("\(string)")
        
        
    }

   

}
