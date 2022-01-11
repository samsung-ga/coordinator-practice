//
//  TabCoordinator.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/10.
//

import Foundation

protocol CoordinatorTwo: AnyObject {
  var childCoordinators: [CoordinatorTwo] { get set }
  
  func start()
}
