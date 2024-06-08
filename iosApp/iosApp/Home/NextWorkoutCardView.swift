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
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Next planned workout")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.top, 4)
            if let workout = viewModel.workout {
                VStack(alignment: .leading) {
                    Text(workout.name)
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .padding(.bottom)
                    ForEach(workout.exercises, id: \.self) { exercise in
                        VStack(alignment: .leading) {
                            Text("\(exercise.name)")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                            ForEach(exercise.sets, id: \.id) { set in
                                Text("\(set.weight.decimals(0)) kg x \(set.reps) reps")
                                    .font(.system(size: 12))
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.bottom, 4)
                    }
                }
            } else {
                Text("There's no upcoming workout")
            }
            Button(action: startWorkout) {
                Text("Start workout")
                    .foregroundColor(.white)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 45)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
                .padding()
        }
        .padding(.leading)
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
