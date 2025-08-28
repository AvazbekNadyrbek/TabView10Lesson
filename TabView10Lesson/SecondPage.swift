//
//  SecondPage.swift
//  TabView10Lesson
//
//  Created by Авазбек Надырбек уулу on 27.08.25.
//

import SwiftUI

private enum CardStyle: CaseIterable {
    case blue
    case green

    var background: Color {
        switch self {
        case .blue: return .cardminiBlue
        case .green: return .cardminiGreen
        }
    }

    var textColor: Color {
        switch self {
        case .blue: return .black
        case .green: return .white
        }
    }

    var secondaryTextColor: Color {
        switch self {
        case .blue: return .appGrey
        case .green: return .white.opacity(0.85)
        }
    }
}

private enum Metrics {
    static let pageHorizontal: CGFloat = 20
    static let headerHeight: CGFloat = 56
    static let miniCardSize: CGSize = .init(width: 171, height: 171)
    static let iconSize: CGFloat = 16
    static let headerAvatarSize: CGFloat = 48
    static let miniAvatarSize: CGFloat = 38
}

struct SecondPage: View {
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .center, spacing: 40) {
                    // Mini cards row
                    HStack(spacing: 20) {
                        MiniCard(style: .blue)
                        MiniCard(style: .green)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 16)

                    // Big card
                    BigCardView(style: .blue)
                }
                .padding(.horizontal, Metrics.pageHorizontal)
            }
        }
        .safeAreaInset(edge: .top) {
            TopBar()
                .frame(height: Metrics.headerHeight)
                .frame(maxWidth: .infinity)
                .background(.appBackground)
        }
    }
}

private struct TopBar: View {
    var body: some View {
        HStack(spacing: 20) {
            Button {
                // TODO: avatar action
            } label: {
                Image(.imgSecond)
                    .resizable()
                    .scaledToFill()
                    .frame(width: Metrics.headerAvatarSize, height: Metrics.headerAvatarSize)
                    .clipShape(Circle())
                    .accessibilityLabel("Open profile")
            }

            Text("UserName")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.white)

            Spacer()

            Button {
                // TODO: menu action
            } label: {
                // If you have a raster asset named menuIcon this is fine.
                // If not, consider using an SFSymbol like "line.3.horizontal".
                Image(.menuIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .accessibilityLabel("Open menu")
            }
            .padding(.vertical, 8) // improve hit target
            .padding(.horizontal, 8)
        }
        .padding(.horizontal, Metrics.pageHorizontal)
    }
}

private struct MiniCard: View {
    let style: CardStyle

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Image(.imgSecond2)
                    .resizable()
                    .scaledToFill()
                    .frame(width: Metrics.miniAvatarSize, height: Metrics.miniAvatarSize)
                    .clipShape(RoundedRectangle(cornerRadius: 8))

                VStack(alignment: .leading, spacing: 2) {
                    Text("User Name")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(style.textColor)

                    HStack(spacing: 6) {
                        Image(systemName: "calendar.badge.clock")
                            .font(.system(size: 12, weight: .medium))
                        Text("30 May")
                            .font(.system(size: 12))
                    }
                    .foregroundStyle(style.textColor.opacity(0.9))
                }
            }

            Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod")
                .font(.system(size: 12))
                .foregroundStyle(style.textColor)

            Button {
                // TODO: comment action
            } label: {
                Text("comment")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 36)
                    .background(.black)
                    .clipShape(Capsule())
                    .accessibilityLabel("Comment on post")
            }
            .padding(.top, 6)
        }
        .padding(10)
        .frame(width: Metrics.miniCardSize.width, height: Metrics.miniCardSize.height)
        .background(style.background)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

private struct BigCardView: View {
    let style: CardStyle

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Image(.avatarImg)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .clipShape(Circle())

                Spacer()

                HStack(spacing: 12) {
                    HStack(spacing: 4) {
                        Image(systemName: "message.badge.fill")
                            .font(.system(size: Metrics.iconSize, weight: .semibold))
                        Text("4")
                            .font(.system(size: 12))
                    }

                    HStack(spacing: 4) {
                        Image(systemName: "paperclip")
                            .font(.system(size: Metrics.iconSize, weight: .semibold))
                        Text("16")
                            .font(.system(size: 12))
                    }
                }
                .foregroundStyle(style.secondaryTextColor)
            }
            .padding(.top, 6)
            .padding(.horizontal, 10)

            Image(.imgSecond3)
                .resizable()
                .scaledToFit()
                .accessibilityHidden(true)
                .padding(.top, 4)

            HStack(alignment: .bottom){
                Button {
                    // TODO: like
                } label: {
                    Image(systemName: "heart")
                        .font(.system(size: Metrics.iconSize, weight: .semibold))
                        .accessibilityLabel("Like")
                }

                Button {
                    // TODO: share
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: Metrics.iconSize, weight: .semibold))
                        .scaledToFill()
                        .accessibilityLabel("Share")
                }

                Spacer()

                Button {
                    // TODO: delete
                } label: {
                    Image(systemName: "trash")
                        .font(.system(size: Metrics.iconSize, weight: .semibold))
                        .accessibilityLabel("Delete")
                        .foregroundStyle(.red)
                }
            }
            .foregroundStyle(style.textColor)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
        }
        .padding(5)
        .background(style.background)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    SecondPage()
}
