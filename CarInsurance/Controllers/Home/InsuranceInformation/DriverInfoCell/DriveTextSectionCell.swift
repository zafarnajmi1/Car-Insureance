//
//  DriveTextSectionCell.swift
//  CarInsurance
//
//  Created by Apple on 7/25/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol  drivertextProtocool {
    func mydriverText(cell:DriveTextSectionCell)
}
class DriveTextSectionCell: VehicalInfoBaseCell,UITextFieldDelegate {

    @IBOutlet weak var txtexperinece: UITextField!
    @IBOutlet weak var mainViewDriverText: UIView!
    @IBOutlet weak var lblexperienceHeading: UILabel!
    var delegate:drivertextProtocool?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainViewDriverText.setcornerUiview(Corner: 10)
        txtexperinece.delegate = self
        txtexperinece.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        let tfs = [txtexperinece] as! [UITextField]
        AppLanguage.updateTextFieldsDirection(tfs)
    }

    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        self.delegate?.mydriverText(cell: self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func loadDriverCellText(object: Questions){
        lblexperienceHeading.text = object.title
         self.question = question
        self.txtexperinece.placeholder = object.placeholder
        self.txtexperinece.text = object.answerText
         question = object
    }
    
    func textUpdated(id:String){
        
        if let text = txtexperinece.text{
            if text == ""{
                params?.params.removeValue(forKey: "")
            }
            else{
                
                params?.params.updateValue(text, forKey: id)
            }
            
        }
        
    }
}
