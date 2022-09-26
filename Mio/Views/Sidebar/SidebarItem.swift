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
    VStack {
      HStack {
        Text(project.name)
          .foregroundColor(project.running ? .primary : .secondary)
          .fontWeight(project.running ? .bold : .regular)
        Spacer()
      }
    }
  }
}

struct SidebarItem_Previews: PreviewProvider {
  static var previews: some View {
    SidebarItem(project: mockProjects[0])
  }
}
