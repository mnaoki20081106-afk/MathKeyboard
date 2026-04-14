import KeyboardKit

class CustomKeyboardActionHandler: StandardKeyboardActionHandler {

    override func handle(_ gesture: Keyboard.Gesture, on action: KeyboardAction) {
        switch gesture {
        case .flickUp:
            handleFlickUp(on: action)
        case .flickDown:
            handleFlickDown(on: action)
        default:
            super.handle(gesture, on: action)
        }
    }

    private func handleFlickUp(on action: KeyboardAction) {
        guard let textDocumentProxy = inputViewController?.textDocumentProxy else { return }

        switch action {
        case .character(let char):
            switch char {
            // 数字（上付き）
            case "1": textDocumentProxy.insertText("¹")
            case "2": textDocumentProxy.insertText("²")
            case "3": textDocumentProxy.insertText("³")
            case "4": textDocumentProxy.insertText("⁴")
            case "5": textDocumentProxy.insertText("⁵")
            case "6": textDocumentProxy.insertText("⁶")
            case "7": textDocumentProxy.insertText("⁷")
            case "8": textDocumentProxy.insertText("⁸")
            case "9": textDocumentProxy.insertText("⁹")
            case "0": textDocumentProxy.insertText("⁰")
            // 記号
            case "=": textDocumentProxy.insertText("≠")
            case "<": textDocumentProxy.insertText("≤")
            case ">": textDocumentProxy.insertText("≥")
            case "+": textDocumentProxy.insertText("⁺")
            case "-": textDocumentProxy.insertText("⁻")
            // アルファベット（上付き）
            case "a": textDocumentProxy.insertText("ᵃ")
            case "b": textDocumentProxy.insertText("ᵇ")
            case "c": textDocumentProxy.insertText("ᶜ")
            case "d": textDocumentProxy.insertText("ᵈ")
            case "e": textDocumentProxy.insertText("ᵉ")
            case "f": textDocumentProxy.insertText("ᶠ")
            case "g": textDocumentProxy.insertText("ᵍ")
            case "h": textDocumentProxy.insertText("ʰ")
            case "i": textDocumentProxy.insertText("ⁱ")
            case "j": textDocumentProxy.insertText("ʲ")
            case "k": textDocumentProxy.insertText("ᵏ")
            case "l": textDocumentProxy.insertText("ˡ")
            case "m": textDocumentProxy.insertText("ᵐ")
            case "n": textDocumentProxy.insertText("ⁿ")
            case "o": textDocumentProxy.insertText("ᵒ")
            case "p": textDocumentProxy.insertText("ᵖ")
            case "q": textDocumentProxy.insertText("۹") // qの上付きは標準フォントに無いため代用
            case "r": textDocumentProxy.insertText("ʳ")
            case "s": textDocumentProxy.insertText("ˢ")
            case "t": textDocumentProxy.insertText("ᵗ")
            case "u": textDocumentProxy.insertText("ᵘ")
            case "v": textDocumentProxy.insertText("ᵛ")
            case "w": textDocumentProxy.insertText("ʷ")
            case "x": textDocumentProxy.insertText("ˣ")
            case "y": textDocumentProxy.insertText("ʸ")
            case "z": textDocumentProxy.insertText("ᶻ")
            default: super.handle(gesture, on: action)
            }
        default:
            super.handle(gesture, on: action)
        }
    }

    private func handleFlickDown(on action: KeyboardAction) {
        guard let textDocumentProxy = inputViewController?.textDocumentProxy else { return }

        switch action {
        case .character(let char):
            switch char {
            // 数字（下付き）
            case "1": textDocumentProxy.insertText("₁")
            case "2": textDocumentProxy.insertText("₂")
            case "3": textDocumentProxy.insertText("₃")
            case "4": textDocumentProxy.insertText("₄")
            case "5": textDocumentProxy.insertText("₅")
            case "6": textDocumentProxy.insertText("₆")
            case "7": textDocumentProxy.insertText("₇")
            case "8": textDocumentProxy.insertText("₈")
            case "9": textDocumentProxy.insertText("₉")
            case "0": textDocumentProxy.insertText("₀")
            default: super.handle(gesture, on: action)
            }
        default:
            super.handle(gesture, on: action)
        }
    }
}
