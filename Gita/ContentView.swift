//
//  ContentView.swift
//  Gita
//
//  Created by Shubhankar Trivedi on 25/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = GroupSection.sandbox
    var body: some View {
        NavigationSplitView {
            SidebarView(selection: $selection)
        } detail: {
            switch selection {
            case .home:
                HomeView()
            case .sandbox:
                SandboxView()
            case .settings:
                SettingsView()
            }
        }.navigationTitle(selection.displayName)
    }
}

#Preview {
    ContentView()
}
