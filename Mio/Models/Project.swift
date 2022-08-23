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
  
  var dataPublisher: PassthroughSubject<ArraySlice<UInt8>, Never>
  
  init(name: String, command: String) {
    self.id = UUID()
    self.name = name
    self.command = command
    
    self.dataPublisher = PassthroughSubject()
  }
  
  func run() {
    let process = LocalProcess(delegate: self)
    process.startProcess(executable: "/bin/zsh", args: ["-c", command], environment: nil, execName: nil)
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
