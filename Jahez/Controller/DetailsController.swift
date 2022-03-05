
import UIKit
import Kingfisher


class DetailsController: UIViewController {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    var details: Details?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setup The View
        setUpTheView()

    }
    
    func setUpTheView(){
        
        navigationController?.navigationBar.tintColor = .white
        
        name.text = details?.name
        hours.text = details?.hours
        rating.text =  "\(details?.rating ?? 0)"
        Description.text = details?.Description
        icon.kf.setImage(with:URL(string: details!.URL))
        
        name.Setup()
        hours.Setup()
        rating.Setup()
        Description.Setup()

    }

}

extension UILabel {
 
    func Setup(){
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 14;
    }
    
}


