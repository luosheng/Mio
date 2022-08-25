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
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

struct EnvironmentEditor_Previews: PreviewProvider {
  static var previews: some View {
    EnvironmentEditor(environments: .constant(mockProject.environments))
  }
}
