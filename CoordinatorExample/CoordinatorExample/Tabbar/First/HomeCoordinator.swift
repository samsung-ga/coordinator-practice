//
//  TabFirstCoordinator.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/10.
//

import UIKit

protocol HomeCoordinatorProtocol: Coordinator {
  func showDetailViewController()
}

class HomeCoordinator: HomeCoordinatorProtocol {
  var finishDelegate: CoordinatorFinishDelegate?
  var navigationController: UINavigationController
  var childCoordinators = [Coordinator]()
  weak var parentCoordinator: Coordinator?
  
  required init(_ navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  func start() {
    let homeViewController = HomeViewController()
    
    navigationController.tabBarItem = UITabBarItem.init(title: TabBarPage.home.pageTitleValue(),
                                                        image: nil,
                                                        tag: TabBarPage.home.pageOrderNumber())
    
    homeViewController.didSendEventClosure = { [weak self] event in
      switch event {
      case .detail:
        self?.showDetailViewController()
      }
    }
    navigationController.pushViewController(homeViewController, animated: false)
  }
  
  deinit {
    print("HomeCoordinator deinit")
  }
  
  func showDetailViewController() {
    let detailCoordinator = DetailCoordinator(navigationController)
    detailCoordinator.finishDelegate = self
    childCoordinators.append(detailCoordinator)
    detailCoordinator.start()
  }
  
}

extension HomeCoordinator: CoordinatorFinishDelegate {
  func coordinatorDidFinish(childCoordinator: Coordinator) {
    childCoordinators = childCoordinators.filter({ $0 !== childCoordinator })
  }
}
