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
  [NSColor(red: 0.00, green: 0.77, blue: 0.99, alpha: 1.00), NSColor(red: 0.33, green: 0.24, blue: 1.00, alpha: 1.00)],
]

func getColor(_ num: Int) -> [Color] {
  let index = num % PredefinedColors.count
  return PredefinedColors[index].map { Color(nsColor: $0) }
}
