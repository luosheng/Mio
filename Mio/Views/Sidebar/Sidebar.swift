//
//  Sidebar.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import SwiftUI

struct Sidebar: View {
  @EnvironmentObject var store: Store
  
  var body: some View {
    List {
      ForEach(store.projects) { p in
        NavigationLink(destination: ProjectView(project: p)) {
          SidebarItem(project: p)
        }
      }
    }
  }
}

struct Sidebar_Previews: PreviewProvider {
  static var previews: some View {
    Sidebar().environmentObject(mockStore)
  }
}
