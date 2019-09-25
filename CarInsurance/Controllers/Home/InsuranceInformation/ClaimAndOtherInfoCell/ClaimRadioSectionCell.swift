//
//  ClaimRadioSectionCell.swift
//  CarInsurance
//
//  Created by Apple on 7/25/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import DLRadioButton
protocol radiobuttonProtocoll {
    func myradio(cell:ClaimRadioSectionCell)
}
class ClaimRadioSectionCell: VehicalInfoBaseCell {

    @IBOutlet weak var btnNo: DLRadioButton!
    @IBOutlet weak var btnYes: DLRadioButton!
    @IBOutlet weak var lblqeastionHeading: UILabel!
    var delegate: radiobuttonProtocoll?
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func inyesCaseAction(_ sender: DLRadioButton) {
        self.delegate?.myradio(cell: self)
    }
    @IBAction func inNoCaseAction(_ sender: DLRadioButton) {
        self.delegate?.myradio(cell: self)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func loadCellclaimRadio(object: Questions){
        
       
        self.question = object
        
        btnYes.setTitle(object.options?[0].title, for: .normal)
        btnNo.setTitle(object.options?[1].title, for: .normal)
        
        if(object.yesNo == nil){
            btnYes.isSelected =  false
            btnNo.isSelected =  false
        }else if object.yesNo ?? false{
            
            btnYes.isSelected =  true
        }else{
            btnNo.isSelected =  true
        }
    }
    
    
    
    
}
