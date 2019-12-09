import UIKit
import SnapKit
import CoreLocation

class ListViewController: UIViewController {
    
    let localManager = CLLocationManager()
    let listViewModel = ListViewModel()
    var navigationTitle = ""
    
    enum Description: String {
        case clearSky = "clear sky"
        case fewClouds = "few clouds"
        case rain = "light rain"
        
        func getWeatherImage()-> UIImage{
            switch self {
            case .clearSky:
                return UIImage(named: "clear_sky.png")!
            case .fewClouds:
                return UIImage(named: "few_clouds.png")!
            case .rain:
                return UIImage (named: "light_rain.png")!
            }
        }
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        return tableView
    }()
    
    private var observer: AnyObject?
    
    @objc func refreshData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        setupTableView()
        setupNavBar(navigationTitle: "City")
        setupLocationManager()
        
        
    }
    func setupTableView(){
        view.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: self.listViewModel.cellID)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) -> Void in
            make.edges.equalToSuperview() }
    }
    func setupNavBar(navigationTitle: String){
        navigationItem.title = navigationTitle
    }
    func setupLocationManager(){
        localManager.requestWhenInUseAuthorization()
        localManager.delegate = self
        localManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        localManager.startUpdatingLocation()
    }
    func updateCell(cell: ListTableViewCell, indexPath: IndexPath) -> ListTableViewCell {
        cell.nameLabel.text = dateFormatToString(timeinterval: self.listViewModel.items[indexPath.row].date)
        cell.descriptionLabel.text = self.listViewModel.items[indexPath.row].state
        cell.temperatureLabel.text = String(Int(self.listViewModel.items[indexPath.row].temp)) + "°F "
        let weatherType:UIImage = Model.Description (rawValue: self.listViewModel.items[indexPath.row].state)?.getWeatherImage() ?? UIImage(named:"few_clouds.png")!
        cell.imgView.image = weatherType
        return cell
    }
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.listViewModel.cellID, for: indexPath) as! ListTableViewCell
        return self.updateCell(cell: cell, indexPath: indexPath)
    }
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}

extension ListViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        let lat = Double(locValue.latitude)
        let lng = Double(locValue.longitude)
        listViewModel.loadData(lat: lat, lng: lng) {
            self.setupNavBar(navigationTitle: self.listViewModel.city.name)
            self.tableView.reloadData()
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            localManager.startUpdatingLocation()
        } else {
            localManager.stopUpdatingLocation()
        }
    }
}

func dateFormatToString(timeinterval: Int)->String{
    let date = NSDate(timeIntervalSince1970: TimeInterval(timeinterval))
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMM HH:mm"
    return formatter.string(from: date as Date)
}
