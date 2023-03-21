import Foundation


struct CalculatorLogic {
    private var firstPartOfExpression: (firstNumber: Double, operationSymbol: String)?
}


//MARK: - Public methods


extension CalculatorLogic {
    mutating func calculate(number: Double, operationSymbol: String) -> Double? {
        switch operationSymbol {
        case "AC":
            return 0.0
        case "+/-":
            return number * -1
        case "%":
            return number / 100
        case "+", "-", "×", "÷":
            firstPartOfExpression = (firstNumber: number, operationSymbol: operationSymbol)
            return nil
        case "=":
            return calculateFullExpression(secondNumber: number)
        default:
            return nil
        }
    }
    
    func checkDigit(numButtonTitle: String, displayText: String, isFirstDigit: Bool) -> String? {
        if isFirstDigit {
            return numButtonTitle == "." ? "0." : numButtonTitle
        } else {
            if numButtonTitle == "." {
                return !displayText.contains(".") ? displayText + numButtonTitle : nil
            } else {
                return displayText == "0" ? numButtonTitle : displayText + numButtonTitle
            }
        }
    }
}


//MARK: - Private methods


private extension CalculatorLogic {
    mutating func calculateFullExpression(secondNumber: Double) -> Double? {
        guard let expression = firstPartOfExpression else { return nil }
        firstPartOfExpression = nil

        switch expression.operationSymbol {
        case "+":
            return expression.firstNumber + secondNumber
        case "-":
            return expression.firstNumber - secondNumber
        case "×":
            return expression.firstNumber * secondNumber
        case "÷":
            return expression.firstNumber / secondNumber
        default:
            return nil
        }
    }
}
