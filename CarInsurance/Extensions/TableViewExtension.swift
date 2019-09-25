//
//  TableViewExtension.swift
//  CarInsurance
//
//  Created by apple on 8/29/19.
//  Copyright © 2019 Apple. All rights reserved.
//


extension UITableView {
    
    func empty(_ message: String = "No Record found".localized) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width , height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 5;
        messageLabel.textAlignment = .center;
        messageLabel.textColor = UIColor.black
        messageLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
    
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel;
        self.separatorStyle = .none;
    }
    
    func reset() {
        self.backgroundView = nil
        self.separatorStyle = .none
    }
}
