//
//  TabThirdCoordinator.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/10.
//

import UIKit

protocol TabThirdCoordinatorProtocol: Coordinator {
  func showTabThirdViewController()
}

class TabThirdCoordinator: TabThirdCoordinatorProtocol {
 
  var finishDelegate: CoordinatorFinishDelegate?
  
  var navigationController: UINavigationController
  
  var childCoordinators = [Coordinator]()
  
  var type: CoordinatorType { .tab }
  
  required init(_ navigationController: UINavigationController) {
    self.navigationController = .init()
  }
  
  func start() {
    
  }
  
  deinit {
    print("TabThirdCoordinator deinit")
  }
  
  func showTabThirdViewController() {
    
  }

}
