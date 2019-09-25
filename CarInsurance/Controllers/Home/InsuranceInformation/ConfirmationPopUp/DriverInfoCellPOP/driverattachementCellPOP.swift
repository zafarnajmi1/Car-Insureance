//
//  driverattachementCellPOP.swift
//  CarInsurance
//
//  Created by Apple on 8/28/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol showdriverAttachment {
    func driverattachment(img:String)
}
class driverattachementCellPOP: VehicalInfoBaseCell {

    @IBOutlet weak var lblattachment: UILabel!
    @IBOutlet weak var lblquestions: UILabel!
    var delegate:showdriverAttachment?
    var imagepath = ""
    var section = 0
    var index = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadcell(imgpath: String){
       self.imagepath = imgpath
    }
    @IBAction func attachmentAction(_ sender: UIButton) {
        self.delegate?.driverattachment(img: self.imagepath)
    }
}
