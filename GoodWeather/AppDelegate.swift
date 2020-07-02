//
//  AppDelegate.swift
//  GoodWeather
//
//  Created by Han Luong on 10/5/19.
//  Copyright © 2019 Han Luong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Setup UINavigation Bar
        if #available(iOS 13, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            appearance.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
            appearance.largeTitleTextAttributes = [.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
            
            UINavigationBar.appearance().tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            UINavigationBar.appearance().prefersLargeTitles = true
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            let appearance = UINavigationBar.appearance()
            appearance.barTintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            appearance.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            appearance.prefersLargeTitles = true
            appearance.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
            appearance.largeTitleTextAttributes = [.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        }
        
        setupDefaultSettings()
        
        return true
    }
    
    private func setupDefaultSettings() {
        let userDefault = UserDefaults.standard
        if userDefault.value(forKey: "unit") == nil {
            userDefault.set(Unit.fahrenheit.rawValue, forKey: "unit")
        }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

