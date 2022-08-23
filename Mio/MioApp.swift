//
//  MioApp.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import SwiftUI

@main
struct MioApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView().environmentObject(Store.shared)
    }
  }
}
