//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!
    
    var tipAmount: Double = 0.1
    var splitValue: Double = 2.0
    var amountOwed: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        splitStepper.value = splitValue
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = amountOwed
            destinationVC.numberOfPeople = Int(splitValue)
            destinationVC.tipValue = String(format: "%.0f", tipAmount)
        }
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        deselectAllTipButtons()
        sender.isSelected = true
        
        let tipStrValue = String(sender.currentTitle!.dropLast())
        tipAmount = Double(tipStrValue)! / 100
    }
    
    @IBAction func stepperVAlueChanged(_ sender: UIStepper) {
        splitValue = sender.value
        splitNumberLabel.text = String(format: "%.0f", splitValue)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billTotal = Double(billTextField.text!) ?? 0
        let billTotalWithTip = billTotal + billTotal * tipAmount
        amountOwed = billTotalWithTip / splitValue
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    private func deselectAllTipButtons() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
}

