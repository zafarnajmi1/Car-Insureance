//
//  cellsendertxt.swift
//  CarInsurance
//
//  Created by Apple on 7/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SenderTextCell: UITableViewCell {

    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.transform = CGAffineTransform (scaleX: 1,y: -1);
    }
    
    func setData(message: MessageModel)  {
        
        content.text = message.content
        if let date = message.createdAt {
            time.text = setTimeAgoFormatBy(dateString: date)
        }
        
        self.updateConstraintsIfNeeded()
    }

}
