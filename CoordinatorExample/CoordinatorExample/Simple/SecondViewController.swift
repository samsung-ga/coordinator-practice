//
//  SecondViewController.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/09.
//

import UIKit

class SecondViewController: UIViewController {
  weak var coordinator: SecondCoordinator?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemMint
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    coordinator?.finish()
  }
  
  deinit {
    print("SecondViewController deinit")
  }
}
