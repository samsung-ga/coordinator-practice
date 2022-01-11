//
//  TabFirstDetailCoordinator.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/10.
//

import Foundation
import UIKit

protocol TabFirstDetailCoordinatorProtocol: Coordinator {
  // TODO: 화면 이동
  func showTabFirstDetailViewController()
}
class TabFirstDetailCoordinator: TabFirstDetailCoordinatorProtocol {
 
  var finishDelegate: CoordinatorFinishDelegate?
  
  var navigationController: UINavigationController
  
  var childCoordinators = [Coordinator]()
  
  var type: CoordinatorType { .tab }
  
  required init(_ navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    showTabFirstDetailViewController()
  }
  
  deinit {
    print("TabFirstDetailCoordinator deinit")
  }
  
  func showTabFirstDetailViewController() {
    let tabFirstDetailViewController = TabFirstDetailViewController()
    tabFirstDetailViewController.didSendEventClosure = { [weak self] in
      self?.finish()
    }
    navigationController.pushViewController(tabFirstDetailViewController, animated: true)
  }
}
