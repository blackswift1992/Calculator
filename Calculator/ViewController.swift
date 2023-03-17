import UIKit


class ViewController: UIViewController {
    @IBOutlet private weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber = true
    
    
    @IBAction private func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        guard let displayLabelValue = displayLabel.text,
              let number = Double(displayLabelValue),
              let culcButtonValue = sender.currentTitle else {
            fatalError("Cannot convert display label text or sender current title")
        }

        switch culcButtonValue {
            case "AC": displayLabel.text = "0"
            case "+/-": displayLabel.text = String(number * -1)
            case "%": displayLabel.text = String(number / 100)
            default: return
        }
    }
    
    @IBAction private func numButtonPressed(_ sender: UIButton) {
        if let numButtonValue = sender.currentTitle,
           let displayLabelValue = displayLabel.text {
            if isFinishedTypingNumber {
                displayLabel.text = numButtonValue
                isFinishedTypingNumber = false
            } else {
                displayLabel.text = displayLabelValue + numButtonValue
            }
        }
    }
}

