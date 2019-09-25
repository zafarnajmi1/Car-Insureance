//
//  AcceptedbasicserviceHeaderCell.swift
//  CarInsurance
//
//  Created by Apple on 8/26/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class AcceptedbasicserviceHeaderCell: UITableViewCell {

    @IBOutlet weak var lblbasicPrice: UILabel!
    @IBOutlet weak var basicserviceheaderView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.basicserviceheaderView.addShadow(location: VerticalLocation.top)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
