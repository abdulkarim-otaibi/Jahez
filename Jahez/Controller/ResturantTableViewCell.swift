
import UIKit
import Kingfisher

class ResturantTableViewCell: UITableViewCell {

    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Distance: UILabel!
    @IBOutlet weak var Time: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    var resturantData :ResturantElement? {
        
        didSet {
            
            if let name = resturantData?.name, let distance = resturantData?.distance, let time = resturantData?.hours{
                Name.text = name
                //separate the distance and make it small, example 2.1212121 -> 2.1
                let smallDistance = "\(distance)".components(separatedBy: ".")
                Distance.text = "\(smallDistance[0]).\(smallDistance[1].first!)"
                Time.text = time
                if let url = URL(string: resturantData!.image){
                   icon.kf.setImage(with:url)
                }
            }
           
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        icon.image = UIImage(named: "Jahez")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
