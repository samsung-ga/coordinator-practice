//
//  MainCoordinator.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/09.
//

import Foundation
import UIKit

class MainCoordinator: CoordinatorOne {
  var childCoordinators: [CoordinatorOne] = []
  
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  deinit {
    print("MainCoordinator deinit")
  }
  func start() {
    let mainViewController = MainViewController()
    mainViewController.coordinator = self
    navigationController.pushViewController(mainViewController, animated: false)
  }
  
  func pushSecondVC() {
    let secondCoordinator = SecondCoordinator(navigationController: navigationController)
    secondCoordinator.parentCoordinator = self
    childCoordinators.append(secondCoordinator)
    secondCoordinator.start()
  }
  
  func popSecondVC(_ coordinator: CoordinatorOne) {
    childCoordinators = childCoordinators.filter { $0 !== coordinator}
  }
}

