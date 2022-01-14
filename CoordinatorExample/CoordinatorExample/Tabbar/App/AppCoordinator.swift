//
//  AppCoordinator.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/11.
//

import UIKit

protocol AppCoordinatorProtocol: Coordinator {
  func showLoginFlow()
  func showMainFlow()
}

class AppCoordinator: AppCoordinatorProtocol {
  weak var finishDelegate: CoordinatorFinishDelegate? = nil

  var navigationController: UINavigationController
  
  var childCoordinators = [Coordinator]()
  
  required init(_ navigationController: UINavigationController) {
    self.navigationController = navigationController
    navigationController.setNavigationBarHidden(true, animated: true)
  }
  
  deinit {
    print("AppCoordinator deinit")
  }
  
  func start() {
    showLoginFlow()
  }
  
  func showLoginFlow() {
    let loginCoordinator = LoginCoordinator.init(navigationController)
    loginCoordinator.finishDelegate = self
    loginCoordinator.start()
    childCoordinators.append(loginCoordinator)
  }
  
  func showMainFlow() {
    let tabCoordinator = TabCoordinator.init(navigationController)
    tabCoordinator.finishDelegate = self
    tabCoordinator.start()
    childCoordinators.append(tabCoordinator)
  }
}

extension AppCoordinator: CoordinatorFinishDelegate {
  func coordinatorDidFinish(childCoordinator: Coordinator) {
    childCoordinators = childCoordinators.filter({ $0 !== childCoordinator })
    
    if childCoordinator is LoginCoordinator {
      navigationController.viewControllers.removeAll()
      showMainFlow()
    } else {
      navigationController.viewControllers.removeAll()
      showLoginFlow()
    }
     
  }
}
