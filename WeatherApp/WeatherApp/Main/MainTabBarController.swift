import UIKit
//import MapKit
import CoreLocation
import UserNotifications


class MainTabBarController: UITabBarController{

     let center = UNUserNotificationCenter.current()
     private let listViewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(listViewModel.listModel.items[1].descriptionField + " !!!!! ")
        //lm.requestAlwaysAuthorization()
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


