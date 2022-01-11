//
//  TabSecondCoordinator.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/10.
//

import UIKit

protocol TabSecondCoordinatorProtocol: Coordinator {

}
class TabSecondCoordinator: TabSecondCoordinatorProtocol {
 
  var finishDelegate: CoordinatorFinishDelegate?
  
  var navigationController: UINavigationController
  
  var childCoordinators = [Coordinator]()
  
  var type: CoordinatorType { .tab }
  
  required init(_ navigationController: UINavigationController) {
    self.navigationController = .init()
  }
  
  func start() { }
  
  deinit {
    print("TabSecondCoordinator deinit")
  }
  

}
