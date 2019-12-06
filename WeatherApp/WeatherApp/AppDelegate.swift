//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Максим  on 12/5/19.
//  Copyright © 2019 Максим . All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let mainVC = MainTabBarController()
        window?.rootViewController = mainVC
        return true
    }
}

