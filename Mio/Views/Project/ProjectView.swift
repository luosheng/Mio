//
//  ProjectView.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import SwiftUI

struct ProjectView: View {
  @Environment(\.colorScheme) var colorScheme
  @StateObject var project: Project
  
  var body: some View {
    VStack {
      TermView(project: project, theme: colorScheme == .light ? Themes.light : Themes.dark)
    }
    .navigationTitle(project.name)
    .toolbar {
      ToolbarItemGroup(placement: .primaryAction) {
        Button {
          project.run()
        } label: {
          Image(systemName: "play.fill")
        }
        .disabled(project.running)
        
        Button {
          project.stop()
        } label: {
          Image(systemName: "stop.fill")
        }
        .disabled(!project.running)
      }
    }
  }
}

struct ProjectView_Previews: PreviewProvider {
  static var previews: some View {
    ProjectView(project: mockProjects[0])
  }
}
