//
//  SettingsView.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/25.
//

import SwiftUI

struct SettingsView: View {
  var body: some View {
    TabView {
      SettingGeneralView()
        .tabItem {
          Label("General", systemImage: "gearshape")
        }
        .tag(0)
        .frame(width: 400, height: 300)
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
