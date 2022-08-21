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
    @IBOutlet weak var PartySizeTxtfield: UITextField!
    
    @IBOutlet weak var splitLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
  
    
    // updates all of the views
    func updateViews(with tip:Double, total: Double, split: Double ) {
        // update tip amount label
        tipAmountLbl.text = String(format: "$%.2f", tip)
        // Update total amount
        totalLabel.text = String(format: "$%.2f", total)
        
        // ipdate the party
        splitLabel.text = String(format: "$%.2f", split)
    }
    
    /// MARK: Actions
    @IBAction func calculateTip(_ sender: Any) {
      // NOthing to do here
        
    }
    
    
   
    
    
    @IBAction func CalaculateTotal(_ sender: Any) {
        let calcultions = calculate()
        
        
        updateViews(with: calcultions.tip, total: calcultions.total,
                    split: calcultions.split)
        
    }
    
    
    // MARK: helper functions
    // calcualtes the tip, totaal, and split
    func calculate() -> (tip:Double, total: Double, split: Double) {
        let bill = Double(billAmountTextfield.text!) ?? 0
        let partySize = Int(PartySizeTxtfield.text!) ?? 1
        
        // get total tip by multiplying tip * tip percentage
        let tipPercentage = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = bill + tip
        // calcualte the split of each recipient
        let split =  total / Double(partySize)
        
        return (tip, total, split)
        
       
    }
    


}

