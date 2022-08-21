//
//  ViewController.swift
//  Prework
//
//  Created by Angel Zambrano on 8/21/22.
//

import UIKit

class ViewController: UIViewController {

    
    // properties
    
    @IBOutlet weak var billAmountTextfield: UITextField!
    
    @IBOutlet weak var tipAmountLbl: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /// MARK: Actions
    
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextfield.text!) ?? 0
        
        // get total tip by multiplying tip * tip percentage
        let tipPercentage = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // update tip amount label
        tipAmountLbl.text = String(format: "$%.2f", tip)
        // Update total amount
        totalLabel.text = String(format: "$%.2f", total)
        
        
        
    }
    
    


}

