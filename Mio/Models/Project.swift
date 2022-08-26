//
//  Project.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import Foundation
import SwiftTerm
import Combine

class Project: Codable, Identifiable, ObservableObject, LocalProcessDelegate {
  
  @Published var id: UUID
  @Published var name: String
  @Published var command: String
  @Published var directory: String
  @Published var environments: [ProjectEnv]
  @Published var running: Bool = false
  
  var process: LocalProcess!
  weak var forwardedProgressDelegate: LocalProcessDelegate?
  var ui: TermView = .init()
  
  private enum CodingKeys : String, CodingKey {
    case id, name, command, directory, environments
  }
  
  init(name: String, command: String, directory: String, environments: [ProjectEnv]) {
    self.id = UUID()
    self.name = name
    self.command = command
    self.directory = directory
    self.environments = environments
    
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
    
    setup()
  }
  
  private func setup() {
    self.forwardedProgressDelegate = self.ui.nsView
    self.process = LocalProcess(delegate: self, dispatchQueue: .global())
  }
  
  private func getFullEnvironments() -> [String] {
    Terminal.getEnvironmentVariables() + self.environments.map { $0.toString() }
  }
  
  func run() {
    self.running = true
    FileManager.default.changeCurrentDirectoryPath(directory)
    self.process.startProcess(
      executable: ShellService.shared.shellPath,
      args: ["-l", "-i", "-c", "\(ShellService.shared.getPreCommand());\(command)"],
      environment: getFullEnvironments(),
      execName: nil
    )
  }
  
  func stop() {
    self.process.terminate()
  }
  
  // MARK: - LocalProcessDelegate
  
  func processTerminated(_ source: LocalProcess, exitCode: Int32?) {
    DispatchQueue.main.async {
      self.running = false
    }
  }
  
  func dataReceived(slice: ArraySlice<UInt8>) {
    self.ui.nsView.feed(byteArray: slice)
  }
  
  func getWindowSize() -> winsize {
    return self.forwardedProgressDelegate?.getWindowSize() ?? winsize()
  }
}
