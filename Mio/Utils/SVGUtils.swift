//
//  SVGService.swift
//  Mio
//
//  Created by Luo Sheng on 2022/9/28.
//

import SwiftDraw
import AppKit

let DefaultIcon = "gnubash"

func loadSVGImage(_ type: String?) -> NSImage {
  guard let type,
        let svg = NSImage(svgNamed: "\(type).svg") else {
    return NSImage(svgNamed: "\(DefaultIcon).svg")!
  }
  return svg
}
