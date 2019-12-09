
import UIKit
import SnapKit
import CoreLocation
class WheatherViewController: UIViewController {
    
    let localManager = CLLocationManager()
    let listViewModel = ListViewModel()
    var text = ""
    
    let imageView: UIImageView = {
        let image: UIImage = UIImage(named: "clouds.png")!
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var cityLabel: UILabel = {
        let name = UILabel()
        name.text = "City and Country"
        name.textAlignment = NSTextAlignment.center
        name.font = UIFont(name: name.font.fontName, size: 22)
        return name
    }()
    
    let temperatureLabel: UILabel = {
        let name = UILabel()
        name.text = "Temperature "
        name.textColor = .systemBlue
        name.textAlignment = NSTextAlignment.center
        name.font = UIFont(name: name.font.fontName, size: 26)
        return name
    }()
    
    let stateLabel: UILabel = {
        let name = UILabel()
        name.text = "| State"
        name.textColor = .systemBlue
        name.textAlignment = NSTextAlignment.center
        name.font = UIFont(name: name.font.fontName, size: 26)
        return name
    }()
    
    let humidityView: UIImageView = {
        let image: UIImage = resizeImage(image: UIImage(named: "humidity.png")!,targetSize: CGSize(width: 50.0, height: 50.0))
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let humidityLabel: UILabel = {
        let name = UILabel()
        name.text = "humidity"
        name.textAlignment = NSTextAlignment.center
        name.font = UIFont(name: name.font.fontName, size: 22)
        return name
    }()
    
    let pressureView: UIImageView = {
        let image: UIImage = resizeImage(image: UIImage(named: "pressure.png")!,targetSize: CGSize(width: 50.0, height: 50.0))
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let pressureLabel: UILabel = {
        let name = UILabel()
        name.text = "pressure"
        name.textAlignment = NSTextAlignment.center
        name.font = UIFont(name: name.font.fontName, size: 22)
        return name
    }()
    
    let speedView: UIImageView = {
        let image: UIImage = resizeImage(image: UIImage(named: "wind.png")!,targetSize: CGSize(width: 50.0, height: 50.0))
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let speedLabel: UILabel = {
        let name = UILabel()
        name.text = "speed"
        name.textAlignment = NSTextAlignment.center
        name.font = UIFont(name: name.font.fontName, size: 22)
        return name
    }()
    
    let directionView: UIImageView = {
        let image: UIImage = resizeImage(image: UIImage(named: "compass.png")!,targetSize: CGSize(width: 50.0, height: 50.0))
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let directionLabel: UILabel = {
        let name = UILabel()
        name.text = "direction"
        name.textAlignment = NSTextAlignment.center
        name.font = UIFont(name: name.font.fontName, size: 22)
        return name
    }()
    
    let shareButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 350, height: 100))
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle(" Share ", for: .normal)
        button.titleLabel?.font = UIFont(name:"", size: 28)
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        
        
        button.layer.borderWidth = 2.0
        button.layer.borderColor = (UIColor.systemBlue).cgColor
        button.clipsToBounds = true
        
        return button
    }()
    
    @objc func buttonAction(sender:UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        UIGraphicsEndImageContext()
        
        let objectsToShare = [text] as [Any]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        
        activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop,UIActivity.ActivityType.addToReadingList]
        
        activityVC.popoverPresentationController?.sourceView = sender
        self.present(activityVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupLocationManager()
        setupView()
    }
    
    func setupNavBar(){
        navigationItem.title = "Today"
    }
    func setupLocationManager(){
        localManager.requestWhenInUseAuthorization()
        localManager.delegate = self
        localManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        localManager.startUpdatingLocation()
    }
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(cityLabel)
        
        view.addSubview(stateLabel)
        view.addSubview(temperatureLabel)
        
        view.addSubview(humidityView)
        view.addSubview(pressureView)
        view.addSubview(humidityLabel)
        view.addSubview(pressureLabel)
        
        view.addSubview(speedView)
        view.addSubview(directionView)
        view.addSubview(speedLabel)
        view.addSubview(directionLabel)
        view.addSubview(shareButton)
        
        imageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.top.equalToSuperview().offset(120)
            make.centerX.equalToSuperview()
        }
        cityLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        stateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cityLabel.snp.bottom).offset(15)
            make.left.equalTo(self.view.snp.centerX)
        }
        temperatureLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cityLabel.snp.bottom).offset(15)
            make.right.equalTo(self.view.snp.centerX)
        }
        humidityView.snp.makeConstraints { (make) in
            make.top.equalTo(temperatureLabel.snp.bottom).offset(35)
            make.right.equalTo(self.view.snp.centerX)
            make.left.equalToSuperview()
        }
        pressureView.snp.makeConstraints { (make) in
            make.top.equalTo(temperatureLabel.snp.bottom).offset(35)
            make.right.equalToSuperview()
            make.left.equalTo(self.view.snp.centerX)
        }
        humidityLabel.snp.makeConstraints { (make) in
            make.top.equalTo(humidityView.snp.bottom).offset(5)
            make.centerX.equalTo(humidityView.snp.centerX)
        }
        pressureLabel.snp.makeConstraints { (make) in
            make.top.equalTo(pressureView.snp.bottom).offset(5)
            make.centerX.equalTo(pressureView.snp.centerX)
        }
        
        speedView.snp.makeConstraints { (make) in
            make.top.equalTo(humidityLabel.snp.bottom).offset(35)
            make.right.equalTo(self.view.snp.centerX)
            make.left.equalToSuperview()
        }
        directionView.snp.makeConstraints { (make) in
            make.top.equalTo(pressureLabel.snp.bottom).offset(35)
            make.right.equalToSuperview()
            make.left.equalTo(self.view.snp.centerX)
        }
        speedLabel.snp.makeConstraints { (make) in
            make.top.equalTo(speedView.snp.bottom).offset(5)
            make.centerX.equalTo(speedView.snp.centerX)
        }
        directionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(directionView.snp.bottom).offset(5)
            make.centerX.equalTo(directionView.snp.centerX)
        }
        shareButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(100)
            make.centerX.equalToSuperview()
        }
    }
    func dataLoaded(){
        cityLabel.text = (listViewModel.city.name + "," + listViewModel.city.country)
        stateLabel.text = "| " + listViewModel.items[0].state
        temperatureLabel.text = String(Int(listViewModel.items[0].temp )) + "°F "
        humidityLabel.text = String(Int(listViewModel.items[0].humidity)) + "%"
        pressureLabel.text = String(Int(listViewModel.items[0].pressure )) + "hPa"
        speedLabel.text = String(Int(listViewModel.items[0].speed)) + "km/h"
        directionLabel.text = String(Int(listViewModel.items[0].deg)) + " °"
        let weatherType:UIImage = Model.Description (rawValue:
            listViewModel.items[0].state)?.getWeatherImage() ?? UIImage(named:"few_clouds.png")!
        imageView.image = weatherType
        text = """
        The temperature and state in \( cityLabel.text!) now \(temperatureLabel.text!) \( stateLabel.text!). Humidity: \(humidityLabel.text!) Pressure: \( pressureLabel.text!) Wind Speed: \(speedLabel.text!) Direction \(directionLabel.text!)
        """
    }
}

extension WheatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        let lat = Double(locValue.latitude)
        let lng = Double(locValue.longitude)
        listViewModel.loadData(lat: lat, lng: lng) {
            self.dataLoaded()
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
func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
    let size = image.size
    
    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height
    
    // Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if(widthRatio > heightRatio) {
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    } else {
        newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
    }
    
    // This is the rect that we've calculated out and this is what is actually used below
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
    
    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    image.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
}


