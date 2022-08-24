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
  
  @State private var runCancellable: AnyCancellable?
  
  func makeCoordinator() -> Coordinator {
    Coordinator()
  }
  
  func makeNSView(context: Context) -> LocalProcessTerminalView {
    let view = LocalProcessTerminalView(frame: .init(x: 0, y: 0, width: 100, height: 100))
    
    DispatchQueue.main.async {
      self.runCancellable = project.runPublisher.sink(receiveValue: { p in
        FileManager.default.changeCurrentDirectoryPath(p.directory)
        view.startProcess(executable: ShellService.shared.shellPath, args: ["-l", "-c", "-i", p.command], environment: nil, execName: nil)
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
