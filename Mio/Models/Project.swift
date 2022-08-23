//
//  Project.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import Foundation
import SwiftTerm

class Project: Codable, Identifiable, LocalProcessDelegate {
  func processTerminated(_ source: LocalProcess, exitCode: Int32?) {
    print("process terminated")
  }
  
  func dataReceived(slice: ArraySlice<UInt8>) {
    print(slice)
  }
  
  func getWindowSize() -> winsize {
    return winsize()
  }
  
  var id: UUID
  var name: String
  
  init(name: String) {
    self.id = UUID()
    self.name = name
  }
  
  func run() {
    let process = LocalProcess(delegate: self)
    process.startProcess(executable: "/bin/zsh", args: ["-c", "printenv"], environment: nil, execName: nil)
  }
}
