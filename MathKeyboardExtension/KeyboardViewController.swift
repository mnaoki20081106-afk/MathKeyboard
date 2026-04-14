import KeyboardKit
import SwiftUI

class KeyboardViewController: KeyboardInputViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup(with: self) { controller in
            controller.services.layoutProvider = MathKeyboardLayoutProvider(keyboardContext: controller.state.keyboardContext)
            controller.services.actionHandler = CustomKeyboardActionHandler(inputViewController: controller)
            
            // スペースキー長押しでのカーソル移動をオン
            controller.state.keyboardContext.isSpaceDragGestureEnabled = true
        }
    }

    override func viewWillSetupKeyboardView() {
        setupKeyboardView {
            KeyboardView(controller: $0) {
                // カスタムボタンの見た目設定
                $0.buttonContent = { item in
                    switch item.action {
                    case .character(let char):
                        // 特定の数学記号を少し小さめ（callout）のフォントで表示
                        let specialChars = ["dx", "dy", "dt", "sin", "cos", "tan", "log", "ln", "lim", "∞"]
                        if specialChars.contains(char) {
                            return AnyView(Text(char).font(.callout))
                        }
                        return nil
                        
                    case .keyboardType(let type):
                        // 「切替」ボタンのテキスト設定
                        if type == .numeric || type == .alphabetic {
                            return AnyView(Text("切替").font(.body))
                        }
                        return nil
                        
                    default:
                        return nil
                    }
                }
            }
        }
    }
}
