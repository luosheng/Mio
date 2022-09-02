//
//  Project.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import Foundation
import Combine
import SwiftTerm

class Project: Codable, Hashable, Identifiable, ObservableObject, ProcessTerminalViewDelegate {
  
  @Published var id: UUID
  @Published var name: String
  @Published var command: String
  @Published var directory: String
  @Published var environments: [ProjectEnv]
  @Published var autoStarts: Bool
  @Published var running: Bool = false
  
  var ui: TermView = .init()
  
  private enum CodingKeys : String, CodingKey {
    case id, name, command, directory, environments, autoStarts
  }
  
  static func == (lhs: Project, rhs: Project) -> Bool {
    lhs.id == rhs.id
  }
  
  func hash(into hasher: inout Hasher) {
    
  }
  
  init(name: String, command: String, directory: String, environments: [ProjectEnv]) {
    self.id = UUID()
    self.name = name
    self.command = command
    self.directory = directory
    self.environments = environments
    self.autoStarts = false
    
    setup()
  }
  
  convenience init(name: String, command: String) {
    self.init(
      name: name,
      command: command,
      directory: FileManager.default.homeDirectoryForCurrentUser.path,
      environments: []
    )
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(name, forKey: .name)
    try container.encode(command, forKey: .command)
    try container.encode(directory, forKey: .directory)
    try container.encode(environments, forKey: .environments)
    try container.encode(autoStarts, forKey: .autoStarts)
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(UUID.self, forKey: .id)
    name = try container.decode(String.self, forKey: .name)
    command = try container.decode(String.self, forKey: .command)
    directory = try container.decode(String.self, forKey: .directory)
    if let environments = try? container.decodeIfPresent([ProjectEnv].self, forKey: .environments) {
      self.environments = environments
    } else {
      self.environments = []
    }
    autoStarts = (try? container.decodeIfPresent(Bool.self, forKey: .autoStarts)) ?? false
    
    setup()
  }
  
  private func setup() {
    self.ui.nsView.processDelegate = self
  }
  
  func run() {
    self.running = true
    FileManager.default.changeCurrentDirectoryPath(directory)
    self.ui.nsView.startProcess(
      executable: ShellService.shared.shellPath,
      args: ["-l", "-i", "-c", "\(ShellService.shared.getPreCommand());\(command)"],
      environment: self.environments.map { $0.toString() },
      execName: nil
    )
  }
  
  func stop() {
    guard self.running else {
      return
    }
    self.ui.nsView.process.terminate()
  }
  
  func remove() {
    guard let index = Store.shared.projects.firstIndex(where: { $0.id == self.id }) else {
      return
    }
    self.stop()
    Store.shared.selectedProject = nil
    Store.shared.projects.remove(at: index)
    Store.shared.save()
  }
  
  func clear() {
    DispatchQueue.main.async {
      Task {
        await self.ui.nsView.clear()
      }
    }
  }
  
  // MARK: - ProgressTerminalViewDelegate
  
  func sizeChanged(source: ProcessTerminalView, newCols: Int, newRows: Int) {
    
  }
  
  func setTerminalTitle(source: ProcessTerminalView, title: String) {
    
  }
  
  func hostCurrentDirectoryUpdate(source: TerminalView, directory: String?) {
    
  }
  
  func processTerminated(source: ProcessTerminalView, exitCode: Int32?) {
    DispatchQueue.main.async {
      self.running = false
    }
  }
}
