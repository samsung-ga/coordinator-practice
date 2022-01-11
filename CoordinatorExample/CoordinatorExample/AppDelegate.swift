//
//  AppDelegate.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/09.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var mainCoordinator: MainCoordinator? // 1.
  var appCoordinator: AppCoordinator? // 2
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // 1. simple
    /*
    let navigationController = UINavigationController()
    mainCoordinator = MainCoordinator(navigationController: navigationController)
    mainCoordinator?.start()
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
    */
    
    // 2. Tabbar
    window =  UIWindow(frame: UIScreen.main.bounds)
    
    let navigationController: UINavigationController = .init()
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
    
    appCoordinator = AppCoordinator.init(navigationController)
    appCoordinator?.start()
    
    return true
  }
  
}

