//
//  AppDelegate.swift
//  AgriOne App
//
//  Created by Yasith Thathsara Senarathne on 3/2/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.window = UIWindow()
        
        window = UIWindow()
        window?.rootViewController = LoginViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

