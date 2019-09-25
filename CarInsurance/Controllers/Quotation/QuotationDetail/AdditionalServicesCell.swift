//
//  AdditionalServicesCell.swift
//  CarInsurance
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol aditionalservicesPrices {
    func myprices(object:QuotListAdditionalServices, Index: Int, section: Int)
}
class AdditionalServicesCell: UITableViewCell {

    
    @IBOutlet weak var btnprice: UIButton!
    @IBOutlet weak var boximg: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblquestionAdditional: UILabel!
    @IBOutlet weak var additionalServicesView: UIView!
    var value : Bool = false
    var getindex = 0
    var getsection = 0
    weak var additional: QuotListAdditionalServices?
    
    var delegate:aditionalservicesPrices?
    var totalValue = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        value = false
    }
    @IBAction func checkboxAction(_ sender: UIButton) {
        
        
        
        if value{
            value = false
            boximg.image = UIImage(named: "Square")
           additional?.isSelect =  false
           
        }else {
            value = true
            boximg.image = UIImage(named: "CheckBox")
            additional?.isSelect =  true
            
        }
        
        self.delegate?.myprices(object: additional!, Index: getindex, section: getsection)
    }
    
    func loadcell(object : QuotListAdditionalServices, Index: Int, section: Int){
       
        if AppUserDefault.shared.currency == "usd"{
            let sum = String(format:"%.2f",object.charges?.usd?.amount ?? 0)
            self.lblPrice.text = "\(object.charges?.usd?.symbol ?? "") \(sum)"
        }else{
            
            //let sum = String(format:"%.2f",object.charges?.aed?.amount ?? 0)
            self.lblPrice.text = "\(object.charges?.aed?.symbol ?? "") \(object.charges?.aed?.amount ?? 0)"
        }
         self.lblquestionAdditional.text = object.service?.title
        
        getindex = Index
        getsection = section
        if(object.isSelect == true){
            value = true
           boximg.image = UIImage(named: "CheckBox")
        }else {
            value = false
            boximg.image = UIImage(named: "Square")
            
        }
        
        additional = object
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
