//
//  companyAddtionalServicesQuestionCell.swift
//  CarInsurance
//
//  Created by Apple on 8/27/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class companyAddtionalServicesQuestionCell: UITableViewCell {

    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func loadCell(object:companysendQuotDetailAdditionalServices){
        if AppUserDefault.shared.currency == "usd"{
        self.lblprice.text = "\(object.charges?.usd?.symbol ?? "")\(String(format:"%.2f",object.charges?.usd?.amount ?? 0))"
        }else{
            self.lblprice.text = "\(object.charges?.aed?.symbol ?? "")\(object.charges?.aed?.amount ?? 0)"
        }
        
        self.lblQuestion.text = object.service?.title
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
