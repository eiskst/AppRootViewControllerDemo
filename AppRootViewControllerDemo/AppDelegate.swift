//
//  AppDelegate.swift
//  AppRootViewControllerDemo
//
//  Created by Eisuke Sato on 2018/03/21.
//  Copyright © 2018年 eiskst. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = AppRootViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

extension AppDelegate {
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var rootViewController: AppRootViewController {
        return window!.rootViewController as! AppRootViewController
    }
}


