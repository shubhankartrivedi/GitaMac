//
//  SidebarView.swift
//  Gita
//
//  Created by Shubhankar Trivedi on 25/04/24.
//

import SwiftUI

struct SidebarView: View {
    @Binding var selection: GroupSection?
    var body: some View {
        VStack(alignment: .leading){
            List(selection: $selection) {
                Section("User"){
                    ForEach(GroupSection.user) { selection in
                        Label(selection.displayName, systemImage: selection.iconName)
                            .tag(selection)
                    }
                }
                
                Section("Developer"){
                    ForEach(GroupSection.developer) { selection in
                        Label(selection.displayName, systemImage: selection.iconName)
                            .tag(selection)
                    }
                }
            }
                
        }
        .navigationTitle(selection!.displayName)

        
    }
}

#Preview {
    SidebarView(selection: .constant(.sandbox))
        .listStyle(.sidebar)
}
