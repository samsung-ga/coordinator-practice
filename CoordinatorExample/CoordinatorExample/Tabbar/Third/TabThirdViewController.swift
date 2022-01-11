//
//  TabThirdViewController.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/10.
//

import UIKit

class TabThirdViewController: UIViewController {
  
  var didSendEventClosure2TabCoordi: ((TabThirdViewController.Event) -> Void)?
  
  private lazy var button: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("로그아웃", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 22, weight: .semibold)
    button.backgroundColor = .systemBlue
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 5.0
    button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(button)
    NSLayoutConstraint.activate([
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      button.widthAnchor.constraint(equalToConstant: 200),
      button.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  
  deinit {
    print("TabThirdViewController deinit")
  }
  
  @objc
  func buttonPressed() {
    didSendEventClosure2TabCoordi?(.logout)
  }
}

extension TabThirdViewController {
  enum Event {
    case logout
  }
}
