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
        Spacer()
        Circle()
          .frame(width: 8, height: 8)
          .foregroundColor(project.running ? Color.green : Color.gray)
      }
    }
  }
}

struct SidebarItem_Previews: PreviewProvider {
  static var previews: some View {
    SidebarItem(project: mockProjects[0])
  }
}
