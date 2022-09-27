//
//  TermView.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import Combine
import SwiftUI
import XTerm

struct TermView: NSViewRepresentable {
  var projectCoordinator: ProjectCoordinator?
  var theme: Theme = .defaultLight

  func makeNSView(context _: Context) -> XTermView {
    XTermView(frame: .zero)
  }

  func updateNSView(_ nsView: XTermView, context _: Context) {
    projectCoordinator?.view = nsView
    Task {
      await nsView.applyTheme(theme: theme)
    }
  }

  func theme(_ theme: Theme) -> TermView {
    var view = self
    view.theme = theme
    return view
  }

  func coordinate(_ coordinator: ProjectCoordinator) -> TermView {
    var view = self
    view.projectCoordinator = coordinator
    return view
  }
}
