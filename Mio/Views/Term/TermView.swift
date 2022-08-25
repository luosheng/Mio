//
//  TermView.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import SwiftUI
import SwiftTerm
import Combine

struct TermView: NSViewRepresentable {
  @State var theme: ThemeColor = Themes.light
  var nsView = LocalProcessTerminalView(frame: .init(x: 0, y: 0, width: 650, height: 405))
  
  func makeNSView(context: Context) -> LocalProcessTerminalView {
    nsView
  }
  
  func updateNSView(_ nsView: LocalProcessTerminalView, context: Context) {
    applyTheme(nsView, theme: theme)
  }
  
  private func applyTheme(_ view: TerminalView, theme: ThemeColor) {
    view.installColors(theme.ansi)
    let t = view.getTerminal()
    view.setBackgroundColor(source: t, color: theme.background)
    view.setForegroundColor(source: t, color: theme.foreground)
  }
}
