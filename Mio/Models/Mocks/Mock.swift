//
//  Mock.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import Foundation

let mockProjects = [
  Project(name: "Print Env", command: "printenv"),
  Project(name: "Color Test", command: "msgcat --color=test"),
  Project(name: "Change Dir", command: "ls", directory: "/Applications/"),
]

let mockStore = Store(projects: mockProjects)
