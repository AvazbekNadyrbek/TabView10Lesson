# TabView10Lesson

Custom Tab Bar built with SwiftUI  
Homework Part 1 – Completed ✅

## 📱 Overview
TabView10Lesson demonstrates how to hide the system `UITabBar`, build a **fully-custom bottom tab bar**, and present a **modal sheet** from the center “plus” button.  
The project is the first part of my UIKit → SwiftUI homework series.

<p align="center">
  <img src="Docs/screenshot_1.png" width="300">
  <img src="Docs/screenshot_2.png" width="300">
</p>

## ✨ Features
| Feature | Implementation |
|---------|----------------|
| Custom tab bar | Replaces the default `UITabBar` by calling `UITabBar.appearance().isHidden = true` and overlaying a SwiftUI `HStack`. |
| Dynamic icons | Shows the `.fill` variant for the currently-selected page. |
| Center action button | A circular **plus** button that toggles a sheet instead of switching pages. |
| Sheet with detents | Presents `MockDataView()` using `.presentationDetents([.height(150), .height(300)])`. |
| Page navigation | Five pages handled with a `@State` string tag and `TabView(selection:)`. |
| Programmatic navigation | The Settings screen can programmatically switch back to **Home**. |

## 🗂 File Structure

TabView10Lesson/
 ├─ TabView10LessonApp.swift   // App entry point
 ├─ ContentView.swift          // Hosts TabView and custom tab bar
 ├─ HomeViewMain.swift         // (Stub) Home screen
 ├─ SettingsPage.swift         // Settings with “Save” button
 ├─ MockDataView.swift         // Bottom-sheet content
 └─ Assets.xcassets            // Color + icon assets

## 🚀 Getting Started
1. Clone the repo  
   `git clone https://github.com/<your-username>/TabView10Lesson.git`
2. Open `TabView10Lesson.xcodeproj` in Xcode 15+
3. Run on iOS 17 simulator or device

## 🛣 Roadmap (Homework Part 2+)
- Add `HomeViewMain`, `Folder`, and `Message` real content
- Animate tab bar icon transitions
- Support dark mode colors
- Localize to RU 🇷🇺 / EN 🇺🇸
- Unit/UI tests for navigation logic
  
<img width="1138" height="881" alt="Screenshot 2025-08-25 at 09 04 18" src="https://github.com/user-attachments/assets/243968a1-6b7e-45e9-bb9e-f0d9f3ecbaa2" />

## 💡 Lessons Learned
- How to **fully replace** UIKit components in SwiftUI
- Managing state with `@State` & `@Binding`
- Using **semantic SF Symbols** (`house`, `house.fill`, etc.)
- Presenting custom-height sheets with `presentationDetents`

- 

## 📄 License
MIT
