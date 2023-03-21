import UIKit


class ViewController: UIViewController {
    @IBOutlet private weak var displayLabel: UILabel!
    
    private var calculatorLogic = CalculatorLogic()
    
    private var isNewNumber = true
    
    private var displayNumber: Double {
        get {
            guard let displayStringValue = displayLabel.text,
                  let displayNumber = Double(displayStringValue) else {
                 fatalError("Cannot convert display label text into Double")
            }
            
            return displayNumber
        }
        
        set {
            displayLabel.text = newValue == 0.0 ? "0" : String(newValue)
        }
    }
}


//MARK: - @IBActions


private extension ViewController {
    @IBAction private func calcButtonPressed(_ sender: UIButton) {
        isNewNumber = true
        
        guard let safeCulcButtonTitle = sender.currentTitle else {
            fatalError("Cannot convert sender current title into String")
        }
        
        if let result = calculatorLogic.calculate(number: displayNumber, operationSymbol: safeCulcButtonTitle) {
            displayNumber = result
        }
    }
    
    @IBAction private func numButtonPressed(_ sender: UIButton) {
        guard let safeNumButtonTitle = sender.currentTitle,
              let safeDisplayText = displayLabel.text else {
            fatalError("Cannot convert into String")
        }

        if isNewNumber {
            isNewNumber = false
            
            if let newDisplayText = calculatorLogic.checkDigit(numButtonTitle: safeNumButtonTitle, displayText: safeDisplayText, isFirstDigit: true) {
                displayLabel.text = newDisplayText
            }
        } else {
            if let newDisplayText = calculatorLogic.checkDigit(numButtonTitle: safeNumButtonTitle, displayText: safeDisplayText, isFirstDigit: false) {
                displayLabel.text = newDisplayText
            }
        }
    }
}
