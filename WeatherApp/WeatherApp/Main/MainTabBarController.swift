import UIKit
import CoreLocation
import UserNotifications


class MainTabBarController: UITabBarController{
    
    let center = UNUserNotificationCenter.current()
    private let listViewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {
        
        tabBarController?.tabBar.unselectedItemTintColor = .lightText
        
        let todayWeatherController = UINavigationController (rootViewController: WheatherViewController())
        todayWeatherController.tabBarItem.image = UIImage(named: "icon_today.png")
        todayWeatherController.tabBarItem.title = "Today"
        
        let forecastWeatherListController = UINavigationController (rootViewController:ListViewController())
        forecastWeatherListController.tabBarItem.title = "Forecast"
        forecastWeatherListController.tabBarItem.image = UIImage(named: "icon_forecast.png")
        
        viewControllers = [todayWeatherController, forecastWeatherListController]
        
    }
}


