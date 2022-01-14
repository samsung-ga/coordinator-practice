//
//  TabFirstDetailCoordinator.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/10.
//

import Foundation
import UIKit

protocol DetailCoordinatorProtocol: Coordinator {
  // TODO: 화면 이동
  func showDetailViewController()
}

class DetailCoordinator: DetailCoordinatorProtocol {
 
  var finishDelegate: CoordinatorFinishDelegate?
  
  var navigationController: UINavigationController
  
  var childCoordinators = [Coordinator]()
  
  required init(_ navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    showDetailViewController()
  }
  
  deinit {
    print("DetailCoordinator deinit")
  }
  
  func showDetailViewController() {
    let tabFirstDetailViewController = DetailViewController()
    tabFirstDetailViewController.didSendEventClosure = { [weak self] in
      self?.finish()
    }
    navigationController.pushViewController(tabFirstDetailViewController, animated: true)
  }
}
