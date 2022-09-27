//
//  ThemePreview.swift
//  Mio
//
//  Created by Luo Sheng on 2022/9/27.
//

import SwiftUI
import XTerm

struct ThemePreview: View {
  private var theme: Theme

  init(theme: Theme) {
    self.theme = theme
  }

  var body: some View {
    VStack {
      HStack {
        Rectangle()
          .fill(Color(NSColor(hexString: theme.black!)))
          .frame(width: 16, height: 16)
        Rectangle()
          .fill(Color(NSColor(hexString: theme.blue!)))
          .frame(width: 16, height: 16)
      }
    }
  }
}

struct ThemePreview_Previews: PreviewProvider {
  static var previews: some View {
    ThemePreview(theme: Theme.defaultDark)
  }
}
