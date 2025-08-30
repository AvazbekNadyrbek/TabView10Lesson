//
//  ContentView.swift
//  TabView10Lesson
//
//  Created by Авазбек Надырбек уулу on 18.08.25.
//

import SwiftUI

struct ContentView: View {
    
    @State var page: String = "settings"
    @State var isShow: Bool = false
    
    
    var pages: [String] = ["house", "folder", "plus", "message","person"]
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        
        ZStack(alignment: .bottom) {
            TabView(selection: $page) {
                HomeViewMain()
                    .tag("home")
                SecondPage()
                    .tag("folder")
                Text("Plus")
                    .tag("plus")
                Text("Message")
                    .tag("message")
                SettingsPage(page: $page)
                    .tag("person")
            }
            HStack {
                
                ForEach(pages,id: \.self) { page in
                    TabBarItem(page: $page, isShowSheet: $isShow , image: page)
                }
                .frame(maxWidth: .infinity)
            
            }
            .sheet(isPresented: $isShow) {
                MockDataView()
                    .presentationDetents([.height(150), .height(300)])
            }
            .padding()
            .background(.gray)
            .clipShape(Capsule())
           // .padding(.horizontal, 30)
        }
        
    }
}


struct SettingsPage: View {
    @State var isShow: Bool = false
    @Binding var page: String
    var body: some View {
        VStack {
            Text("Settings")
            Button {
                page = "home"
            } label: {
                Text("Save")
            }
            
            Button {
                
            } label: {
                Text("Sheet")
            }

        }
    }
}

struct TabBarItem: View {
    
    @Binding var page: String
    @Binding var isShowSheet: Bool
    var image: String
    var body: some View {
        Button {
            
            if image == "plus" {
                isShowSheet.toggle()
            } else {
                page = image
            }
            
        } label: {
            HStack {
                if image == "plus" {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.white)
                        .overlay {
                            Image(systemName: "plus")
                                .foregroundStyle(.black)
                        }
                } else {
                    Image(systemName: page == image ? "\(image).fill" : image)
                        .foregroundStyle(.white)
                }
                
            }
        }
    }
}

struct MockDataView: View {
    var body: some View {
        Text("MockData")
    }
}

#Preview {
    ContentView()
}
