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
    ZStack {
      VStack(alignment: .leading) {
        HStack {
          Text("Foreground")
            .font(.title3)
            .foregroundColor(Color(nsColor: NSColor(hexString: theme.foreground!)))
          Spacer()
        }
        HStack {
          ColorBlock(theme.black)
          ColorBlock(theme.blue)
          ColorBlock(theme.cyan)
          ColorBlock(theme.green)
          ColorBlock(theme.magenta)
          ColorBlock(theme.red)
          ColorBlock(theme.white)
          ColorBlock(theme.yellow)
        }
        HStack {
          ColorBlock(theme.brightBlack)
          ColorBlock(theme.brightBlue)
          ColorBlock(theme.brightCyan)
          ColorBlock(theme.brightGreen)
          ColorBlock(theme.brightMagenta)
          ColorBlock(theme.brightRed)
          ColorBlock(theme.brightWhite)
          ColorBlock(theme.brightYellow)
        }
      }
      .frame(width: 150)
      .padding()
    }
    .background(Color(nsColor: NSColor(hexString: theme.background!)))
  }
}

struct ThemePreview_Previews: PreviewProvider {
  static var previews: some View {
    ThemePreview(theme: Theme.defaultDark)
  }
}
