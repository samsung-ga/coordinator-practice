//
//  TabFirstDetailViewController.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/10.
//

import UIKit

class DetailViewController: UIViewController {
  
  var didSendEventClosure: (() -> Void)?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemCyan
  }
  
  deinit {
    didSendEventClosure?()
    print("DetailViewController deinit")
  }
}
