//
//  RecieverTextCell.swift
//  CarInsurance
//
//  Created by Apple on 7/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class RecieverTextCell: UITableViewCell {

    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var timeAgo: UILabel!
  
    @IBOutlet weak var userImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.transform = CGAffineTransform (scaleX: 1,y: -1);
    }
    
    override func layoutSubviews() {
        
    }
    
    func setData(message: MessageModel)  {
        
        content.text = message.content
        if let date = message.createdAt {
            timeAgo.text = setTimeAgoFormatBy(dateString: date)
        }
        let user = message.sender
        let url = user?.image?.resizeImage(width: 100, height: 100)
        userImage.setPath(string: url, "UserImage")
        
        self.updateConstraintsIfNeeded()
    }

}
