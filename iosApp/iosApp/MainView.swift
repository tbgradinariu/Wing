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
    @Namespace private var namespace

    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
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
            
            HStack {
                ForEach(TabItemEnum.allCases, id: \.self) { item in
                    CustomTabItemView(tabItem: item, selectedItem: $selectedTab, namespace: namespace)
                }
            }
            .background(Color.darkBlue)
            .frame(height: 40)
            .ignoresSafeArea(.all)
        }
    }
}

struct CustomTabItemView: View {
    var tabItem: TabItemEnum
    @Binding var selectedItem: Int
    let namespace: Namespace.ID

    var body: some View {
        VStack {
            Group {
                if selectedItem == tabItem.rawValue {
                    Color.purple.opacity(0.7)
                        .frame(height: 2)
                        .matchedGeometryEffect(id: "overline",
                                               in: namespace)
                        .padding(.horizontal, 6)
                } else {
                    Color.clear
                        .frame(height: 2.0)
                }
            }
            Image(systemName: tabItem.iconName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(selectedItem == tabItem.rawValue ? .light : .lightGray)
                .frame(width: 20, height: 20)
            Text(tabItem.title)
                .sanFranciscoProFont(selectedItem == tabItem.rawValue ? .semibold : .light)
                .foregroundColor(selectedItem == tabItem.rawValue ? .light : .lightGray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .animation(.linear(duration: 0.3), value: selectedItem)
        .onTapGesture {
            selectedItem = tabItem.rawValue
        }
    }
}

#Preview {
    MainView()
}
