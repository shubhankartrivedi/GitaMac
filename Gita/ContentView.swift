//
//  ContentView.swift
//  Gita
//
//  Created by Shubhankar Trivedi on 25/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: GroupSection? = GroupSection.home
    @StateObject var chaptersViewModel = ChaptersViewModel()
    var body: some View {
        NavigationSplitView {
            SidebarView(selection: $selection)
        } detail: {
            Group {
                switch selection {
                case .home:
                    HomeView(viewModel: chaptersViewModel)
                case .sandbox:
                    SandboxView()
                case .settings:
                    SettingsView()
                case .none:
                    Text("Select an Option")
                }
            }
            .navigationTitle(selection?.displayName ?? "Select a Section")
        }
    }
}
#Preview {
    ContentView()
}
