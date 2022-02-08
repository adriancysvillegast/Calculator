//
//  ViewController.swift
//  Calculator
//
//  Created by Adriancys Jesus Villegas Toro on 25/1/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishTypingNumber: Bool = true

    private var displayValue : Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Display label cannot convert to a double")
            }
            return number
        }
        
        set{
            displayLabel.text = String(newValue)
        }
    }
    private var calculator = CalculateLogic()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logicButtonPressed(_ sender: UIButton) {

        isFinishTypingNumber = true

        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
//            this app work is using if stament
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
            
            
        
        }
    }
    
    
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
 
        if let newValue = sender.currentTitle {
            
            if isFinishTypingNumber{
                displayLabel.text = newValue
                isFinishTypingNumber = false
                
            }else {
//                review if the account is double
                if newValue == "."{
//                    if is int will be double
                    let isInt = floor(displayValue) == displayValue
//                    if the value isn't int return
                    if !isInt{
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + newValue
            }
        }
    }
    
}

