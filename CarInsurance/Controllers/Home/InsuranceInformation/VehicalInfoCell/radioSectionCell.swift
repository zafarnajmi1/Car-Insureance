//
//  radioSectionCell.swift
//  CarInsurance
//
//  Created by Apple on 9/5/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import DLRadioButton
protocol vehicalRadioSectionProtocool {
    func myradio(cell:radioSectionCell)
}
class radioSectionCell: VehicalInfoBaseCell {

    @IBOutlet weak var lblquestion: UILabel!
    @IBOutlet weak var btnNo: DLRadioButton!
    @IBOutlet weak var btnyes: DLRadioButton!
    var delegate:vehicalRadioSectionProtocool?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func yescaseAction(_ sender: DLRadioButton) {
        self.delegate?.myradio(cell: self)
    }
    
    @IBAction func nocaseAction(_ sender: DLRadioButton) {
        self.delegate?.myradio(cell: self)

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func loadcellRadio(object: Questions){
        
        self.question = object
        
        btnyes.setTitle(object.options?[0].title, for: .normal)
        btnNo.setTitle(object.options?[1].title, for: .normal)
        lblquestion.text = object.title
        
        
        if(object.yesNo == nil){
            btnyes.isSelected =  false
            btnNo.isSelected =  false
        }else if object.yesNo ?? false {
            
            btnyes.isSelected =  true
        }else{
            btnNo.isSelected =  true
        }
    }
}
