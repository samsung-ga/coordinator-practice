//
//  SecondCoordinator.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/09.
//

import Foundation
import UIKit

class SecondCoordinator: CoordinatorOne {
  var childCoordinators: [CoordinatorOne] = []
  var navigationController: UINavigationController
  weak var parentCoordinator: MainCoordinator?
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let secondVC = SecondViewController()
    secondVC.coordinator = self
    navigationController.pushViewController(secondVC, animated: true)
  }
  
}
