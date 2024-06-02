//
//  MainView.swift
//  iosApp
//
//  Created by Tiberiu Gradinariu on 2024-06-02.
//  Copyright © 2024 orgName. All rights reserved.
//

import Foundation
import SwiftUI

struct MainView: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        TabView {
            HomeView()
                .tag(0)
                .tabItem {
                    Label("Home", systemImage: "person.fill")
                }
            HomeView()
                .tag(1)
                .tabItem {
                    Label("Plan", systemImage: "calendar.circle")
                }
            HomeView()
                .tag(2)
                .tabItem {
                    Label("Progress", systemImage: "chart.bar.fill")
                }
            HomeView()
                .tag(3)
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}

#Preview {
    MainView()
}
