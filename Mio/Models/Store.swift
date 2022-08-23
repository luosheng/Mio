//
//  Store.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import Foundation

class Store: ObservableObject {
  static let shared: Store = .init()
  
  @Published var projects: [Project]
  
  convenience init() {
    self.init(projects: [])
  }
  
  init(
    projects: [Project]
  ) {
    self.projects = projects
  }
}
