//
//  ProjectDetailView.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/24.
//

import SwiftUI

struct ProjectDetailView: View {
  @Binding var presented: Bool
  var editing: Bool = false
  @EnvironmentObject var project: Project
  @EnvironmentObject var store: Store
  var onFinished: ((Project) -> Void)?

  var body: some View {
    VStack {
      Text(editing ? "Edit project" : "Add project")
        .font(.title2)
        .padding()
      Form {
        TextField("Name", text: $project.name)
        PathChooser(titleKey: "Working Directory", text: $project.directory) { panel in
          panel.title = "Choose working directoy"
          panel.canChooseDirectories = true
        }
        TextField("Command", text: $project.command)
        EnvironmentField(environments: $project.environments)
        Toggle("Launch at start", isOn: $project.autoStarts)
          .toggleStyle(.switch)
        TextField("Icon", text: Binding(get: {
          project.icon ?? ""
        }, set: { val in
          project.icon = val
        }))
      }
      .padding()

      Spacer()
      Divider()

      HStack {
        Button("Cancel") {
          self.presented = false
        }
        .keyboardShortcut(.cancelAction)

        Spacer()

        Button("Save") {
          self.presented = false
          onFinished?(project)
        }
        .keyboardShortcut(KeyEquivalent.return, modifiers: .command)
        .disabled(project.name == "")
      }
      .padding()
    }
    .frame(width: 600, alignment: .topLeading)
  }
}

struct ProjectDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ProjectDetailView(presented: .constant(true))
  }
}
