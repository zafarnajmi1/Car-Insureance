//
//  InsuranceDetailRadioSectionCell.swift
//  CarInsurance
//
//  Created by Apple on 7/25/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  DLRadioButton
protocol insurancDetalProtocol {
    func myinsuranceDetail(cell:InsuranceDetailRadioSectionCell)
}
class InsuranceDetailRadioSectionCell: VehicalInfoBaseCell {

    @IBOutlet weak var btnNo: DLRadioButton!
    @IBOutlet weak var btnYes: DLRadioButton!
    @IBOutlet weak var lblquesyionheading: UILabel!
    var delegate: insurancDetalProtocol?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func inYesCaseAction(_ sender: DLRadioButton) {
        self.delegate?.myinsuranceDetail(cell: self)
    }
    @IBAction func inNoCaseAction(_ sender: DLRadioButton) {
        self.delegate?.myinsuranceDetail(cell: self)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    func loadCellInsuranceDetail(object: Questions){
        question = object
        
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
