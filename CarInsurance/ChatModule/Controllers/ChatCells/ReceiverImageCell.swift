//
//  ReceiverImageCell.swift
//  CarInsurance
//
//  Created by Apple on 7/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ReceiverImageCell: UITableViewCell {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.transform = CGAffineTransform (scaleX: 1,y: -1);
    }
    
    func setData(message: MessageModel)  {
        let url = message.content?.resizeImage(width: 400, height: 400)
        myImage.setPath(string: url, "placeholder")
        
        let url2 = message.sender?.image?.resizeImage(width: 200, height: 200)
        userImage.setPath(string: url2, "UserImage")
        
        if let date  = message.createdAt {
            self.time.text = setTimeAgoFormatBy(dateString: date)
        }
        self.updateFocusIfNeeded()
    }
    

}
