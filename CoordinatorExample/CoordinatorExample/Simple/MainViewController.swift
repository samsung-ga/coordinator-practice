//
//  ViewController.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/09.
//

import UIKit

class MainViewController: UIViewController {

  weak var coordinator: MainCoordinator?
  
  private lazy var button: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.titleLabel?.font = .systemFont(ofSize: 22, weight: .semibold)
    button.setTitle("화면 전환", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    return button
  }()
  
  @objc
  func buttonPressed() {
    self.coordinator?.pushSecondVC()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(button)
    
    NSLayoutConstraint.activate([
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
    
  }
  
  deinit {
    print("MainViewController deinit")
  }

}

