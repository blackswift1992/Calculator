import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var isFinishedTypingNumber = true
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
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

