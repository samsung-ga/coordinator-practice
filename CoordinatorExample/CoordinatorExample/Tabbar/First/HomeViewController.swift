//
//  TabFirstViewController.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/10.
//

import UIKit

class HomeViewController: UIViewController {
  
  var didSendEventClosure2Tab: ((HomeViewController.EventTab) -> Void)?
  
  var didSendEventClosure: ((HomeViewController.Event) -> Void)?
  
  private lazy var button: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.titleLabel?.font = .systemFont(ofSize: 22, weight: .semibold)
    button.backgroundColor = .systemBlue
    button.setTitle("화면 전환", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemRed
    view.addSubview(button)
    
    NSLayoutConstraint.activate([
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      button.widthAnchor.constraint(equalToConstant: 200),
      button.heightAnchor.constraint(equalToConstant: 50)
    ])
    
  }
  
  deinit {
    print("HomeViewController deinit")
  }
  
  @objc
  func buttonPressed() {
//    didSendEventClosure2Tab?(.detail)
    didSendEventClosure?(.detail)
  }
}

extension HomeViewController {
  enum Event {
    case detail
  }
  enum EventTab {
    case detail
  }
}
