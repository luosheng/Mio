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
  @State var project: Project
  @State var theme: ThemeColor = Themes.light
  
  func makeNSView(context: Context) -> LocalProcessTerminalView {
    LocalProcessTerminalView(frame: .zero)
  }
  
  func updateNSView(_ nsView: LocalProcessTerminalView, context: Context) {
    project.forwardedProgressDelegate = nsView
    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
      nsView.feed(byteArray: project.historyData[...])
    }
    applyTheme(nsView, theme: theme)
  }
  
  private func applyTheme(_ view: TerminalView, theme: ThemeColor) {
    view.installColors(theme.ansi)
    let t = view.getTerminal()
    view.setBackgroundColor(source: t, color: theme.background)
    view.setForegroundColor(source: t, color: theme.foreground)
  }
}
