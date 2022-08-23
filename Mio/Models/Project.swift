//
//  Project.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import Foundation
import SwiftTerm
import Combine

class Project: Codable, Identifiable, LocalProcessDelegate {
  var id: UUID
  var name: String
  var command: String
  var directory: String?
  
  var dataPublisher: PassthroughSubject<ArraySlice<UInt8>, Never>
  
  private enum CodingKeys : String, CodingKey {
    case id, name, command, directory
  }
  
  init(name: String, command: String, directory: String?) {
    self.id = UUID()
    self.name = name
    self.command = command
    self.directory = directory
    
    self.dataPublisher = PassthroughSubject()
  }
  
  convenience init(name: String, command: String) {
    self.init(name: name, command: command, directory: nil)
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(UUID.self, forKey: .id)
    name = try container.decode(String.self, forKey: .name)
    command = try container.decode(String.self, forKey: .command)
    directory = try container.decode(String?.self, forKey: .directory)
    
    self.dataPublisher = PassthroughSubject()
  }
  
  func run() {
    let process = LocalProcess(delegate: self)
    if let directory = directory {
      chdir(NSString(string: directory).utf8String)
    }
    process.startProcess(executable: ShellService.shared.shellPath, args: ["-l", "-c", command], environment: nil, execName: nil)
  }
  
  func processTerminated(_ source: LocalProcess, exitCode: Int32?) {
    print("process terminated")
  }
  
  func dataReceived(slice: ArraySlice<UInt8>) {
    self.dataPublisher.send(slice)
    print(slice)
  }
  
  func getWindowSize() -> winsize {
    return winsize()
  }
}
