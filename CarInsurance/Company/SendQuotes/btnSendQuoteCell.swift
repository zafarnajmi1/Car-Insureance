//
//  btnSendQuoteCell.swift
//  CarInsurance
//
//  Created by Apple on 7/22/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class btnSendQuoteCell: UITableViewCell {

    @IBOutlet weak var btnsendQuote: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.btnsendQuote.setcornerButton(Corner: 10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    @IBAction func sendQuotAction(_ sender: UIButton) {
    }
}
