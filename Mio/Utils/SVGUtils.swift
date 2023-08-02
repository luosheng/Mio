//
//  SVGService.swift
//  Mio
//
//  Created by Luo Sheng on 2022/9/28.
//

import Foundation
import SVGView
import SwiftDraw
import AppKit

let DefaultIcon = "gnubash"

func loadSvgString(_ type: String) -> String? {
  guard let url = Bundle.main.url(forResource: "\(type)", withExtension: "svg"),
        let data = try? Data(contentsOf: url),
        let string = String(data: data, encoding: .utf8)
  else {
    return nil
  }
  return string
}

func transformSvgToInactive(_ svg: String, hexColor: String = "#B0B0B0") -> String {
  return svg.replacingOccurrences(of: ##"fill="#\w+""##, with: "fill=\"\(hexColor)\"", options: .regularExpression)
}

func loadSVGImage(_ type: String?) -> NSImage {
  guard let type,
        let svg = NSImage(svgNamed: "\(type).svg") else {
    return NSImage(svgNamed: "\(DefaultIcon).svg")!
  }
  return svg
}

func loadIcon(_ icon: String?, hexColor: String?) -> SVGView {
  var destSvg: String
  if let icon = icon,
     let svg = loadSvgString(icon)
  {
    destSvg = svg
  } else {
    destSvg = loadSvgString(DefaultIcon)!
  }

  let view = SVGView(string: destSvg)
  if let svg = view.svg, let svgGroup = svg as? SVGGroup, let hexColor {
    svgGroup.contents.forEach { node in
      if let path = node as? SVGPath {
        if path.fill != nil {
          path.fill = SVGColor(hex: hexColor.replacingOccurrences(of: "#", with: ""))
        }
      }
    }
  }
  return view
}
