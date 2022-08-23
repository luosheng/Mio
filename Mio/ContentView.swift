//
//  ContentView.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var store: Store
  
  var body: some View {
    NavigationView {
      Sidebar().environmentObject(store)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environmentObject(mockStore)
  }
}
