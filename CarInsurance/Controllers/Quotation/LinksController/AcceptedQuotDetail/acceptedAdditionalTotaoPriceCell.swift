//
//  acceptedAdditionalTotaoPriceCell.swift
//  CarInsurance
//
//  Created by Apple on 8/26/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class acceptedAdditionalTotaoPriceCell: UITableViewCell {

    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var lbltotalPrice: UILabel!
    @IBOutlet weak var mainUiview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainUiview.addShadow(location: VerticalLocation.bottom)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
}
