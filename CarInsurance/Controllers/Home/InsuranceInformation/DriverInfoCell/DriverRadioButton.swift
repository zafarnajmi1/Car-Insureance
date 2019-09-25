//
//  DriverRadioButton.swift
//  CarInsurance
//
//  Created by Apple on 8/9/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  DLRadioButton
protocol  driverRadioProtocool {
    func mydriverRadio(cell:DriverRadioButton)
}
class DriverRadioButton: VehicalInfoBaseCell {

    @IBOutlet weak var btnNo: DLRadioButton!
    @IBOutlet weak var btnYes: DLRadioButton!
    @IBOutlet weak var lblquestionheading: UILabel!
    var delegate:driverRadioProtocool?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func inYesCaseAction(_ sender: DLRadioButton) {
        delegate?.mydriverRadio(cell: self)
    }
    @IBAction func inNoCaseAction(_ sender: DLRadioButton) {
         delegate?.mydriverRadio(cell: self)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)

    }
    
    func loadcellRadio(object: Questions){
        self.question = object
        lblquestionheading.text = object.title
        btnYes.setTitle(object.options?[0].title, for: .normal)
        btnNo.setTitle(object.options?[1].title, for: .normal)
        
        if(object.yesNo == nil ){
            btnYes.isSelected =  false
             btnNo.isSelected =  false
        }else if object.yesNo ?? false{
           
            btnYes.isSelected =  true
        }else{
             btnNo.isSelected =  true
        }
    }
    
}
