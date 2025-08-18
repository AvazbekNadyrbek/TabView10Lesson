//
//  ContentView.swift
//  TabView10Lesson
//
//  Created by Авазбек Надырбек уулу on 18.08.25.
//

import SwiftUI

struct ContentView: View {
    
    @State var page: String = "settings"
    
    var pages: [String] = ["home", "profile", "settings"]
    
    init() {
        UITabBar.appearance().isHidden = true
    }
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
                
                //
                ForEach(pages,id: \.self) { page in
                    TabBarItem(page: $page, image: page)
                }
                
//                // 1
//                Button {
//                    page = "home"
//                } label: {
//                    HStack {
//                        Image(systemName: "house")
//                        Text("Home")
//                        if page == "house" {
//                            Circle()
//                                .fill(Color.green)
//                                .frame(width: 8, height: 8)
//                        }
//                    }
//                }
//                
//                //2
//                Button {
//                    page = "profile"
//                } label: {
//                    HStack {
//                        Image(systemName: "person")
//                        Text("Second")
//                        if page == "profile" {
//                            Circle()
//                                .fill(Color.green)
//                                .frame(width: 8, height: 8)
//                        }
//                    }
//                }
//                
//                //3
//                Button {
//                    page = "settings"
//                } label: {
//                    HStack {
//                        Image(systemName: "plus")
//                        Text("Home")
//                        if page == "settings" {
//                            Circle()
//                                .fill(Color.green)
//                                .frame(width: 8, height: 8)
//                        }
//                    }
//                }

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

struct TabBarItem: View {
    
    @Binding var page: String
    var image: String
    var body: some View {
        Button {
            page = image
        } label: {
            HStack {
                Image(systemName: image)
                Text(image)
                if page == image {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 8, height: 8)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
