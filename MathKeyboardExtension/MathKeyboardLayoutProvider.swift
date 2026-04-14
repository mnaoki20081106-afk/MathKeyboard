import KeyboardKit

class MathKeyboardLayoutProvider: StandardKeyboardLayoutProvider {
    
    override func keyboardLayout(for context: KeyboardContext) -> KeyboardLayout {
        // .numeric を記号画面（2枚目）、それ以外をメイン画面（1枚目）として扱います
        let isSymbolMode = context.keyboardType == .numeric
        var itemRows: KeyboardLayoutItemRows = []
        
        if !isSymbolMode {
            // 【1枚目】 メインレイアウト
            let row1 = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"].map { KeyboardAction.character($0) }
            let row2 = ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"].map { KeyboardAction.character($0) }
            let row3 = ["a", "s", "d", "f", "g", "h", "j", "k", "l"].map { KeyboardAction.character($0) }
            // Shift(大文字化)キーとz〜m行
            let row4 = [KeyboardAction.shift(currentCasing: context.shiftState)] + ["z", "x", "c", "v", "b", "n", "m", "'"].map { KeyboardAction.character($0) }
            let row5 = ["+", "-", "×", "÷", "=", "<", ">", "^", "√"].map { KeyboardAction.character($0) }
            let row6 = ["(", ")", "{", "}", "[", "]", "|", "|", "/", "dx", "dy", "dt"].map { KeyboardAction.character($0) }
            // sinなどの関数とDeleteキー
            let row7 = ["sin", "cos", "tan", "log", "ln", "lim", "∞"].map { KeyboardAction.character($0) } + [.backspace]
            // 下段コントロール（切替、スペース、検索）
            let row8: [KeyboardAction] = [.keyboardType(.numeric), .space, .primary(.search)]
            
            let actions = [row1, row2, row3, row4, row5, row6, row7, row8]
            itemRows = actions.map { row in
                row.map { action in
                    KeyboardLayoutItem(action: action, size: .init(width: .available, height: 42), edgeInsets: .init(horizontal: 2, vertical: 4))
                }
            }
        } else {
            // 【2枚目】 記号レイアウト
            let row1 = ["α", "β", "γ", "θ", "λ", "μ", "σ", "π", "Δ"].map { KeyboardAction.character($0) }
            let row2 = ["Σ", "∫", "∂", "∇"].map { KeyboardAction.character($0) }
            let row3 = ["∈", "∉", "∪", "∩", "⊂", "⊃", "⊆", "⊇", "∅"].map { KeyboardAction.character($0) }
            let row4 = ["∠", "△", "⊥", "∥", "°"].map { KeyboardAction.character($0) }
            let row5 = ["⇒", "⇔", "∵", "∴", "≈", "≡"].map { KeyboardAction.character($0) }
            let row6 = ["↑", "↓", "←", "→"].map { KeyboardAction.character($0) }
            // Backspaceのみの行（右寄せにするために幅を調整）
            let row7: [KeyboardAction] = [.backspace]
            let row8: [KeyboardAction] = [.keyboardType(.alphabetic), .space, .primary(.search)]
            
            let actions = [row1, row2, row3, row4, row5, row6, row7, row8]
            itemRows = actions.map { row in
                row.map { action in
                    let width: KeyboardLayoutItemSize.Width = action == .backspace ? .percentage(0.15) : .available
                    return KeyboardLayoutItem(action: action, size: .init(width: width, height: 42), edgeInsets: .init(horizontal: 2, vertical: 4))
                }
            }
        }
        
        return KeyboardLayout(itemRows: itemRows)
    }
}
