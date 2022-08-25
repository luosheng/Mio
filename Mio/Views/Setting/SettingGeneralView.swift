//
//  SettingGeneralView.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/25.
//

import SwiftUI

struct SettingGeneralView: View {
  @EnvironmentObject var pref: Preferences
  
  var body: some View {
    VStack {
      Form {
        Picker("Theme", selection: $pref.appearance) {
          Text("Match System").tag(Appearance.system)
          Text("Dark theme").tag(Appearance.dark)
          Text("Light theme").tag(Appearance.light)
        }
      }
      Spacer()
    }
    .tabItem {
      Label("General", systemImage: "gearshape")
    }
    .tag(0)
    .frame(width: 400, height: 300)
    .padding()
  }
}

struct SettingGeneralView_Previews: PreviewProvider {
  static var previews: some View {
    SettingGeneralView().environmentObject(Preferences())
  }
}
