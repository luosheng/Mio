//
//  TermView.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import SwiftUI
import SwiftTerm

struct TermView: NSViewRepresentable {
  func makeNSView(context: Context) -> some NSView {
    return TerminalView(frame: .zero)
  }
  
  func updateNSView(_ nsView: NSViewType, context: Context) {
    
  }
}
