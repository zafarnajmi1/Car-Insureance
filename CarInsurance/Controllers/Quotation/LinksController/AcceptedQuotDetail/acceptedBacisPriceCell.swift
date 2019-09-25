//
//  acceptedBacisPriceCell.swift
//  CarInsurance
//
//  Created by Apple on 8/26/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class acceptedBacisPriceCell: UITableViewCell {

    @IBOutlet weak var lblbasicprice: UILabel!
    @IBOutlet weak var lbltotale: UILabel!
    @IBOutlet weak var acceptedBasicPriveView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.acceptedBasicPriveView.addShadow(location: VerticalLocation.bottom)
        lbltotale.text = "Basic Price :".localized
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
