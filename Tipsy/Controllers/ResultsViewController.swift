//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Andrea Amaya on 3/01/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var tipTotal: String?
    var splitQuantity: String = ""
    var tipPercentage: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel.text = tipTotal
        settingsLabel.text = "Split between \(splitQuantity) people, with \(tipPercentage)% tip"
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
