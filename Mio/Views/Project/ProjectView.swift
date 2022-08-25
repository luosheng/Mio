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
  @State private var presentingProjectDetail: Bool = false
  
  var body: some View {
    VStack {
      project.ui.theme(colorScheme == .light ? Themes.light : Themes.dark)
    }
    .navigationTitle(project.name)
    .navigationSubtitle(project.command)
    .toolbar {
      ToolbarItemGroup(placement: .primaryAction) {
        Button {
          presentingProjectDetail = true
        } label: {
          Image(systemName: "square.and.pencil")
        }
        
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
    .sheet(isPresented: $presentingProjectDetail) {
      ProjectDetailView(presented: $presentingProjectDetail, editing: true, project: project)
    }
  }
}

struct ProjectView_Previews: PreviewProvider {
  static var previews: some View {
    ProjectView(project: mockProjects[0])
  }
}
