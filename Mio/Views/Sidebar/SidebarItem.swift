//
//  SidebarItem.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import SwiftUI

struct SidebarItem: View {
  @ObservedObject var project: Project

  var body: some View {
    HStack {
      Image(nsImage: loadSVGImage(project.icon))
        .renderingMode(.template)
        .font(.system(size: 24))
        .foregroundColor(project.running ? .primary : Color("InactiveText"))
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
