//
//  Mock.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import Foundation

let mockProject = Project(name: "Print Env", command: "printenv", directory: "/", environments: [
  ProjectEnv(name: "POP_TEST", value: "1")
])

let mockProjects = [
  mockProject,
  Project(name: "Color Test", command: "msgcat --color=test"),
  Project(name: "Change Dir", command: "ls", directory: "/Applications/", environments: []),
]

let mockStore = Store(projects: mockProjects)
