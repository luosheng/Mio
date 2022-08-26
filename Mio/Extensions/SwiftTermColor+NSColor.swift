//
//  SwiftTermColor+NSColor.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/26.
//

import Foundation
import SwiftTerm
import AppKit

extension Color {
  func toNSColor() -> NSColor {
    NSColor(deviceRed: CGFloat(red) / 65535.0,
            green: CGFloat(green) / 65535.0,
            blue: CGFloat(blue) / 65535.0,
            alpha: 1.0)
  }
}
