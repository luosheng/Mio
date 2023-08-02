//
//  ContentView.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var pref: Preferences

  var body: some View {
    NavigationSplitView {
      Sidebar()
    } detail: {
      
    }
    .preferredColorScheme(pref.appearance.toColorScheme())
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environmentObject(mockStore)
  }
}
