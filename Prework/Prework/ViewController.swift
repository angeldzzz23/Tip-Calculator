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
    @IBOutlet weak var darkModeButton: UIBarButtonItem!
    
    var percents = [Double]()
    
    var darkmodeIsEnabled = false
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let defaults = UserDefaults.standard
//        defaults.set(false, forKey: KeyValues.darkmode)
//        defaults.set(15.0, forKey: KeyValues.percentageOne)
//        defaults.set(18.0, forKey: KeyValues.percentageTwo)
//        defaults.set(20.9, forKey: KeyValues.percentageThree)
        
        
//        let defaults = UserDefaults.standard
//        defaults.double(forKey: KeyValues.percentageOne)
//        print(defaults.double(forKey: KeyValues.percentageOne))
        

        
    }
    
    /// MARK: Actions
    @IBAction func calculateTip(_ sender: Any) {
      // NOthing to do he
        
    }
    
    

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billAmountTextfield.becomeFirstResponder()
        
        // get user default things
        let defaults = UserDefaults.standard
        let percentOne = defaults.double(forKey: KeyValues.percentageOne)
        let percentTwo =  defaults.double(forKey: KeyValues.percentageTwo)
        let percentThree = defaults.double(forKey: KeyValues.percentageThree)
        
        percents.removeAll()
        percents.append(contentsOf: [percentOne, percentTwo, percentThree])
        
        tipControl.setTitle("\(percents[0])%", forSegmentAt: 0)
        tipControl.setTitle("\(percents[1])%", forSegmentAt: 1)
        tipControl.setTitle("\(percents[2])%", forSegmentAt: 2)
        
        darkmodeIsEnabled = defaults.bool(forKey: KeyValues.darkmode)
        
        // configure dark mode
        overrideUserInterfaceStyle = (darkmodeIsEnabled) ? .dark : .light
        navigationController?.overrideUserInterfaceStyle = (darkmodeIsEnabled) ? .dark : .light
                
        
    }
    
    @IBAction func enableOrDisableDarkModeBtnIsPressed(_ sender: Any) {
        
        
    }
    
    
    // MARK: action methods
    // calculates the total
    @IBAction func CalaculateTotal(_ sender: Any) {
        // performs calculations
        let calcultions = calculate()
        
        // updates views
        updateViews(with: calcultions.tip, total: calcultions.total,
                    split: calcultions.split)
        
    }
    
    
    // MARK: helper functions
    
    // updates all of the views
    func updateViews(with tip:Double, total: Double, split: Double ) {
        // update tip amount label
        tipAmountLbl.text = String(format: "$%.2f", tip)
        // Update total amount
        totalLabel.text = String(format: "$%.2f", total)
        
        // ipdate the party
        splitLabel.text = String(format: "$%.2f", split)
    }
    
    
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

