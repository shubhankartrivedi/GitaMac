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
                }.collapsible(false)
                
                Section("Developer"){
                    ForEach(GroupSection.developer) { selection in
                        Label(selection.displayName, systemImage: selection.iconName)
                            .tag(selection)
                    }
                    Button(action:Redirect){
                        Label(
                            title: { Text(verbatim: "Github") },
                            icon: { Image(systemName: "curlybraces") }
                        )
                    }.buttonStyle(.plain)
                        
                    }
                }
                
            
            
                
        }

        
    }
}
func Redirect(){
    if let url = URL(string: "https://github.com/shubhankartrivedi/GitaMac") {
    #if os(iOS)
        UIApplication.shared.open(url)
    #endif
    #if os(macOS)
        NSWorkspace.shared.open(url)
    #endif
    }
 
}
#Preview {
    SidebarView(selection: .constant(.sandbox))
        .listStyle(.sidebar)
}
