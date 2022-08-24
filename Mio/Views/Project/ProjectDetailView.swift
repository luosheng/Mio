//
//  ProjectDetailView.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/24.
//

import SwiftUI

struct ProjectDetailView: View {
  @Binding var presented: Bool
  
  var body: some View {
    VStack {
      Text("Project")
        .font(.title)
        .padding()
      Form {
        TextField("Name", text: .constant(""))
        PathChooser(titleKey: "Working Directory", text: .constant("")) { panel in
          panel.title = "Choose working directoy"
          panel.canChooseDirectories = true
        }
      }
      .padding()
      
      Spacer()
      Divider()
      
      HStack {
        Button("Cancel") {
          self.presented = false
        }
        Spacer()
        Button("Save") {
          
        }
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
