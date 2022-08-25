//
//  ContentView.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      Sidebar()
    }
    .preferredColorScheme(.dark)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environmentObject(mockStore)
  }
}
