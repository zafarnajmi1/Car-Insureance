//
//  BasicServicesOptionCell.swift
//  CarInsurance
//
//  Created by Apple on 7/22/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  DLRadioButton

protocol companyBasicServicesProtocool {
    func mybasicservices(cell:BasicServicesOptionCell )
}
class BasicServicesOptionCell: UITableViewCell {
    weak var sendquotparams : sendQuotParams?
    @IBOutlet weak var btnNotAvailAble: DLRadioButton!
    @IBOutlet weak var btnAvailAble: DLRadioButton!
    @IBOutlet weak var lblwhatis: UILabel!
    weak var sendquot:sendquoteQuestionsQuestions?
    var delegate:companyBasicServicesProtocool?
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    @IBAction func inCaseYesAction(_ sender: DLRadioButton) {
        self.delegate?.mybasicservices(cell: self)
    }
    
    @IBAction func inCaseBNoAction(_ sender: DLRadioButton) {
        self.delegate?.mybasicservices(cell: self)
    }
    
    
    func basicservecelload(object: sendquoteQuestionsQuestions){
        sendquot = object
        
        self.btnAvailAble.setTitle(object.options?[0].title ?? "", for: .normal)
        self.btnNotAvailAble.setTitle(object.options?[1].title ?? "", for: .normal)
        lblwhatis.text = object.title
        
        
    }
}
