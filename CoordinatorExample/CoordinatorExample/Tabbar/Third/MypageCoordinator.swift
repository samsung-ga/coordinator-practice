//
//  TabThirdCoordinator.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/10.
//

import UIKit

protocol MypageCoordinatorProtocol: Coordinator {
  func showMypageViewController()
}

class MypageCoordinator: MypageCoordinatorProtocol {
 
  var finishDelegate: CoordinatorFinishDelegate?
  
  var navigationController: UINavigationController
  
  var childCoordinators = [Coordinator]()
  
  required init(_ navigationController: UINavigationController) {
    self.navigationController = .init()
  }
  
  func start() {
    
  }
  
  deinit {
    print("MypageCoordinator deinit")
  }
  
  func showMypageViewController() {
    
  }

}
