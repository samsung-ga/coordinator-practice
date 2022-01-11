//
//  Coordinator.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/09.
//

import Foundation
import UIKit

protocol CoordinatorOne: AnyObject {
  var childCoordinators: [CoordinatorOne] { get set }
  var navigationController: UINavigationController { get set }

  func start()
}
