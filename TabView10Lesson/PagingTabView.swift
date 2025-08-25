//
//  PagingTabView.swift
//  TabView10Lesson
//
//  Created by Авазбек Надырбек уулу on 19.08.25.
//

import SwiftUI

struct PagingTabView: View {
    var body: some View {
        TabView {
            Color.red
                .tabItem { Text("Red") } // Still uses tabItem, but hidden in page style
            
            Color.green
                .tabItem { Text("Green") }
            
            Color.blue
                .tabItem { Text("Blue") }
        }
        .tabViewStyle(.page(indexDisplayMode: .always)) // Enables swipe + dots
        .indexViewStyle(.page(backgroundDisplayMode: .always)) // Custom dots
    }
}

#Preview {
    PagingTabView()
}
