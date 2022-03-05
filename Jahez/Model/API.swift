

import Foundation

class API {
    
    static func loadData(completion: @escaping (Resturant?,String?)->Void){
        
        if let path = Bundle.main.path(forResource: "resturant", ofType: "json") {
            do {
                var resturant :Resturant?

                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                
               
                resturant = try JSONDecoder().decode(Resturant.self, from: data)
               
                completion(resturant,nil)
            } catch let error {
                print("parse error: \(error.localizedDescription)")
                completion(nil,error.localizedDescription)
            }
        } else {
            print("Invalid filename/path.")
            completion(nil,"Invalid filename/path.")
        }
        
    }
}
