//
//  ReplacementCell.swift
//  CarInsurance
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ReplacementCell: UITableViewCell {

    @IBOutlet weak var lblanswer: UILabel!
    @IBOutlet weak var lblquestion: UILabel!
    @IBOutlet weak var lblbuynow: UILabel!
    @IBOutlet weak var lblbasic: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var lblbasicPrice: UILabel!
    @IBOutlet weak var replacementView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()

        lblbasic.text = "Basic Price".localized
        lblbuynow.text = "Buy Now".localized
       self.replacementView.addShadow(location: VerticalLocation.bottom)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
