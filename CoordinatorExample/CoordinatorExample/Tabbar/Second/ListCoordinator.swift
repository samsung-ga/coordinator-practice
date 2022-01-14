//
//  TabSecondCoordinator.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/10.
//

import UIKit

protocol ListCoordinatorProtocol: Coordinator {

}
class ListCoordinator: ListCoordinatorProtocol {
 
  var finishDelegate: CoordinatorFinishDelegate?
  
  var navigationController: UINavigationController
  
  var childCoordinators = [Coordinator]()
  
  required init(_ navigationController: UINavigationController) {
    self.navigationController = .init()
  }
  
  func start() { }
  
  deinit {
    print("ListCoordinator deinit")
  }
  

}
