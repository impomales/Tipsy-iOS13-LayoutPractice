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
    
    var tipCalculator = TipCalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        splitStepper.value = Double(tipCalculator.splitValue)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = tipCalculator.calculateTip(billAmount: Double(billTextField.text!) ?? 0)
            destinationVC.numberOfPeople = tipCalculator.splitValue
            destinationVC.tipValue = String(format: "%.0f", tipCalculator.tipAmount * 100)
        }
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        deselectAllTipButtons()
        sender.isSelected = true
        
        let tipStrValue = String(sender.currentTitle!.dropLast())
        tipCalculator.setTipAmount(Double(tipStrValue)! / 100)
    }
    
    @IBAction func stepperVAlueChanged(_ sender: UIStepper) {
        tipCalculator.setSplitValue(Int(sender.value))
        splitNumberLabel.text = String(format: "%.0f", Double(tipCalculator.splitValue))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    private func deselectAllTipButtons() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
}

