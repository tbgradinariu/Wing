//
//  WorkoutModel.swift
//  iosApp
//
//  Created by Tiberiu Gradinariu on 2024-06-02.
//  Copyright © 2024 orgName. All rights reserved.
//

import Foundation

struct Workout {
    var name: String
    var exercises: [Exercise]
}

struct Exercise {
    var name: String
    var sets: [Set]
}

struct Set {
    var weight: Int
    var reps: Int
}
