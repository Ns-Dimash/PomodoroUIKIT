//
//  MainTabViewController.swift
//  PomodoroUiKit
//
//  Created by Dimash Nsanbaev on 5/4/23.
//

import UIKit

class MainTabViewController: UITabBarController
{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "list.bullet")
        vc3.tabBarItem.image = UIImage(systemName: "doc")
        tabBar.tintColor = .white
        
        vc1.title = "Main"
        vc2.title = "Settings"
        vc3.title = "History"
        
        
        setViewControllers([vc1,vc2,vc3], animated: true)
        
    }

}
