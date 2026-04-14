import SwiftUI

@main
struct MathKeyboardApp: App {
var body: some Scene {
WindowGroup {
ContentView()
}
}
}

struct ContentView: View {
var body: some View {
VStack(spacing: 20) {
Image(systemName: “function”)
.imageScale(.large)
.font(.system(size: 60))
.foregroundColor(.blue)
Text(“Math Keyboard”)
.font(.title)
.bold()
Text(“設定 → 一般 → キーボード → キーボードの追加\nから Math Keyboard を追加してください”)
.multilineTextAlignment(.center)
.foregroundColor(.secondary)
.padding(.horizontal)
}
.padding()
}
}