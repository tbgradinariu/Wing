//
//  ExerciseCarView.swift
//  iosApp
//
//  Created by Tiberiu Gradinariu on 2024-06-08.
//  Copyright © 2024 orgName. All rights reserved.
//

import SwiftUI
import Shared

struct ExerciseCardView: View {
    var exercise: Exercise
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Triangle(color: exercise.color)
                .fill(exercise.color)
                .frame(width: 20, height: 20)
                .clipped()
            VStack(alignment: .leading, spacing: 0) { Text("\(exercise.name)")
                    .sanFranciscoProFont(.bold)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding(.leading)
                    .foregroundColor(.light)
                
                ForEach(exercise.sets, id: \.id) { set in
                    Text("\(set.weight.decimals(0)) kg x \(set.reps)")
                        .sanFranciscoProFont(.regular, 14)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                        .foregroundColor(.light)
                }
            }
        }
        .padding(.bottom, 4)
        .background(Color.darkGray)
        .cornerRadius(10.0)
    }
}

struct Triangle: Shape {
    var color: Color
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))

        return path
    }
}

@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    let exercise = Exercise(name: "Squat", sets: [
        Set(reps: 10, weight: 20, weightType: WeightType.weighted),
        Set(reps: 10, weight: 30, weightType: WeightType.weighted),
        Set(reps: 8, weight: 40, weightType: WeightType.weighted),
        Set(reps: 8, weight: 50, weightType: WeightType.weighted)
    ])
    return ExerciseCardView(exercise: exercise)
}
