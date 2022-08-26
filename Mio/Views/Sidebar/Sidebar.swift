//
//  Sidebar.swift
//  Mio
//
//  Created by Luo Sheng on 2022/8/23.
//

import SwiftUI

struct Sidebar: View {
  @EnvironmentObject var store: Store
  @State private var presentingAddProject = false
  
  var body: some View {
    VStack {
      List {
        ForEach(store.projects) { p in
          NavigationLink(tag: p, selection: $store.selectedProject, destination: {
            ProjectView(project: p)
          }, label: {
            SidebarItem(project: p)
          })
          .contextMenu {
            SidebarItemContextMenuView(project: p)
          }
        }
        .onMove { indexSet, index in
          store.moveProject(from: indexSet, to: index)
        }
      }
      
      HStack {
        Button {
          presentingAddProject = true
        } label: {
          Image(systemName: "plus")
        }
        .frame(width: 16, height: 16)
        .buttonStyle(.plain)
        .padding(8)
        
        Spacer()
        
        Button {
          
        } label: {
          Image(systemName: "minus")
        }
        .disabled(store.selectedProject == nil)
        .frame(width: 16, height: 16)
        .buttonStyle(.plain)
        .padding(8)
      }
      .overlay(Divider(), alignment: .top)
    }
    .toolbar {
      ToolbarItem(placement: .status) {
        Button(action: {
          NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
        }) {
          Image(systemName: "sidebar.squares.leading")
        }
      }
    }
    .sheet(isPresented: $presentingAddProject) {
      ProjectDetailView(presented: $presentingAddProject)
    }
  }
}

struct Sidebar_Previews: PreviewProvider {
  static var previews: some View {
    Sidebar().environmentObject(mockStore)
  }
}
