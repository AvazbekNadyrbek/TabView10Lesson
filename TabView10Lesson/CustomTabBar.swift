//
//  CustomTabBar.swift
//  TabView10Lesson
//  Created by Авазбек Надырбек уулу on 19.08.25.
//

import SwiftUI

enum CustomTabBar: String, CaseIterable {
    case home = "house.fill"
    case profile = "person.fill"
    case settings = "gearshape.fill"
}

struct CustomTabView: View {
    @State private var selectedTab: CustomTabBar = .home
    
    var body: some View {
        VStack(spacing: 0) {
            // Content area
            Group {
                switch selectedTab {
                case .home: HomeView1()
                case .profile: ProfileView()
                case .settings: SettingsView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // Custom Tab Bar
            HStack {
                ForEach(CustomTabBar.allCases, id: \.self) { tab in
                    Button {
                        withAnimation(.spring()) {
                            selectedTab = tab
                        }
                    } label: {
                        VStack {
                            Image(systemName: tab.rawValue)
                                .font(.title2)
                                .foregroundColor(selectedTab == tab ? .blue : .gray)
                            Text(tab.rawValue.components(separatedBy: ".").first?.capitalized ?? "")
                                .font(.caption)
                                .foregroundColor(selectedTab == tab ? .blue : .gray)
                        }
                        .scaleEffect(selectedTab == tab ? 1.2 : 1.0)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding()
            .background(Color.white)
            .shadow(radius: 5)
        }
        .ignoresSafeArea(edges: .bottom) // For full-screen feel
    }
}

struct HomeView1: View {
    
    var body: some View {
        VStack {
            Text("Home Screen")
                .font(.title)
            Button("Jump to Settings") {
                
            }
        }
    }
}


#Preview {
    CustomTabView()
}