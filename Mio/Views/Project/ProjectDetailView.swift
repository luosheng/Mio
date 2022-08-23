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
      Text("Hello, World!")
      Divider()
      Button("Cancel") {
        self.presented = false
      }
    }
  }
}

struct ProjectDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ProjectDetailView(presented: .constant(true))
  }
}
