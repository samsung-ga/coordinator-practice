//
//  Coordinator2.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/11.
//

import UIKit

protocol Coordinator: AnyObject {
  var finishDelegate: CoordinatorFinishDelegate? { get set }
  var navigationController: UINavigationController { get set }
  var childCoordinators: [Coordinator] { get set }
  var type: CoordinatorType { get }
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

// MARK: - CoordinatorOutput
/// Delegate protocol helping parent Coordinator know when its child is ready to be finished.
protocol CoordinatorFinishDelegate: AnyObject {
  func coordinatorDidFinish(childCoordinator: Coordinator)
}

// MARK: - CoordinatorType
/// Using this structure we can define what type of flow we can use in-app.
enum CoordinatorType {
  case app, login, tab
}
