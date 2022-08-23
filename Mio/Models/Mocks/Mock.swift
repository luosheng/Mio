//
//  Mock.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import Foundation

let mockProjects = [
  Project(name: "Project A", command: "printenv"),
  Project(name: "Project B", command: "msgcat --color=test")
]

let mockStore = Store(projects: mockProjects)
