//
//  DriverNumberCell.swift
//  CarInsurance
//
//  Created by Apple on 8/9/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol  drivernumberprotocool {
    func mydrivernumber(cell:DriverNumberCell)
}
class DriverNumberCell: VehicalInfoBaseCell, UITextFieldDelegate {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var txtFild: UITextField!
    @IBOutlet weak var lblquestionheading: UILabel!
    var delegate:drivernumberprotocool?
    override func awakeFromNib() {
        super.awakeFromNib()
        txtFild.delegate = self
        self.mainView.setcornerUiview(Corner: 10)
        txtFild.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        let tfs = [txtFild] as! [UITextField]
        AppLanguage.updateTextFieldsDirection(tfs)
    }

    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        self.delegate?.mydrivernumber(cell: self)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtFild{
            
            let allowedCharacters = "1234567890"
            let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
            let typedCharacterSet = CharacterSet(charactersIn: string)
            let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
            let Range = range.length + range.location > (txtFild.text?.count)!
            
            if Range == false && alphabet == false {
                return false
            }
            
            let NewLength = (txtFild.text?.count)! + string.count - range.length
            return NewLength < 7
        }
        return true
    }
    
    
    func loadDriverCellnumber(object:Questions){
        lblquestionheading.text = object.title
        self.question = question
        self.txtFild.placeholder = object.placeholder
        self.txtFild.text = object.answerText
        self.question = object
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
