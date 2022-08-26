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
  var nsView = ProcessTerminalView(frame: .init(x: 0, y: 0, width: 650, height: 405))
  
  func makeNSView(context: Context) -> ProcessTerminalView {
    nsView
  }
  
  func updateNSView(_ nsView: ProcessTerminalView, context: Context) {
  }
  
  func theme(_ theme: ThemeColor) -> some View {
    DispatchQueue.main.async {
      nsView.installColors(theme.ansi)
      let t = nsView.getTerminal()
      let bgColor = theme.background
      nsView.setBackgroundColor(source: t, color: bgColor)
      nsView.setForegroundColor(source: t, color: theme.foreground)
      nsView.layer?.backgroundColor = bgColor.toNSColor().cgColor
    }
    return self
  }
}
