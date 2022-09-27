//
//  Preferences.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/25.
//

import Foundation
import SwiftUI

enum Appearance: String, Codable, CaseIterable, Identifiable {
  case dark
  case light
  case system

  var id: String { rawValue }

  func toColorScheme() -> ColorScheme? {
    switch self {
    case .light:
      return .light
    case .dark:
      return .dark
    case .system:
      return .none
    }
  }
}

class Preferences: ObservableObject {
  @AppStorage("appearance") public var appearance: Appearance = .system
}
