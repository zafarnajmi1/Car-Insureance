//
//  claimTxtCell.swift
//  CarInsurance
//
//  Created by Apple on 9/6/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol claimtxtfoprotocol {
    func  mytxtClaim(cell:claimTxtCell, Section:Int)
}
class claimTxtCell: VehicalInfoBaseCell, UITextFieldDelegate  {
     var section = 0
    @IBOutlet weak var lblquestion: UILabel!
    @IBOutlet weak var txtvalue: UITextField!
    @IBOutlet weak var mainview: UIView!
    var delegate:claimtxtfoprotocol?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.txtvalue.delegate = self
        self.mainview.setcornerUiview(Corner: 10)
        self.txtvalue.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        let tfs = [txtvalue] as! [UITextField]
        AppLanguage.updateTextFieldsDirection(tfs)
    }

    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        self.delegate?.mytxtClaim(cell: self, Section:section)
    }
    
    
    func loadTextCell(object : Questions, Section:Int) {
        self.section = Section
        self.question = question
        lblquestion.text = object.title
        //self.txtmarketValue.placeholder = question?.placeholder
        self.txtvalue.text = object.answerText
        self.question = object
        
    }
    
    
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if textField == txtvalue{
//
//            let allowedCharacters = "1234567890"
//            let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
//            let typedCharacterSet = CharacterSet(charactersIn: string)
//            let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
//            let Range = range.length + range.location > (txtvalue.text?.count)!
//
//            if Range == false && alphabet == false {
//                return false
//            }
//
//            let NewLength = (txtvalue.text?.count)! + string.count - range.length
//            return NewLength < 7
//        }
//        return true
//    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
