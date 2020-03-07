//
//  AppDelegate.swift
//  AgriOne App
//
//  Created by Yasith Thathsara Senarathne on 3/2/20.
//  Copyright © 2020 Yasith Thathsara Senarathne. All rights reserved.
//

import UIKit
import Firebase
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,FireAuthAccessible {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.window = UIWindow()
        
        FirebaseApp.configure()
        GMSServices.provideAPIKey(GenaricKeys.googleApiKey)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if currentUser != nil {
            let navVC = UINavigationController.init(rootViewController: HomeViewController())
            window?.rootViewController = navVC
        }else {
            window?.rootViewController = LoginViewController()
        }
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        currentUser?.reload()
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
}

