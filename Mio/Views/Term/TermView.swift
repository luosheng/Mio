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
  var nsView = XTermView(frame: .init(x: 0, y: 0, width: 650, height: 405))
  
  func makeNSView(context: Context) -> XTermView {
    nsView
  }
  
  func updateNSView(_ nsView: XTermView, context: Context) {
  }
  
  func theme(_ theme: ThemeColor) -> TermView {
    return self
  }
  
  func coordinate(_ coordinator: ProjectCoordinator) -> TermView {
    coordinator.view = nsView
    return self
  }
}
