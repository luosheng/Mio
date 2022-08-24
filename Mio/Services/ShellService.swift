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
    shellPath = self.getShell()
  }
  
  private func getShell() -> String {
    let bufsize = sysconf(_SC_GETPW_R_SIZE_MAX)
    guard bufsize != -1 else {
      return ShellService.DEFAULT_SHELL
    }
    let buffer = UnsafeMutablePointer<Int8>.allocate(capacity: bufsize)
    defer {
      buffer.deallocate()
    }
    var pwd = passwd()
    var result: UnsafeMutablePointer<passwd>? = UnsafeMutablePointer<passwd>.allocate(capacity: 1)
    
    if getpwuid_r(getuid(), &pwd, buffer, bufsize, &result) != 0 {
      return ShellService.DEFAULT_SHELL
    }
    return String(cString: pwd.pw_shell)
  }
  
}
