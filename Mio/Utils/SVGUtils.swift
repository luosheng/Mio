//
//  SVGService.swift
//  Mio
//
//  Created by Luo Sheng on 2022/9/28.
//

import Foundation
import SVGView

let DefaultIcon = "bash"

func loadSvgString(_ type: String) -> String? {
  guard let url = Bundle.main.url(forResource: "\(type)-original", withExtension: "svg"),
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

func loadIcon(_ icon: String?, hexColor: String?) -> SVGView {
  var destSvg: String
  if let icon = icon,
     let svg = loadSvgString(icon)
  {
    destSvg = svg
  } else {
    destSvg = loadSvgString(DefaultIcon)!
  }
  if let hexColor = hexColor {
    destSvg = transformSvgToInactive(destSvg, hexColor: hexColor)
  }
  return SVGView(string: destSvg)
}
