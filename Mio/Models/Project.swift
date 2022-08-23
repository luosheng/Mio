//
//  Project.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import Foundation
import SwiftTerm
import Combine

class Project: Identifiable, LocalProcessDelegate {
  var id: UUID
  var name: String
  var command: String
  var directory: String?
  
  var dataPublisher: PassthroughSubject<ArraySlice<UInt8>, Never>
  
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
