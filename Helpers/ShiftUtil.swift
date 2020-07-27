
import Foundation

class ShiftUtil: Codable{
    
   // var shift:String = ""
    var startDate: String = ""
    var endDate: String = ""
    //var email:String = ""
    
    init(){}
    
    init(startDate:String,endDate:String){
     //   self.shift = shift
        self.startDate = startDate
        self.endDate = endDate
        //self.email = email
        
    }
   
    
}
