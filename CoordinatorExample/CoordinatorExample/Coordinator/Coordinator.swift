//
//  Coordinator2.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/11.
//
// 출처 : - https://somevitalyz123.medium.com/coordinator-pattern-with-tab-bar-controller-33e08d39d7d

import UIKit

protocol Coordinator: AnyObject {
  var finishDelegate: CoordinatorFinishDelegate? { get set }
  var navigationController: UINavigationController { get set }
  var childCoordinators: [Coordinator] { get set }
  func start()
  func finish()
  
  init(_ navigationController: UINavigationController)
}

extension Coordinator {
  func finish() {
    print("Remove all child")
    childCoordinators.removeAll()
    print(childCoordinators)
    finishDelegate?.coordinatorDidFinish(childCoordinator: self)
  }
}

protocol CoordinatorFinishDelegate: AnyObject {
  func coordinatorDidFinish(childCoordinator: Coordinator)
}
