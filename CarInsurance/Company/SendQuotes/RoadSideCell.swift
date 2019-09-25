//
//  RoadSideCell.swift
//  CarInsurance
//
//  Created by Apple on 7/22/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  DLRadioButton
class RoadSideCell: UITableViewCell {

    @IBOutlet weak var btnRoadNotAvailAble: DLRadioButton!
    @IBOutlet weak var btnRoadAvailAble: DLRadioButton!
    @IBOutlet weak var lblRoadSide: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
