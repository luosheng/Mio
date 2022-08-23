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
  @State private var cancellable: AnyCancellable?
  @State private var historyCancellable: AnyCancellable?
  
  func makeCoordinator() -> Coordinator {
    Coordinator()
  }
  
  func makeNSView(context: Context) -> TerminalView {
    TerminalView(frame: .zero)
  }
  
  func updateNSView(_ nsView: TerminalView, context: Context) {
    DispatchQueue.main.async {
      self.cancellable = project.dataPublisher.sink(receiveValue: { byteArray in
        nsView.feed(byteArray: byteArray)
      })
      self.historyCancellable = project.history.publisher.sink(receiveValue: { byteArray in
        nsView.feed(byteArray: byteArray)
      })
    }
  }
}
