//
//  AdditionalServicesOptionsCell.swift
//  CarInsurance
//
//  Created by Apple on 7/22/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol addtionalservicesprotocool {
    func myaddtionalservices(cell:AdditionalServicesOptionsCell)
    func myAdditionalPrice(cell:AdditionalServicesOptionsCell)
}
class AdditionalServicesOptionsCell: UITableViewCell,UITextFieldDelegate {
 weak var sendquotparams : sendQuotParams?
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var TxtUiviewfield: UIView!
    @IBOutlet weak var lblRepair: UILabel!
    @IBOutlet weak var btncheckBox: UIButton!
    weak var additional: sendquoteQuestionsAddionalService?
    var delegate:addtionalservicesprotocool?
    var value : Bool = false
    @IBOutlet weak var boximg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        txtPrice.isUserInteractionEnabled = false
         txtPrice.delegate = self
        self.TxtUiviewfield.layer.borderWidth = 1
         self.TxtUiviewfield.layer.borderColor = #colorLiteral(red: 0.9252848029, green: 0.9294856191, blue: 0.9293467402, alpha: 1)
        txtPrice.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        self.delegate?.myAdditionalPrice(cell: self)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
}
  
    
    @IBAction func checkBox(_ sender: UIButton) {
        
        
        if value{
            value = false
            txtPrice.isUserInteractionEnabled = false
            boximg.image = UIImage(named: "Square")
            additional?.isSelected = false
            txtPrice.text = ""
        }else {
            value = true
            txtPrice.isUserInteractionEnabled = true
            boximg.image = UIImage(named: "GreenCheckBox")
            additional?.isSelected = true
            
        }
        
         self.delegate?.myaddtionalservices(cell: self)
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtPrice{
            
            let allowedCharacters = "1234567890"
            let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
            let typedCharacterSet = CharacterSet(charactersIn: string)
            let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
            let Range = range.length + range.location > (txtPrice.text?.count)!
            
            if Range == false && alphabet == false {
                return false
            }
            
            let NewLength = (txtPrice.text?.count)! + string.count - range.length
            return NewLength < 7
        }
        return true
    }
    func loadaddtionaservices(object:sendquoteQuestionsAddionalService){
        lblRepair.text = object.title
        additional = object
    }
    
    
}
