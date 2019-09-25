//
//  VechalAttachmentCell.swift
//  CarInsurance
//
//  Created by Apple on 9/2/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol vehicalattachmentShowprotocool {
    func myfilepath(path: String)
}
class VechalAttachmentCell: UITableViewCell {

    @IBOutlet weak var lblquation: UILabel!
    var delegate:vehicalattachmentShowprotocool?
    var mypath = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func attachaction(_ sender: UIButton) {
        self.delegate?.myfilepath(path: mypath)
    }
    
    
    func loadcell(path:String){
        self.mypath = path
    }
}
