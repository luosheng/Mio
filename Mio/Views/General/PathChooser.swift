//
//  PathChooser.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/24.
//

import SwiftUI

struct PathChooser: View {
  var titleKey: LocalizedStringKey
  @Binding var text: String
  var dialogConfig: ((NSOpenPanel) -> Void)?

  var body: some View {
    HStack {
      TextField(titleKey, text: $text)
      Button {
        let dialog = NSOpenPanel()
        dialog.directoryURL = URL(fileURLWithPath: self.text)
        if let dialogConfig = dialogConfig {
          dialogConfig(dialog)
        }
        if dialog.runModal() == NSApplication.ModalResponse.OK {
          guard let url = dialog.url else {
            return
          }
          text = url.path
        }
      } label: {
        Image(systemName: "ellipsis")
      }
    }
  }
}

struct PathChooser_Previews: PreviewProvider {
  static var previews: some View {
    PathChooser(titleKey: "Test", text: .constant("/"))
  }
}
