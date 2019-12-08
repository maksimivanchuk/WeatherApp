import UIKit
//import MapKit
import CoreLocation
import UserNotifications


class MainTabBarController: UITabBarController{

     let lm = CLLocationManager()
     let center = UNUserNotificationCenter.current()
     private let listViewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       listViewModel.loadData()
             
            
        print(listViewModel.listModel.items[0].descriptionField + " !!!!! ")
        //lm.requestAlwaysAuthorization()
        lm.requestWhenInUseAuthorization()
       
        lm.delegate = self
        lm.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        lm.startUpdatingLocation()
       
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
        }
        setupTabBar()
    }
    
    func setupTabBar() {
        
        tabBarController?.tabBar.unselectedItemTintColor = .lightText
        
        let todayWeatherController = WheatherViewController()
        todayWeatherController.tabBarItem.image = UIImage(named: "icon_today.png")
        todayWeatherController.tabBarItem.title = "Today"
        
        let forecastWeatherListController = ListViewController()
        forecastWeatherListController.tabBarItem.title = "Forecast"
        forecastWeatherListController.tabBarItem.image = UIImage(named: "icon_forecast.png")
        
        viewControllers = [todayWeatherController, forecastWeatherListController]
    
    }
}

extension MainTabBarController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
       if status == .authorizedAlways || status == .authorizedWhenInUse {
         lm.startUpdatingLocation()
       } else {
         lm.stopUpdatingLocation()
       }
     }
}
