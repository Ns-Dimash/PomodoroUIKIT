//
//  AppDelegate.swift
//  PomodoroUiKit
//
//  Created by Dimash Nsanbaev on 5/4/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = MainTabViewController()
        return true
        
    }

}

