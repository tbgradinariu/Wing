//
//  Exercise+Color.swift
//  iosApp
//
//  Created by Tiberiu Gradinariu on 2024-06-09.
//  Copyright © 2024 orgName. All rights reserved.
//

import SwiftUI
import Shared

extension Exercise {
    var color: Color {
        switch self.name {
        case "Squat":
            return Color.lightGreen
        case "Pull-ups":
            return Color.lightBlue
        case "Calf raises":
            return Color.lightOrange
        case "Barbell rows":
            return Color.darkRed
        default:
            return Color.lightGreen
        }
    }
    
}
