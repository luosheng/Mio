//
//  Mock.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import Foundation

let mockProjects = [
  Project(id: UUID(), name: "Project A"),
  Project(id: UUID(), name: "Project B")
]

let mockStore = Store(projects: mockProjects)
