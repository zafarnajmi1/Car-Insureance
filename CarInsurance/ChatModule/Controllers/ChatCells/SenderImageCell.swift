//
//  SenderImageCell.swift
//  CarInsurance
//
//  Created by Apple on 7/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import SDWebImage

class SenderImageCell: UITableViewCell {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.transform = CGAffineTransform (scaleX: 1,y: -1);
    }
    
    func setData(message: MessageModel)  {
        
        let url = message.content?.resizeImage(width: 400, height: 400)
        myImage.setPath(string: url, "placeholder")
        if let date = message.createdAt {
            self.time.text = setTimeAgoFormatBy(dateString: date)
        }
        self.updateConstraintsIfNeeded()
    }
    

}

extension UIImageView {
    
    func setPath( string: String?,_ placeholder: String? )  {
        let url = URL(string: string ?? "")
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_setImage(with: url , placeholderImage: UIImage(named: placeholder ?? ""))
    }
    
}
