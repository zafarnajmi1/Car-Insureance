//
//  NotificationCell.swift
//  CarInsurance
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol NotificationCellDelegate: class {
    func buttonDidTapped(notification: NotificationModel?)
}



class NotificationCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var userimage: UIImageView!
    
    var delegate: NotificationCellDelegate?
    private var model: NotificationModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        
    }

    
    //MARK:-  Initialization code
    func  setData(model: NotificationModel)  {
        self.model = model
        title.text = model.title ?? "--"
        content.text = model.descriptionField ?? "--"
        let url = model.sender?.image?.resizeImage(width: 400, height: 400)
        userimage.setPath(string: url, "UserImage")
        time.text  = setTimeAgoFormatBy(dateString: model.createdAt!)
        
        
//        if model.seen == true {
//            unseenView.isHidden = true
//        }
//        else {
//            unseenView.isHidden = false
//        }
    }
    
    
    func setupUI()  {
        self.containerView.layer.cornerRadius = self.containerView.frame.height / 2
        self.containerView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.containerView.layer.borderWidth = 1
        self.containerView.clipsToBounds = true
        
        self.userimage.layer.cornerRadius = self.userimage.frame.height / 2
        self.userimage.clipsToBounds = true
        content.textColor = .gray
    }
    
    @IBAction func btnDeleteAction(_ sender: UIButton) {
        delegate?.buttonDidTapped(notification: model)
    }
}
