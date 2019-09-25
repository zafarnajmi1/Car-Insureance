//
//  CellRecievedCompany.swift
//  CarInsurance
//
//  Created by Apple on 8/2/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol companyreceivedprotocool {
    func  myrecieved(cell:CellRecievedCompany)
}
class CellRecievedCompany: UITableViewCell {
    @IBOutlet weak var lbldateHeading: UILabel!
    
    @IBOutlet weak var btnArrow: UIButton!
    
    @IBOutlet weak var lblCategoryname: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblOrderNumber: UILabel!
    @IBOutlet weak var mainCardView: UIView!
    var delegate:companyreceivedprotocool?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainCardView.cardViewUiview()
        
        lbldateHeading.text = "Date:".localized
        
    }

    func loadrecivedCell(){
        
        if myDefaultLanguage == .ar {
            let image = UIImage(named:"CircleWithRightArrow-1")
            self.btnArrow.setBackgroundImage(image, for: .normal)
        }else{
            let image = UIImage(named:"CircleWithRightArrow")
            self.btnArrow.setBackgroundImage(image, for: .normal)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

    @IBAction func receievedAction(_ sender: UIButton) {
        self.delegate?.myrecieved(cell: self)
    }
}
