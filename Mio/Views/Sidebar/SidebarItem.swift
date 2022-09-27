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
      if let icon = project.icon,
         let iconUrl = Bundle.main.url(forResource: "\(icon)-original", withExtension: "svg")
      {
        SVGView(contentsOf: iconUrl)
          .frame(width: 32, height: 32)
      } else {
        SVGView(contentsOf: Bundle.main.url(forResource: "bash-original", withExtension: "svg")!)
          .frame(width: 32, height: 32)
      }
      VStack {
        HStack {
          Text(project.name)
            .font(.headline)
            .fontWeight(.semibold)
          Spacer()
        }
        HStack {
          Text(project.command)
            .foregroundColor(project.running ? .green : .secondary)
            .font(.caption)
          Spacer()
        }
      }
    }
  }
}

struct SidebarItem_Previews: PreviewProvider {
  static var previews: some View {
    SidebarItem(project: mockProjects[0])
  }
}
