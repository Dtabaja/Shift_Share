////
////  HomeViewController.swift
////  Shift_Share
////
////  Created by user167528 on 7/20/20.
////  Copyright © 2020 user167528. All rights reserved.
////
//
//import UIKit
//
//class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    
//   var shiftCell: ShiftUtil?
//   var shiftList:[ShiftUtil] = [ShiftUtil]()
//   
//    @IBOutlet weak var tableView: UITableView!
//    let dataID = "key"
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.reloadData()
//        // Do any additional setup after loading the view.
//    }
//    
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//     
//        
//       
//        //MARK: Delegate & DataSource Functions
//        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return shiftList.count
//        }
//        
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            
//            let cell = self.tableView.dequeueReusableCell(withIdentifier: "ShiftList") as?ShiftTableViewCell
//            
//            cell?.shiftType.text = String(shiftList[indexPath.row].shift)
//            cell?.Date.text = String(shiftList[indexPath.row].date)
//            
//            return cell!
//        }
//        
//        func ShowHighScoreTable(){
//            self.shiftList = readFromUserDF()
//            if(shiftCell != nil){
//                appendToHighScoreLi(highScoreCell:highScoreCell!)
//            }
//            
//            
//        }
//        //MARK: UserDefaults Functions
//        func readFromUserDF()-> [HighScoreCellUtil]{
//            if let data = UserDefaults.standard.data(forKey: dataID){
//                do{
//                    let JSONdecoder = JSONDecoder()
//                    self.highScoreList =
//                        try
//                            JSONdecoder.decode([HighScoreCellUtil].self, from: data)
//                    return self.highScoreList
//                }catch{
//                    print("can't read from UserDefaults")
//                }
//                
//            }
//            return [HighScoreCellUtil]()
//        }
//        
//        func writeToUserDF(highScoreListarray:[HighScoreCellUtil]){
//            do{
//                let JSONencoder = JSONEncoder()
//                let data =
//                    try
//                        JSONencoder.encode(highScoreListarray)
//                UserDefaults.standard.set(data, forKey: dataID)
//                self.highScoreList = readFromUserDF()
//            }catch{
//                print("can't write to UserDefaults")
//            }
//            
//            
//        }
//        //MARK: appand and update score list
//        func appendToHighScoreList(highScoreCell:HighScoreCellUtil){
//            if(highScoreList.count<10){
//                self.highScoreList.append(highScoreCell)
//                sortHighScoreList()
//                writeToUserDF(highScoreListarray: self.highScoreList)
//            }
//        }
//       
//        
//        
//       
//          }
//
//    //MARK: Inner Class
//    class ShiftTableViewCell
//    : UITableViewCell{
//        
//        @IBOutlet weak var shiftType: UILabel!
//        @IBOutlet weak var Date: UILabel!
//}
