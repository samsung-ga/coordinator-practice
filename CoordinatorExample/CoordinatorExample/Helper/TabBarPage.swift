//
//  TabBarPage.swift
//  CoordinatorExample
//
//  Created by Wody on 2022/01/11.
//

import Foundation

enum TabBarPage {
  case home
  case list
  case mypage
  
  init?(index: Int) {
    switch index {
    case 0:
      self = .home
    case 1:
      self = .list
    case 2:
      self = .mypage
    default:
      return nil
    }
  }
  
  func pageTitleValue() -> String {
    switch self {
    case .home:
      return "홈"
    case .list:
      return "리스트"
    case .mypage:
      return "마이페이지"
    }
  }
  
  func pageOrderNumber() -> Int {
    switch self {
    case .home:
      return 0
    case .list:
      return 1
    case .mypage:
      return 2
    }
  }
}
