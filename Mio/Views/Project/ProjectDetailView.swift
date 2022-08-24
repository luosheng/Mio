//
//  ProjectDetailView.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/24.
//

import SwiftUI

struct ProjectDetailView: View {
  @Binding var presented: Bool
  @StateObject var project = Project(name: "", command: "")
  
  var body: some View {
    VStack {
      Text("Project")
        .font(.title)
        .padding()
      Form {
        TextField("Name", text: $project.name)
        PathChooser(titleKey: "Working Directory", text: $project.directory) { panel in
          panel.title = "Choose working directoy"
          panel.canChooseDirectories = true
        }
        TextField("Command", text: $project.command)
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
          dump(project)
        }
        .keyboardShortcut(KeyEquivalent.return, modifiers: .command)
        .disabled(project.name == "")
      }
      .padding()
    }
    .frame(width: 600, height: 300, alignment: .topLeading)
  }
}

struct ProjectDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ProjectDetailView(presented: .constant(true))
  }
}
