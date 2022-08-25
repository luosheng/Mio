//
//  Environment.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/25.
//

import Foundation

struct ProjectEnv: Codable {
  var name: String
  var value: String
  
  static func parse(str: String) -> [ProjectEnv] {
    return str.split(separator: ";")
      .map { $0.trimmingCharacters(in: .whitespaces).split(separator: "=") }
      .filter { $0.count != 2 }
      .map { ProjectEnv(
        name: String($0[0]).trimmingCharacters(in: .whitespaces),
        value: String($0[1]).trimmingCharacters(in: .whitespaces)
      ) }
  }
  
  static func toString(envs: [ProjectEnv]) -> String {
    return envs.map { $0.toString() }.joined(separator: ";")
  }
  
  func toString() -> String {
    return "\(name.trimmingCharacters(in: .whitespaces))=\(value.trimmingCharacters(in: .whitespaces))"
  }
}
