//
//  acceptedadditionalServicesCell.swift
//  CarInsurance
//
//  Created by Apple on 8/26/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class acceptedadditionalServicesCell: UITableViewCell {
    
    @IBOutlet weak var mainview: UIView!
    @IBOutlet weak var boximg: UIImageView!
    @IBOutlet weak var lblAEd: UILabel!
    
    
    @IBOutlet weak var lbladtionallserviceQuestion: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    func loadCell(object:acceptedQuotDetailAdditionalServices){
        if AppUserDefault.shared.currency == "usd"{
        self.lblAEd.text = "\(object.charges?.usd?.symbol ?? "")\(String(format:"%.2f",object.charges?.usd?.amount ?? 0))"
        }else{
            self.lblAEd.text = "\(object.charges?.aed?.symbol ?? "") \(object.charges?.aed?.amount ?? 0)"
        }
        if(object.status == "selected"){
            
           boximg.image = UIImage(named: "GreenCheckBox")
            
            
        }else{
            
            boximg.image = UIImage(named: "Square")
        }
        self.lbladtionallserviceQuestion.text = object.service?.title
    
    }
    
}
