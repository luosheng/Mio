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
  var didReceivedData: PassthroughSubject<ArraySlice<UInt8>, Never>?
  @State private var cancellable: AnyCancellable? = nil
  
  func makeCoordinator() -> Coordinator {
    Coordinator()
  }
  
  func makeNSView(context: Context) -> TerminalView {
    TerminalView(frame: .zero)
  }
  
  func updateNSView(_ nsView: TerminalView, context: Context) {
    if (didReceivedData != nil) {
      DispatchQueue.main.async {
        self.cancellable = didReceivedData?.sink(receiveValue: { byteArray in
          nsView.feed(byteArray: byteArray)
        })
      }
    }
  }
}
