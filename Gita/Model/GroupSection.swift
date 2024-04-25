//
//  TaskSection.swift
//  TaskManager
//
//  Created by Karin Prater on 21.08.2023.
//

import Foundation

enum GroupSection: Identifiable, CaseIterable, Hashable {
    
    case home
    case sandbox
    case settings
    
    
    var id: String {
        switch self {
        case .home:
            "Home"
        case .sandbox:
            "Sandbox"
        case .settings:
            "Settings"
        }
    }
    
    var displayName: String {
        switch self {
        case .home:
            "Home"
        case .sandbox:
            "Sandbox"
        case .settings:
            "Settings"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:
            "star.fill"
        case .sandbox:
            "testtube.2"
        case .settings:
            "gear"
        }
    }
    
    static var allCases: [GroupSection] {
        [.home, .sandbox, .settings]
    }
    
    static func == (lhs: GroupSection, rhs: GroupSection) -> Bool {
        lhs.id == rhs.id
    }
}
