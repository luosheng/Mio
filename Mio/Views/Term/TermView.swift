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
  
  @State private var cancellable: AnyCancellable?
  @State private var historyCancellable: AnyCancellable?
  
  func makeCoordinator() -> Coordinator {
    Coordinator()
  }
  
  func makeNSView(context: Context) -> LocalProcessTerminalView {
    let view = LocalProcessTerminalView(frame: .zero)
    
    DispatchQueue.main.async {
      self.cancellable = project.dataPublisher.sink(receiveValue: { byteArray in
        view.feed(byteArray: byteArray)
      })
      self.historyCancellable = project.history.publisher.sink(receiveValue: { byteArray in
        view.feed(byteArray: byteArray)
      })
    }
    
    return view
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
