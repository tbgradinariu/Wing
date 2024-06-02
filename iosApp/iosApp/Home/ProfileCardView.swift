//
//  ProfileCardView.swift
//  iosApp
//
//  Created by Tiberiu Gradinariu on 2024-06-02.
//  Copyright © 2024 orgName. All rights reserved.
//

import Foundation
import SwiftUI

struct ProfileCardView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .cornerRadius(20)
                .clipped()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 1)
                )
            VStack(alignment: .leading) {
                Text("Favorite exercise: Squat")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                Text("One rep max: 40kg")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}
