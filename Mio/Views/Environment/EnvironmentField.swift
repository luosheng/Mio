//
//  EnvironmentEditor.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/25.
//

import SwiftUI

struct EnvironmentField: View {
  @Binding var environments: [ProjectEnv]
  @State var showEnvEditor = false
  
  var body: some View {
    let text = Binding {
      ProjectEnv.toString(envs: self.environments)
    } set: { str in
      self.environments = ProjectEnv.parse(str: str)
    }
    
    return VStack {
      HStack {
        TextField("Environments", text: text)
        Button {
          showEnvEditor = true
        } label: {
          Image(systemName: "square.and.pencil")
        }
      }
      Text("Environments are separated by semicolons")
        .font(.footnote)
    }
    .sheet(isPresented: $showEnvEditor) {
      EnvironmentEditor(presented: $showEnvEditor, environments: $environments)
    }
  }
}

struct EnvironmentField_Previews: PreviewProvider {
  static var previews: some View {
    EnvironmentField(environments: .constant([ProjectEnv(name: "NODE_ENV", value: "production")]))
  }
}
