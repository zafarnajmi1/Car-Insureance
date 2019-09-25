//
//  acceptedAdditionalHeaderCell.swift
//  CarInsurance
//
//  Created by Apple on 8/26/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class acceptedAdditionalHeaderCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
         self.mainView.addShadow(location: VerticalLocation.top)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
