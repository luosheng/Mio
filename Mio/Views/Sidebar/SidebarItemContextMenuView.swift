//
//  SidebarItemContextMenuView.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/24.
//

import SwiftUI

struct SidebarItemContextMenuView: View {
  @StateObject var project: Project
  var body: some View {
    VStack {
      Button("Run") {
        project.run()
      }
      .disabled(project.running)

      Button("Stop") {
        project.stop()
      }
      .disabled(!project.running)

      Divider()

      Button("Remove") {
        project.remove()
      }
    }
  }
}

struct SidebarItemContextMenuView_Previews: PreviewProvider {
  static var previews: some View {
    SidebarItemContextMenuView(project: mockProjects[0])
  }
}
