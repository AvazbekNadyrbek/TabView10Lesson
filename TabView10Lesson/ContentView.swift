//
//  ContentView.swift
//  TabView10Lesson
//
//  Created by Авазбек Надырбек уулу on 18.08.25.
//

import SwiftUI

struct ContentView: View {
    
    @State var page: String = "settings"
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            TabView(selection: $page) {
                Text("Home")
                    .tag("home")
                Text("Profile")
                    .tag("profile")
                SettingsPage(page: $page)
                    .tag("settings")
            }
            HStack {
                // 1
                Button {
                    page = "home"
                } label: {
                    HStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
                
                //2
                Button {
                    page = "profile"
                } label: {
                    HStack {
                        Image(systemName: "house")
                        Text("Second")
                    }
                }
                
                //3
                Button {
                    page = "settings"
                } label: {
                    HStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }

            }
            .padding()
            .background(Color.gray.opacity(0.5))
            .padding(.bottom, 1)
        }
        
    }
}

struct SettingsPage: View {
    
    @Binding var page: String
    var body: some View {
        VStack {
            Text("Settings")
            Button {
                page = "home"
            } label: {
                Text("Save")
            }

        }
    }
}

#Preview {
    ContentView()
}
