//
//  TabItemEnum.swift
//  iosApp
//
//  Created by Tiberiu Gradinariu on 2024-06-02.
//  Copyright © 2024 orgName. All rights reserved.
//

import Foundation

enum TabItemEnum: Int, CaseIterable {
    case home = 0
    case plan
    case progress
    case settings
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .plan:
            return "Plan"
        case .progress:
            return "Progress"
        case .settings:
            return "Settings"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:
            return "person.fill"
        case .plan:
            return "calendar.circle"
        case .progress:
            return "chart.bar.fill"
        case .settings:
            return "gearshape.fill"
        }
    }
}
