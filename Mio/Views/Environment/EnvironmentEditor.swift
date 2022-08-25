//
//  EnvironmentEditor.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/25.
//

import SwiftUI

struct EnvironmentEditor: View {
  @Binding var environments: [ProjectEnv]
  
  var body: some View {
    VStack {
      Table(environments) {
        TableColumn("Name") { row in
          let binding = Binding {
            row.name
          } set: { val in
            print("new value:", val)
            if let index = environments.firstIndex(where: { env in
              env.id == row.id
            }) {
              environments[index].name = val
            }
          }
          TextEditor(text: binding)
        }
      }
    }
  }
}

struct EnvironmentEditor_Previews: PreviewProvider {
  static var previews: some View {
    EnvironmentEditor(environments: .constant(mockProject.environments))
  }
}
