//
//  LoginCoordinator.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/11.
//

import UIKit

protocol LoginCoordinatorProtocol: Coordinator {
  func showLoginViewController()
}

class LoginCoordinator: LoginCoordinatorProtocol {
  weak var finishDelegate: CoordinatorFinishDelegate?
  
  var navigationController: UINavigationController
  
  var childCoordinators = [Coordinator]()
  
  required init(_ navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  deinit {
    print("LoginCoordinator deinit")
  }
  
  
  func start() {
    showLoginViewController()
  }
  
  func showLoginViewController() {
    let loginViewController = LoginViewController()
    loginViewController.coordinator = self
    navigationController.pushViewController(loginViewController, animated: true)
  }
  
}
