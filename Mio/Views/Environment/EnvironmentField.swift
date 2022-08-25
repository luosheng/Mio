//
//  EnvironmentEditor.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/25.
//

import SwiftUI

struct EnvironmentField: View {
  @Binding var text: String
  
  var body: some View {
    VStack {
      HStack {
        TextField("Environments", text: $text)
        Button {
          
        } label: {
          Image(systemName: "square.and.pencil")
        }
      }
      Text("Environments are separated by semicolons")
        .font(.footnote)
    }
  }
}

struct EnvironmentEditor_Previews: PreviewProvider {
  static var previews: some View {
    EnvironmentField(text: .constant("A=B;C=D"))
  }
}
