//
//  ColorUtils.swift
//  Mio
//
//  Created by Luo Sheng on 2022/9/29.
//

import AppKit
import Foundation
import SwiftUI

let PredefinedColors: [[NSColor]] = [
  [NSColor(red: 0.29, green: 0.68, blue: 1.00, alpha: 1.00), NSColor(red: 0.00, green: 0.39, blue: 0.90, alpha: 1.00)],
  [NSColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00), NSColor(red: 0.10, green: 0.05, blue: 0.02, alpha: 1.00)],
  [NSColor(red: 0.76, green: 0.44, blue: 0.87, alpha: 1.00), NSColor(red: 0.48, green: 0.40, blue: 0.82, alpha: 1.00)],
  [NSColor(red: 0.99, green: 0.35, blue: 0.07, alpha: 1.00), NSColor(red: 1.00, green: 0.28, blue: 0.00, alpha: 1.00)],
  [NSColor(red: 0.98, green: 0.35, blue: 0.44, alpha: 1.00), NSColor(red: 0.96, green: 0.12, blue: 0.20, alpha: 1.00)],
  [NSColor(red: 0.05, green: 0.80, blue: 0.37, alpha: 1.00), NSColor(red: 0.01, green: 0.76, blue: 0.60, alpha: 1.00)],
]

let randomColors = PredefinedColors.shuffled()

var index = 0

func getRandomIconBackgroundColor() -> [Color] {
  let result = randomColors[index].map { Color(nsColor: $0) }
  index = (index + 1) % randomColors.count
  return result
}
