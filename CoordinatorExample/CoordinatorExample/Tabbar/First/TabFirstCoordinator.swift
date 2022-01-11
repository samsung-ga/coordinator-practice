//
//  TabFirstCoordinator.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/10.
//

import UIKit

protocol TabFirstCoordinatorProtocol: Coordinator {
  func showTabFirstDetailViewController()
  func startWithViewController() -> (UINavigationController, TabFirstViewController)
}

class TabFirstCoordinator: TabFirstCoordinatorProtocol {
  
  var finishDelegate: CoordinatorFinishDelegate?
  
  var navigationController: UINavigationController
  
  var childCoordinators = [Coordinator]()
  
  var type: CoordinatorType { .tab }
  
  required init(_ navigationController: UINavigationController) {
    self.navigationController = .init()
  }
  
  func start() { }
  
  func startWithViewController() -> (UINavigationController, TabFirstViewController){
    let firstViewController = TabFirstViewController()
    
    navigationController.tabBarItem = UITabBarItem.init(title: TabBarPage.home.pageTitleValue(),
                                                        image: nil,
                                                        tag: TabBarPage.home.pageOrderNumber())
    
    firstViewController.didSendEventClosure = { [weak self] event in
      switch event {
      case .detail:
        self?.showTabFirstDetailViewController()
      }
    }
    
    navigationController.pushViewController(firstViewController, animated: false)
    return (navigationController, firstViewController)
  }
  
  deinit {
    print("TabFirstCoordinator deinit")
  }
  
  func showTabFirstDetailViewController() {
    let tabFirstDetailCoordinator = TabFirstDetailCoordinator(navigationController)
    tabFirstDetailCoordinator.finishDelegate = self
    childCoordinators.append(tabFirstDetailCoordinator)
    tabFirstDetailCoordinator.start()
  }
  
}

extension TabFirstCoordinator: CoordinatorFinishDelegate {
  func coordinatorDidFinish(childCoordinator: Coordinator) {
    childCoordinators = childCoordinators.filter({ $0 !== childCoordinator })
  }
}
