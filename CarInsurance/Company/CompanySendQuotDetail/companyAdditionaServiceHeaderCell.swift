//
//  companyAdditionaServiceHeaderCell.swift
//  CarInsurance
//
//  Created by Apple on 8/27/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class companyAdditionaServiceHeaderCell: UITableViewCell {

    @IBOutlet weak var mainview: UIView!
    @IBOutlet weak var lblAdtional: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainview.addShadow(location: VerticalLocation.top)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
