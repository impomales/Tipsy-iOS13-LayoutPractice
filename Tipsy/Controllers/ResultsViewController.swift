//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Isaias Pomales on 6/25/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var total: Double?
    var tipValue: String?
    var numberOfPeople: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel.text = String(format: "%.2f", total ?? 0)
        settingsLabel.text = "Split between \(numberOfPeople ?? 0) people, with \(tipValue ?? "0")% tip."
    }

    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
