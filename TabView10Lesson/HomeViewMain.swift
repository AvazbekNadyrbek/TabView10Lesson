//
//  HomeViewMain.swift
//  TabView10Lesson
//
//  Created by Авазбек Надырбек уулу on 23.08.25.
//

import SwiftUI

enum CardType {
    case blue
    case dark
}

struct HomeViewMain: View {
    var body: some View {
        ZStack(alignment: .top) {
            HStack {
                Button {
                    
                } label: {
                    Image(.menuIcon)
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(.avatarImg)
                        .resizable()
                        .frame(width: 34, height: 34)
                }

            }
            .padding(.horizontal, 30)
            .background(.appBackground)
            .zIndex(2)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 40) {
                    HStack(alignment: .bottom) {
                        Text("Manage \nyour tasks")
                            .font(.system(size: 56))
                            .foregroundStyle(.white)
                        Image(.pencilImg)
                            .resizable()
                            .frame(width: 38, height: 38)
                            .padding(.bottom, 10)
                    }
                    CardView(type: .blue)
                    CardView(type: .dark)
                    CardView(type: .blue)
                }
                .padding(.top, 35)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(.appBackground)
    }
}

struct CardView: View {
    
    var type: CardType
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("Hight")
                    .font(.system(size: 13))
                    .foregroundStyle(type == .blue ? .black : .white)
                    .padding(.vertical,7)
                    .padding(.horizontal, 20)
                    .background(type == .blue ? .white : .appLightGrey)
                    .clipShape(Capsule())
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(type == .blue ? .black : .white)
                        .frame(width: 15, height: 15)
                        .padding(8)
                        .background(type == .blue ? .white : .appLightGrey)
                        .clipShape(Capsule())
                    
                }

            }
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting")
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundStyle(type == .blue ? .black : .white)
            HStack {
                Image(systemName: "calendar.badge.clock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14, height: 14)
                Text("20 march")
                    .font(.system(size: 12, weight: .regular, design: .default))
            }
            .foregroundStyle(type == .blue ? .appGrey : .white)
            HStack {
                Image(.avatarImg)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .clipShape(Circle())
                
                Spacer()
                HStack {
                    HStack {
                        Image(systemName: "message.badge.fill")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text("4")
                            .font(.system(size: 12, weight: .regular, design: .default))
                    }
                    HStack {
                        Image(systemName: "paperclip")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text("16")
                            .font(.system(size: 12, weight: .regular, design: .default))
                    }
                }
                .foregroundStyle(type == .blue ? .appGrey : .white)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 14)
        .padding(.horizontal, 16)
        .background( type == .blue ? .appBlue : .appGrey )
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    HomeViewMain()
}
