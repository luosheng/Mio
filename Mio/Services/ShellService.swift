//
//  ShellService.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import Foundation

struct ShellService {
  
  static let DEFAULT_SHELL = "/bin/bash"
  
  static let shared: ShellService = .init()
  
  var shellPath: String!
  
  init() {
    shellPath = ShellService.DEFAULT_SHELL
    let process = Process()
    process.executableURL = URL(fileURLWithPath: ShellService.DEFAULT_SHELL)
    process.arguments = ["-l", "-c", "dscl . -read ~/ UserShell"]
    let pipe = Pipe()
    process.standardOutput = pipe
    try? process.run()
    guard let data = try? pipe.fileHandleForReading.readToEnd() else {
      return
    }
    guard let output = String(data: data, encoding: .utf8) else {
      return
    }
    shellPath = output.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "UserShell: ", with: "")
  }
  
}
