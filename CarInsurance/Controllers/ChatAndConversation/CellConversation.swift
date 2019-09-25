//
//  CellConversation.swift
//  CarInsurance
//
//  Created by Apple on 7/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class CellConversation: UITableViewCell {

    @IBOutlet weak var lblmsg: UILabel!
    @IBOutlet weak var lbltime: UILabel!
    @IBOutlet weak var lblusername: UILabel!
    @IBOutlet weak var userimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.userimage.layer.cornerRadius = self.userimage.frame.height / 2
        self.userimage.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.userimage.layer.borderWidth = 1
        self.userimage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
