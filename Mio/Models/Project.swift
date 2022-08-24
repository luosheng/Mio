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
  var id: UUID
  var name: String
  var command: String
  var directory: String
  var history: [ArraySlice<UInt8>] = []
  
  var dataPublisher: PassthroughSubject<ArraySlice<UInt8>, Never> = PassthroughSubject()
  
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
    self.init(name: name, command: command, directory: "/")
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(UUID.self, forKey: .id)
    name = try container.decode(String.self, forKey: .name)
    command = try container.decode(String.self, forKey: .command)
    directory = try container.decode(String.self, forKey: .directory)
  }
  
  func run() {
    let process = LocalProcess(delegate: self)
    chdir(NSString(string: directory).utf8String)
    process.startProcess(executable: ShellService.shared.shellPath, args: ["-l", "-c", command], environment: nil, execName: nil)
  }
  
  // MARK: - LocalProcessDelegate
  
  func processTerminated(_ source: LocalProcess, exitCode: Int32?) {
    print("process terminated")
  }
  
  func dataReceived(slice: ArraySlice<UInt8>) {
    history.append(slice)
    self.dataPublisher.send(slice)
    print(slice)
  }
  
  func getWindowSize() -> winsize {
    return winsize()
  }
}
