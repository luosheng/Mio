//
//  SidebarIcon.swift
//  Mio
//
//  Created by Luo Sheng on 2022/9/29.
//

import SwiftUI

struct SidebarIcon: View {
  @ObservedObject var project: Project
  var body: some View {
    loadIcon(project.icon, inactive: !project.running)
      .frame(width: 24, height: 24)
  }
}

struct SidebarIcon_Previews: PreviewProvider {
  static var previews: some View {
    SidebarIcon(project: mockProject)
  }
}
