//
//  ColorUtils.swift
//  Mio
//
//  Created by Luo Sheng on 2022/9/29.
//

import AppKit
import Foundation
import SwiftUI

let pantonColors = [
  "#D01C1F", // Fiery Red
  "#CE2D71", // Beetroot Purple Fiery Red
  "#FF7F04", // Tangelo
  "#FA9A84", // Peach Pink
  "#F6D000", // Empire Yellow
  "#FEC3C7", // Crystal Rose
  "#3AA845", // Classic Green
  "#C1DB3C", // Love Bird
  "#4B81BF", // Blue Perennial
  "#A0C3D9", // Summer Song
]

let randomColors = pantonColors.shuffled()

var index = 0

func getRandomIconBackgroundColor() -> Color {
  let result = Color(nsColor: NSColor(hexString: randomColors[index]))
  index = (index + 1) % randomColors.count
  return result
}
