import UIKit


class ViewController: UIViewController {
    @IBOutlet private weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber = true
    
    
    @IBAction private func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        guard let displayStringValue = displayLabel.text,
              let displayDoubleNumber = Double(displayStringValue) else {
            fatalError("Cannot convert display label text into Double")
        }
        
        guard let culcButtonStringValue = sender.currentTitle else {
            fatalError("Cannot convert sender current title into String")
        }

        switch culcButtonStringValue {
            case "AC": displayLabel.text = "0"
            case "+/-": displayLabel.text = String(displayDoubleNumber * -1)
            case "%": displayLabel.text = String(displayDoubleNumber / 100)
            default: return
        }
    }
    
    @IBAction private func numButtonPressed(_ sender: UIButton) {
        guard let displayStringValue = displayLabel.text,
              let displayDoubleNumber = Double(displayStringValue) else {
            fatalError("Cannot convert display label text into Double")
        }
        
        guard let numButtonStringValue = sender.currentTitle else {
            fatalError("Cannot convert sender current title into String")
        }
        
        if isFinishedTypingNumber {
            displayLabel.text = numButtonStringValue
            isFinishedTypingNumber = false
            
            if numButtonStringValue == "." {
                displayLabel.text = "0" + numButtonStringValue
            } else {
                displayLabel.text = numButtonStringValue
            }
        } else {
            if numButtonStringValue == "." {
                if !displayStringValue.contains(".") {
                    displayLabel.text = displayStringValue + numButtonStringValue
                }

            } else {
                displayLabel.text = displayStringValue + numButtonStringValue
            }
        }
    }
}

