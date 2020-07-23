
import Foundation

class ShiftUtil: Codable{
    
    var shift:String = ""
    var startDate: String = ""
    var endDate: String = ""
    var email:String = ""
    
    init(){}
    
    init(shift:String, startDate:String,endDate:String, email:String){
        self.shift = shift
        self.startDate = startDate
        self.endDate = endDate
        self.email = email
        
    }
   
    
}
