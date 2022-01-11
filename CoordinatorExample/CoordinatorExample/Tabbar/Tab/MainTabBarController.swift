//
//  MainTabBarController.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/11.
//

import UIKit

class MainTabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.tabBar.backgroundColor = .white
    self.tabBar.isTranslucent = false
  }
  
  deinit {
    print("MainTabBarController deinit")
  }
  
}
