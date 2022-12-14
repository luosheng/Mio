//
//  ColorBlock.swift
//  Mio
//
//  Created by Luo Sheng on 2022/9/27.
//

import SwiftUI

struct ColorBlock: View {
  private var color: NSColor
  init(_ hexString: String?, defaultColor: NSColor = .black) {
    color = (hexString != nil) ? NSColor(hexString: hexString!) : defaultColor
  }

  var body: some View {
    Rectangle()
      .fill(Color(color))
      .frame(width: 12, height: 12)
      .overlay {
        Rectangle()
          .strokeBorder(.white, lineWidth: 1)
      }
  }
}

struct ColorBlock_Previews: PreviewProvider {
  static var previews: some View {
    ColorBlock("#333333")
  }
}
