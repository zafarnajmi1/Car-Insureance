//
//  ClaimInfoCell.swift
//  CarInsurance
//
//  Created by Apple on 7/19/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ClaimInfoCell: UITableViewCell {

    @IBOutlet weak var lblClaimAnswer: UILabel!
    @IBOutlet weak var lblclaimQuestions: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
