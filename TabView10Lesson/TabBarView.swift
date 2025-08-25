//
//  TabBarView.swift
//  TabView10Lesson
//
//  Created by Авазбек Надырбек уулу on 19.08.25.
//

import SwiftUI

enum AppTab: String, CaseIterable { // Enum for tabs—type-safe!
    case home = "house"
    case profile = "person"
    case settings = "gear"
}

struct TabBarView: View {
    @State private var selectedTab: AppTab = .home // Tracks current tab
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(selectedTab: $selectedTab)
                .tabItem { Label("Home", systemImage: AppTab.home.rawValue) }
                .tag(AppTab.home) // Tags match enum
            
            ProfileView()
                .tabItem { Label("Profile", systemImage: AppTab.profile.rawValue) }
                .tag(AppTab.profile)
            
            SettingsView()
                .tabItem { Label("Settings", systemImage: AppTab.settings.rawValue) }
                .tag(AppTab.settings)
                .badge(3) // Optional: Shows a red badge (e.g., notifications)
        }
    }
}

struct HomeView: View {
    @Binding var selectedTab: AppTab
    
    var body: some View {
        VStack {
            Text("Home Screen")
                .font(.title)
            Button("Jump to Settings") {
                selectedTab = .settings // Programmatic switch!
            }
        }
    }
}

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Your Profile")
                .font(.title)
        }
    }
}

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("App Settings")
                .font(.title)
        }
    }
}

#Preview {
    TabBarView()
}
