//
//  VehicalInfoBaseCell.swift
//  CarInsurance
//
//  Created by Apple on 7/31/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class VehicalInfoBaseCell: UITableViewCell {
    weak var option: Options?
    weak var question : Questions?
    weak var child : Children?
    weak var params : PostParams?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
