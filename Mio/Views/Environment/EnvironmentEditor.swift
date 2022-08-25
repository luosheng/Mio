//
//  EnvironmentEditor.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/25.
//

import SwiftUI

struct EnvironmentEditor: View {
  @Binding var presented: Bool
  @Binding var environments: [ProjectEnv]
  
  var body: some View {
    VStack {
      Text("Edit environments")
        .font(.title)
        .padding()
      HStack {
        Button {
          environments.append(ProjectEnv(name: "Name", value: "Value"))
        } label: {
          Image(systemName: "plus")
        }
        Spacer()
      }
      Table(environments) {
        TableColumn("Name") { row in
          let binding = Binding {
            row.name
          } set: { val in
            if let index = environments.firstIndex(where: { env in
              env.id == row.id
            }) {
              environments[index].name = val
            }
          }
          TextEditor(text: binding)
        }
        TableColumn("Value") { row in
          let binding = Binding {
            row.value
          } set: { val in
            if let index = environments.firstIndex(where: { env in
              env.id == row.id
            }) {
              environments[index].value = val
            }
          }
          TextEditor(text: binding)
        }
      }
      
      HStack {
        Button("Cancel") {
          self.presented = false
        }
        .keyboardShortcut(.cancelAction)
        
        Spacer()
        
        Button("Save") {
          self.presented = false
        }
        .keyboardShortcut(KeyEquivalent.return, modifiers: .command)
      }
      .padding()
    }
    .frame(width: 400, height: 300)
  }
}

struct EnvironmentEditor_Previews: PreviewProvider {
  static var previews: some View {
    EnvironmentEditor(presented: .constant(true), environments: .constant(mockProject.environments))
  }
}
