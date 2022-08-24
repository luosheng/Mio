//
//  Project.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import Foundation
import SwiftTerm
import Combine

enum ProjectAction {
  case terminate
  case run(Project)
}

class Project: Codable, Identifiable, ObservableObject {
  @Published var id: UUID
  @Published var name: String
  @Published var command: String
  @Published var directory: String
  @Published var running: Bool = false
  
  var process: LocalProcess?
  var actionPublisher: PassthroughSubject<ProjectAction, Never> = PassthroughSubject()
  
  private enum CodingKeys : String, CodingKey {
    case id, name, command, directory
  }
  
  init(name: String, command: String, directory: String) {
    self.id = UUID()
    self.name = name
    self.command = command
    self.directory = directory
  }
  
  convenience init(name: String, command: String) {
    self.init(name: name, command: command, directory: FileManager.default.homeDirectoryForCurrentUser.path)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(name, forKey: .name)
    try container.encode(command, forKey: .command)
    try container.encode(directory, forKey: .directory)
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(UUID.self, forKey: .id)
    name = try container.decode(String.self, forKey: .name)
    command = try container.decode(String.self, forKey: .command)
    directory = try container.decode(String.self, forKey: .directory)
  }
  
  func run() {
    actionPublisher.send(.run(self))
  }
  
  func stop() {
    actionPublisher.send(.terminate)
  }
}
