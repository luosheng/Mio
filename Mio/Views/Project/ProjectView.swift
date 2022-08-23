//
//  ProjectView.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import SwiftUI

struct ProjectView: View {
  @Environment(\.colorScheme) var colorScheme
  var project: Project
  
  var body: some View {
    VStack {
      TermView(project: project, theme: colorScheme == .light ? Themes.light : Themes.dark)
    }
    .navigationTitle(project.name)
    .toolbar {
      ToolbarItemGroup {
        Spacer()
        Button {
          project.run()
        } label: {
          Image(systemName: "play.circle")
        }
      }
    }
  }
}

struct ProjectView_Previews: PreviewProvider {
  static var previews: some View {
    ProjectView(project: mockProjects[0])
  }
}
