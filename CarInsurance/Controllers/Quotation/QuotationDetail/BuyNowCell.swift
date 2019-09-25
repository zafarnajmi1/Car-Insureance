//
//  BuyNowCell.swift
//  CarInsurance
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol buynowProtocool {
    func buynow(cell:BuyNowCell, section: Int)
    func termscompny(cell:BuyNowCell,section: Int)
}
class BuyNowCell: UITableViewCell {

    @IBOutlet weak var btntermcondtions: UIButton!
    @IBOutlet weak var lbltotalPrice: UILabel!
    @IBOutlet weak var lblbuynow: UILabel!
    @IBOutlet weak var mainViewBuy: UIView!
    var delegete:buynowProtocool?
    var section = 0
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.layer.cornerRadius = 15
//        self.layer.shadowOpacity = 1
//        self.layer.shadowOffset = CGSize(width: 0, height: 5)
//        self.layer.shadowRadius = 5
//        self.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//        self.layer.masksToBounds = false
        self.lblbuynow.text = "Buy Now".localized
        self.btntermcondtions.setTitle("Terms And Conditions".localized, for: .normal)
        self.mainViewBuy.cardViewUiview()
    }

    @IBAction func buynowAction(_ sender: UIButton) {
        self.delegete?.buynow(cell: self, section: section )
    }
    @IBAction func termconditionsAction(_ sender: UIButton) {
        self.delegete?.termscompny(cell: self, section: section)
        
    }
    
    func loadcellBuynow(getSetion: Int){
        self.section = getSetion
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
