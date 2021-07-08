//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Isaias Pomales on 7/2/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct TipCalculator {
    var tipAmount: Double = 0.1
    var splitValue: Int = 2
    
    mutating func setTipAmount(_ tipAmount: Double) {
        self.tipAmount = tipAmount
    }
    
    mutating func setSplitValue(_ splitValue: Int) {
        self.splitValue = splitValue
    }
    
    func calculateTip(billAmount: Double) -> Double {
        return (billAmount + billAmount * tipAmount) / Double(splitValue)
    }
}
