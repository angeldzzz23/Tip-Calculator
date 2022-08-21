//
//  percentageViewCell.swift
//  Prework
//
//  Created by Angel Zambrano on 8/21/22.
//

import UIKit

protocol PercentProtocol: AnyObject {
    func save(percent: Double, type: String)
}



class PercentageViewCell: UITableViewCell, UITextFieldDelegate {


    private let lbl = UILabel()
    private let textfield = UITextField()
    private var type = ""
    
    weak var delegate: PercentProtocol?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
   
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func setProperties(labeltxt: String, percentage: Double) {
        lbl.text = labeltxt
        textfield.text = String(percentage)
    }
        
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // set up views
        contentView.addSubview(lbl)
        lbl.text = "Percentage 1"
//        textfield.backgroundColor = .red
        
        
        lbl.translatesAutoresizingMaskIntoConstraints = false

        lbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        
        lbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        
        contentView.addSubview(textfield)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.borderStyle = .roundedRect
        
        textfield.delegate = self
        
    
        
        textfield.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        
        textfield.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        textfield.widthAnchor.constraint(equalToConstant: 100).isActive = true
        textfield.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if let text = textField.text {
            if let number = Double(text) {
                delegate?.save(percent: number, type: lbl.text!)
                
            }
        } else {
            return
        }
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    
    
}
