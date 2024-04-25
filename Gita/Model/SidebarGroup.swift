//
//  SidebarGroup.swift
//  Gita
//
//  Created by Shubhankar Trivedi on 25/04/24.
//

import Foundation

struct SidebarGroup: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let iconName: String
    
    init(title: String, iconName: String) {
        self.title = title
        self.iconName = iconName
    }
    
    
    
    
}
