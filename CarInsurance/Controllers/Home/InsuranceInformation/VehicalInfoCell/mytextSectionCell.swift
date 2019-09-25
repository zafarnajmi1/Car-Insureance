//
//  mytextSectionCell.swift
//  CarInsurance
//
//  Created by Apple on 7/30/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol  vehicaltxtProtocool {
    func myvehicaltxtdata(cell:mytextSectionCell)
}
class mytextSectionCell: VehicalInfoBaseCell, UITextFieldDelegate {

    @IBOutlet weak var txtvalue: UITextField!
    @IBOutlet weak var txtMainUIview: UIView!
    @IBOutlet weak var lblquestionheading: UILabel!
    var delegate:vehicaltxtProtocool?
    override func awakeFromNib() {
        super.awakeFromNib()
        txtvalue.delegate = self
        self.txtMainUIview.setcornerUiview(Corner: 10)
        txtvalue.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        let tfs = [txtvalue] as! [UITextField]
        AppLanguage.updateTextFieldsDirection(tfs)
    }

    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        self.delegate?.myvehicaltxtdata(cell: self)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    func loadmyTextCell(object : Questions) {
        
        lblquestionheading.text = object.title
        //txtvalue.placeholder = object.placeholder
        txtvalue.text = object.answerText
        
        self.question = question
        lblquestionheading.text = object.title
        //self.txtmarketValue.placeholder = question?.placeholder
        
        
        self.question = object
        //        question?.answerText =
        //textUpdated(object._id!)
    }
    
}
