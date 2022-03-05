

import UIKit
import ImageSlideshow

class HomeController: UIViewController {
    
    let localSource = [BundleImageSource(imageString: "offer-4"), BundleImageSource(imageString: "offer-3"), BundleImageSource(imageString: "offer-2"), BundleImageSource(imageString: "offer-1")]
    let filterButton = UIButton(type: .custom)
    let defaults = UserDefaults.standard
    let transparentView = UIView()
    let OffersImageView = UIImageView()
    let Offersbutton = UIButton()
    
    var OffersSlids = ImageSlideshow()
    var allResturant = [ResturantElement]()
    var ResturantHasOffer = [ResturantElement]()
    var ResturantDataSource = [ResturantElement]()

    @IBOutlet weak var resturantTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resturantTableView.delegate = self
        resturantTableView.dataSource = self
        resturantTableView.backgroundColor = .white
        

        //Default Offer Image
        setUpDefaultOfferImage()
        // Offers button
        setupOffersbutton()
        // Jahez Icon
        setupJahezIcon()
        //Navigation Button
        setUpNavigationButton(filter: "filter-off")
        //Load Data from API
        LoadResturant()
        
        ResturantDataSource = allResturant
    }
    
    func LoadResturant(){
        API.loadData { ResturantElement, Error in
            guard Error == nil else {
                print("\(String(describing: Error))")
                return
            }
            if let resturantElement =  ResturantElement?.resturantElement {
                self.allResturant = resturantElement
                self.resturantTableView.reloadData()
            
            }
         
            print("\(String(describing: ResturantElement?.resturantElement.count))")
        }
    }
    
    func setUpNavigationButton(filter:String){
        
        navigationController?.navigationBar.tintColor = .white

        filterButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        filterButton.setImage(UIImage(named: filter)?.withRenderingMode(.alwaysTemplate), for: .normal)
        
        filterButton.addTarget(self, action:  #selector(toggle(_:)), for: .touchUpInside)
        filterButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        filterButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        let filterIcon = UIBarButtonItem(customView: filterButton)
 
        self.navigationItem.rightBarButtonItem = filterIcon


    }
    
    @objc func toggle(_ sender: AnyObject) {
        
        if (defaults.string(forKey: "type")?.elementsEqual("on"))!{
            let filteredResturant = allResturant.filter { $0.hasOffer == true }
            ResturantDataSource = filteredResturant
            self.resturantTableView.reloadData()
            
            setUpNavigationButton(filter: "filter-on")
            defaults.set("off", forKey: "type")
        }else{
            ResturantDataSource = allResturant
            self.resturantTableView.reloadData()
            filterButton.setImage(UIImage(named: "filter-on")?.withRenderingMode(.alwaysTemplate), for: .normal)
            setUpNavigationButton(filter: "filter-off")
            defaults.set("on", forKey: "type")
        }

        
    }
    
    func setUpDefaultOfferImage(){
        OffersImageView.backgroundColor = .white
        OffersImageView.image = UIImage(named: "Jahez")
    }
    
    func setUpOfferImage(frames: CGRect){
        self.OffersSlids.setImageInputs(self.localSource)
        self.OffersSlids.contentScaleMode = .scaleAspectFill
        self.OffersSlids.slideshowInterval = 2
       
        self.OffersSlids.frame = CGRect(x: 0, y: 0, width: frames.width, height: 200)
        self.OffersSlids.backgroundColor = .white
    }
    
    func setupJahezIcon(){
        let AppIconButton = UIImageView()
        AppIconButton.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        AppIconButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        AppIconButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        AppIconButton.contentMode = .scaleAspectFit
        AppIconButton.clipsToBounds = true
        let AppIcon = UIImage(named: "jahez-icon")

        AppIconButton.image = AppIcon
        
 
        self.navigationItem.titleView = AppIconButton
    }
    
    func setupOffersbutton(){
        Offersbutton.frame = CGRect(x: 0, y: topbarHeight, width: view.frame.width, height: 30)
        Offersbutton.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        Offersbutton.setTitle("Offers", for: .normal)
        Offersbutton.backgroundColor = UIColor(red: 233.0/255, green: 58.0/255, blue: 48.0/255, alpha: 0.9)
        view.addSubview(Offersbutton)
        Offersbutton.addTarget(self, action: #selector(Offers), for: .touchUpInside)
    }
    
    @objc func Offers(_ sender: Any) {
        addTransparentView(frames: Offersbutton.frame)
    }
    
    func LoadData(){
     
    }
    
    func addTransparentView(frames: CGRect) {
        
       
        
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.view.frame
        self.view.addSubview(transparentView)
        
        OffersImageView.frame = CGRect(x: frames.origin.x, y: frames.origin.y, width: frames.width, height: 0)
        self.view.addSubview(OffersImageView)
        OffersImageView.layer.cornerRadius = 5
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
        transparentView.addGestureRecognizer(tapgesture)
        transparentView.alpha = 0
        UIView.animate(withDuration: 0.8, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.5
           
            self.OffersImageView.frame = CGRect(x: frames.origin.x, y: frames.origin.y , width: frames.width, height: 200)
            self.Offersbutton.frame = CGRect(x: frames.origin.x, y: self.OffersImageView.frame.origin.y + 200, width: frames.width, height: frames.height)
            
            self.setUpOfferImage(frames: frames)
            self.OffersImageView.addSubview(self.OffersSlids)
          


        }, completion: nil)
    }
    
    @objc func removeTransparentView() {
        let frames = Offersbutton.frame
        UIView.animate(withDuration: 0.8, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
            
            self.OffersImageView.frame = CGRect(x: frames.origin.x, y: frames.origin.y - 200, width: frames.width, height: 0.2)
            self.Offersbutton.frame = CGRect(x: frames.origin.x, y: self.OffersImageView.frame.origin.y , width: frames.width, height: frames.height)
            self.OffersSlids.frame = CGRect(x: 0, y: 0, width: frames.width, height: 0.2)

        }, completion: {_ in
            self.OffersImageView.frame = CGRect(x: frames.origin.x, y: frames.origin.y - 200, width: frames.width, height: 0)
            self.OffersSlids.frame = CGRect(x: 0, y: 0, width: frames.width, height: 0)
        })
    }
 

}


extension UIViewController {

    var topbarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
}


extension HomeController: UITableViewDelegate, UITableViewDataSource {
  
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ResturantDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let ResturantList:ResturantTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ResturantCell", for: indexPath) as! ResturantTableViewCell
       
        ResturantList.resturantData = ResturantDataSource[indexPath.row]

        return ResturantList
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt  indexPath: IndexPath) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DetailsVC = storyboard.instantiateViewController(withIdentifier: "Details") as! DetailsController
        DetailsVC.modalPresentationStyle = .fullScreen
    
        DetailsVC.details = Details(details: ResturantDataSource[indexPath.row])  
        
        self.navigationController?.pushViewController(DetailsVC, animated: true)
    }
}

