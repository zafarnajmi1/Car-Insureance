//
//  CliamButtonSectionCell.swift
//  CarInsurance
//
//  Created by Apple on 7/25/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol GetQuotprotocool {
    func submitQuotAction (cell: CliamButtonSectionCell)
    
    
}
class CliamButtonSectionCell: UITableViewCell {

    var delegate:GetQuotprotocool?
    @IBOutlet weak var btngetQout: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.btngetQout.setcornerButton(Corner: 10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    @IBAction func GetQuotaction(_ sender: UIButton) {
        self.delegate?.submitQuotAction(cell: self)
    }
}
