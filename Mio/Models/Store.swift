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
  @Published var selectedProject: Project?
  
  var projectsSavePath: URL
  
  convenience init() {
    self.init(projects: [])
  }
  
  init(
    projects: [Project]
  ) {
    self.projects = projects
    
    var saveUrl: URL
    if let url = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first,
       let id = Bundle.main.bundleIdentifier {
      saveUrl = url.appendingPathComponent(id)
    } else {
      saveUrl = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent(".mio-launcher")
    }
    try? FileManager.default.createDirectory(at: saveUrl, withIntermediateDirectories: true)
    projectsSavePath = saveUrl.appendingPathComponent("projects.json")
    
    if (self.projects.count == 0) {
      self.load()
    }
  }
  
  func save() {
    let encoder = JSONEncoder()
    let data = try? encoder.encode(projects)
    try? data?.write(to: self.projectsSavePath)
  }
  
  func load() {
    guard let data = try? Data(contentsOf: self.projectsSavePath) else {
      return
    }
    let decoder = JSONDecoder()
    guard let projects = try? decoder.decode([Project]?.self, from: data) else {
      return
    }
    self.projects = projects
    
    self.projects.filter { $0.autoStarts }.forEach { $0.run() }
  }
  
  func moveProject(from: IndexSet, to index: Int) {
    self.projects.move(fromOffsets: from, toOffset: index)
    Task.detached {
      self.save()
    }
  }
}
