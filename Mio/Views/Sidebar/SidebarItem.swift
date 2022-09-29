//
//  SidebarItem.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import SVGView
import SwiftUI

struct SidebarItem: View {
  @ObservedObject var project: Project

  var body: some View {
    HStack {
      SidebarIcon(project: project)
      Text(project.name)
        .font(.headline)
        .fontWeight(.semibold)
        .foregroundColor(project.running ? .primary : Color("InactiveText"))
      Spacer()
    }
  }
}

struct SidebarItem_Previews: PreviewProvider {
  static var previews: some View {
    SidebarItem(project: mockProjects[0])
  }
}
