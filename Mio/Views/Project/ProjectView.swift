//
//  ProjectView.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import SwiftUI
import XTerm

struct ProjectView: View {
  @Environment(\.colorScheme) var colorScheme
  @StateObject var project: Project
  @State private var presentingProjectDetail: Bool = false
  @EnvironmentObject var store: Store

  var body: some View {
    VStack(spacing: 0) {
      TermView()
        .theme(colorScheme == .light ? Theme.defaultLight : Theme.defaultDark)
        .coordinate(project.coordinator)
      HStack {
        Spacer()
        Button {
          project.clear()
        } label: {
          Image(systemName: "trash")
        }
        .frame(width: 16, height: 16)
        .buttonStyle(.plain)
        .padding(8)
      }
      .overlay(Divider(), alignment: .top)
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
        .keyboardShortcut(.init("I"), modifiers: .command)

        Button {
          project.run()
        } label: {
          Image(systemName: "play.fill")
        }
        .keyboardShortcut(.init("R"), modifiers: .command)
        .disabled(project.running)

        Button {
          project.stop()
        } label: {
          Image(systemName: "stop.fill")
        }
        .keyboardShortcut(.init("."), modifiers: .command)
        .disabled(!project.running)
      }
    }
    .sheet(isPresented: $presentingProjectDetail) {
      ProjectDetailView(presented: $presentingProjectDetail, editing: true) { p in
        project.merge(with: p)
        store.save()
      }
        .environmentObject(project.copy() as! Project)
    }
  }
}

struct ProjectView_Previews: PreviewProvider {
  static var previews: some View {
    ProjectView(project: mockProjects[0])
  }
}
