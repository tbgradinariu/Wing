//
//  NextWorkoutCardView.swift
//  iosApp
//
//  Created by Tiberiu Gradinariu on 2024-06-02.
//  Copyright © 2024 orgName. All rights reserved.
//

import SwiftUI
import Shared
import KMPObservableViewModelSwiftUI

struct NextWorkoutCardView: View {
    @StateViewModel var viewModel = NextWorkoutViewModel()
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 120))
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Next planned workout")
                    .sanFranciscoProFont(.medium)
                    .foregroundColor(.light)
                Spacer()
            }
            if let workout = viewModel.workout {
                VStack(alignment: .leading) {
                    Text(workout.name)
                        .sanFranciscoProFont(.medium, 14)
                        .foregroundColor(.light)
                    LazyVGrid(columns: adaptiveColumn, spacing: 8) {
                        ForEach(workout.exercises, id: \.self) { exercise in
                            ExerciseCardView(exercise: exercise)
                        }
                    }
                }
            } else {
                Text("There's no upcoming workout")
            }
            Button(action: startWorkout) {
                Text("Start workout")
                    .foregroundColor(.white)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 45)
                    .background(Color.mediumBlue)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal, 6)
        .onAppear {
            viewModel.getNextWorkout()
        }
    }
    
    func startWorkout() {
        
    }
}

#Preview {
    NextWorkoutCardView()
}
