

import Foundation
import UIKit

struct Details{
    let URL:String
    let name : String
    let hours:String
    let rating:Int
    let Description:String
    
    init(details:ResturantElement){
        self.URL = details.image
        self.name = details.name
        self.hours = details.hours
        self.rating = details.rating
        self.Description = details.resturantElementDescription
    }
    
 
}
