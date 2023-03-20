import UIKit


class ViewController: UIViewController {
    @IBOutlet private weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber = true
    
    private var displayNumber: Double {
        get {
            guard let displayStringValue = displayLabel.text,
                  let displayNumber = Double(displayStringValue) else {
                fatalError("Cannot convert display label text into Double")
            }
            
            return displayNumber
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction private func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        guard let safeCulcButtonTitle = sender.currentTitle else {
            fatalError("Cannot convert sender current title into String")
        }

        switch safeCulcButtonTitle {
            case "AC": displayLabel.text = "0"
            case "+/-": displayNumber *= -1
            case "%": displayNumber /= 100
            default: return
        }
    }
    
    @IBAction private func numButtonPressed(_ sender: UIButton) {
        guard let safeNumButtonTitle = sender.currentTitle,
              let safeDisplayText = displayLabel.text else {
            fatalError("Cannot convert into String")
        }
        
        if isFinishedTypingNumber { //first typed digit of new number
            isFinishedTypingNumber = false
            displayLabel.text = safeNumButtonTitle == "." ? "0." : safeNumButtonTitle
        } else {
            if safeNumButtonTitle == "." {
                if !safeDisplayText.contains(".") {
                    displayLabel.text = safeDisplayText + safeNumButtonTitle
                }
            } else {
                displayLabel.text = safeDisplayText == "0" ? safeNumButtonTitle : safeDisplayText + safeNumButtonTitle
            }
        }
    }
}

