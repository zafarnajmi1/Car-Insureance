//
//  TextSectionCell.swift
//  CarInsurance
//
//  Created by Apple on 7/25/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol vechicltextInfoprotocol {
    func  mytxtdata(cell:TextSectionCell)
}
class TextSectionCell: VehicalInfoBaseCell, UITextFieldDelegate {
    @IBOutlet weak var lblmarketvalue: UILabel!
    @IBOutlet weak var mainViewMarkeValue: UIView!
    @IBOutlet weak var txtmarketValue: UITextField!
    var delegate:vechicltextInfoprotocol?
    override func awakeFromNib() {
        super.awakeFromNib()
        txtmarketValue.delegate = self
        self.mainViewMarkeValue.setcornerUiview(Corner: 10)
        txtmarketValue.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        let tfs = [txtmarketValue] as! [UITextField]
        AppLanguage.updateTextFieldsDirection(tfs)
    }

    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        self.delegate?.mytxtdata(cell: self)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    func loadTextCell(object : Questions) {
        self.question = question
        lblmarketvalue.text = object.title
        //self.txtmarketValue.placeholder = question?.placeholder
        self.txtmarketValue.text = object.answerText
        self.question = object
//        question?.answerText =
        //textUpdated(object._id!)
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtmarketValue{
            
            let allowedCharacters = "1234567890"
            let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
            let typedCharacterSet = CharacterSet(charactersIn: string)
            let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
            let Range = range.length + range.location > (txtmarketValue.text?.count)!
            
            if Range == false && alphabet == false {
                return false
            }
            
            let NewLength = (txtmarketValue.text?.count)! + string.count - range.length
            return NewLength < 7
        }
        return true
    }
    func textUpdated(_ id:String){
        
        if let text = txtmarketValue.text{
            if text == ""{
                params?.params.removeValue(forKey: "")
            }
            else{
                
               params?.params.updateValue(text, forKey: id)
            }
            
        }
        
    }
}
