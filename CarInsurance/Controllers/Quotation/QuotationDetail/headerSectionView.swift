//
//  headerSectionView.swift
//  CarInsurance
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class headerSectionView: UITableViewCell {
    @IBOutlet weak var lblbasicservices: UILabel!
    
    @IBOutlet weak var companyimg: UIImageView!
    @IBOutlet weak var lblcompanyname: UILabel!
    @IBOutlet weak var headerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.companyimg.setRoundimage()
        self.headerView.addShadow(location: VerticalLocation.top)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
