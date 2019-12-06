import UIKit
import CoreLocation

class MainTabBarController: UITabBarController{

    private let lm = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        lm.delegate = self
        //request // start
    }
    
    func setupTabBar() {
        tabBarController?.tabBar.barTintColor = .red
        tabBarController?.tabBar.tintColor = .red
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
        guard let location = locations.last else { return }
        //location.coordinate.latitude
       // UserDefaults.standard.set(Double(location.coordinate.latitude), forKey: "latitude")
    }
}
