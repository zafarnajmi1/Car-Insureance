//
//  ClaimdetailHeadingCell.swift
//  CarInsurance
//
//  Created by Apple on 7/30/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ClaimdetailHeadingCell: UITableViewCell {
    @IBOutlet weak var lblclaimdetailgead: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func loadCellclaimHeading(object: Children){
        
        lblclaimdetailgead.text = object.title
    }
    
}
