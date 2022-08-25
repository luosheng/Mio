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
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
