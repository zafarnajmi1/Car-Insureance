//
//  DriverButtonSectionCell.swift
//  CarInsurance
//
//  Created by Apple on 7/25/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol driveButtonProtocol {
    func nextActionButton(cell: DriverButtonSectionCell)
    
    
}
class DriverButtonSectionCell: UITableViewCell {
    @IBOutlet weak var btnnext: UIButton!
    var delegate:driveButtonProtocol?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.btnnext.setcornerButton(Corner: 10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    @IBAction func nextaction(_ sender: UIButton) {
        self.delegate?.nextActionButton(cell: self)
    }
}
