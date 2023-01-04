//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    
    var percentageSelected: Float = 0.1
    var tipResult: String?

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        twentyPctButton.isSelected = false
        tenPctButton.isSelected = false
        zeroPctButton.isSelected = false
        
        sender.isSelected = true
        
        let removePercent = sender.currentTitle!
        percentageSelected = (Float(removePercent.dropLast()) ?? 0) / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let totalBill = (Float(billTextField.text!) ?? 0)
        let totalTip = totalBill * percentageSelected
        let dividedTip = (totalBill + totalTip) / (Float(splitNumberLabel.text!) ?? 1)

        tipResult = String(format: "%.2f", dividedTip)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult") {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.tipTotal = tipResult
            destinationVC.splitQuantity = splitNumberLabel.text!
            destinationVC.tipPercentage = String(percentageSelected * 100)
        }
    }
}

