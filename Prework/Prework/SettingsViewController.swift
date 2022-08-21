//
//  SettingsViewController.swift
//  Prework
//
//  Created by Angel Zambrano on 8/21/22.
//

import UIKit


class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: properties
    //
    @IBOutlet weak var tableview: UITableView!
    
    let percentagesNames = ["Percentage 1", "percentage 2", "percentage 3"]
    var percentages = [Double]()
    
    
    var isDarkMode = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"
        
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.register(PercentageViewCell.self, forCellReuseIdentifier: "cell1")
        tableview.register(DarkModeTableViewCell.self, forCellReuseIdentifier: "cell2")
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.alwaysBounceVertical = false

      
    }
    
    @IBAction func SaveButtonWasPressed(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(percentages[0], forKey: KeyValues.percentageOne)
        defaults.set(percentages[1], forKey: KeyValues.percentageTwo)
        defaults.set(percentages[2], forKey: KeyValues.percentageThree)
        defaults.set(isDarkMode, forKey: KeyValues.darkmode)
        showAlert()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getDataFromUsrDefaults()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else if section == 1 {
            return 1
        }
         
        return 10
    }
    
    func getDataFromUsrDefaults() {
        let defaults = UserDefaults.standard
        let percentOne = defaults.double(forKey: KeyValues.percentageOne)
        let percentTwo =  defaults.double(forKey: KeyValues.percentageTwo)
        let percentThree = defaults.double(forKey: KeyValues.percentageThree)
        let darkMode = defaults.bool(forKey: KeyValues.darkmode)
        isDarkMode = darkMode
        
        
        percentages = [percentOne, percentTwo, percentThree]
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Saved", message: "We have saved your current settings", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
            print("tapped dismissed")
        }))
        present(alert, animated: true)
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! DarkModeTableViewCell
            cell.setProperty(isEnabled: isDarkMode)
            cell.delegate = self
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! PercentageViewCell
        cell.setProperties(labeltxt: percentagesNames[indexPath.row], percentage:
                            percentages[indexPath.row])
        cell.delegate = self
        
        return cell
        
    }
    
}


// conforming to protocols
extension SettingsViewController: PercentProtocol {
    
    func save(percent: Double, type: String) {
        let index = percentagesNames.firstIndex(of: type)
        if let index = index {
            percentages[index] = percent
        } else {
            print("nothing was modified")
        }
        
    }
    
        
}

extension SettingsViewController: DakrModeProtocol {
    func saveIsDark(isEnabled: Bool) {
        isDarkMode = isEnabled
        
        overrideUserInterfaceStyle = (isDarkMode) ? .dark : .light
        navigationController?.overrideUserInterfaceStyle = (isDarkMode) ? .dark : .light
    
    }
    
    
}
