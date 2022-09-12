//
//  TermView.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import SwiftUI
import Combine
import XTerm

struct TermView: NSViewRepresentable {
  
  var projectCoordinator: ProjectCoordinator?
  
  func makeNSView(context: Context) -> XTermView {
    XTermView(frame: .zero)
  }
  
  func updateNSView(_ nsView: XTermView, context: Context) {
    projectCoordinator?.view = nsView
  }
  
  func theme(_ theme: ThemeColor) -> TermView {
    return self
  }
  
  func coordinate(_ coordinator: ProjectCoordinator) -> TermView {
    var view = self
    view.projectCoordinator = coordinator
    return view
  }
}
