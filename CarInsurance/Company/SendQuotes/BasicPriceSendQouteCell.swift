//
//  BasicPriceSendQouteCell.swift
//  CarInsurance
//
//  Created by Apple on 7/22/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol mybasicpricProtocool {
    func mybasicprice(cell:BasicPriceSendQouteCell)
}
class BasicPriceSendQouteCell: UITableViewCell,UITextFieldDelegate {
    @IBOutlet weak var basicmainView: UIView!
     weak var sendquotparams : sendQuotParams?
    @IBOutlet weak var txtbasicprice: UITextField!
    @IBOutlet weak var PriceUiview: UIView!
    var delegate:mybasicpricProtocool?
    
    @IBOutlet weak var lblAED: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        txtbasicprice.delegate = self
        basicmainView.layer.borderWidth = 0.5
        basicmainView.layer.borderColor = #colorLiteral(red: 0.9213513732, green: 0.925490737, blue: 0.9295075536, alpha: 1)
        txtbasicprice.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        
        
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        self.delegate?.mybasicprice(cell: self)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtbasicprice{
            
            let allowedCharacters = "1234567890"
            let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
            let typedCharacterSet = CharacterSet(charactersIn: string)
            let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
            let Range = range.length + range.location > (txtbasicprice.text?.count)!
            
            if Range == false && alphabet == false {
                return false
            }
            
            let NewLength = (txtbasicprice.text?.count)! + string.count - range.length
//            return NewLength <= 15
              return NewLength < 7
        }
        return true
    }
    
}
