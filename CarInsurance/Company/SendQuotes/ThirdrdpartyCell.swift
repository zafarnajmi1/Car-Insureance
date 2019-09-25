//
//  3rdpartyCell.swift
//  CarInsurance
//
//  Created by Apple on 7/22/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol thirdpartyProtocool {
    func thirdparty(cell:ThirdrdpartyCell)
}
class ThirdrdpartyCell: UITableViewCell,UITextFieldDelegate {
    weak var sendquotparams : sendQuotParams?
    @IBOutlet weak var txtprice: UITextField!
    @IBOutlet weak var txtfiledUiview: UIView!
    @IBOutlet weak var lblThirdPrty: UILabel!
    weak var sendquot:sendquoteQuestionsQuestions?
    var delegate:thirdpartyProtocool?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.txtfiledUiview.setcornerUiview(Corner: 10)
        txtprice.delegate = self
        txtprice.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        self.delegate?.thirdparty(cell: self)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadThirdPartycell(object: sendquoteQuestionsQuestions){
        sendquot = object
        
        txtprice.placeholder = object.placeholder ?? "..."
        switch object.questionType {
        case "text":
             txtprice.keyboardType = .default
        
        case "number":
              txtprice.keyboardType = .numberPad
        default:
            txtprice.keyboardType = .default
        }
       
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtprice && sendquot?.questionType == "number" {
            
            let allowedCharacters = "1234567890"
            let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
            let typedCharacterSet = CharacterSet(charactersIn: string)
            let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
            let Range = range.length + range.location > (txtprice.text?.count)!
            
            if Range == false && alphabet == false {
                return false
            }
            
            let NewLength = (txtprice.text?.count)! + string.count - range.length
            return NewLength < 7
        }
        return true
    }
}
