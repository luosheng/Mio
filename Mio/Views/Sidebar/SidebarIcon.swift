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
    ZStack {
      RoundedRectangle(cornerRadius: 8)
        .fill(LinearGradient(colors: project.running ? [Color(nsColor: NSColor(red: 0.00, green: 0.77, blue: 0.99, alpha: 1.00)), Color(nsColor: NSColor(red: 0.33, green: 0.24, blue: 1.00, alpha: 1.00))] : [Color("InactiveText")], startPoint: .top, endPoint: .bottom))
        .frame(width: 32, height: 32)
      loadIcon(project.icon, hexColor: project.running ? "#FFFFFF" : "#858585")
        .frame(width: 24, height: 24)
    }
  }
}

struct SidebarIcon_Previews: PreviewProvider {
  static var previews: some View {
    SidebarIcon(project: mockProject)
  }
}
