//
//  AppDelegate.swift
//  ZeplinPractice
//
//  Created by James H Layton on 6/13/18.
//  Copyright © 2018 james. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let zeplinListVC = ZeplinRouter.createModule()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = zeplinListVC
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}
    func applicationDidEnterBackground(_ application: UIApplication) {}
    func applicationWillEnterForeground(_ application: UIApplication) {}
    func applicationDidBecomeActive(_ application: UIApplication) {}
    func applicationWillTerminate(_ application: UIApplication) {}
}

