//
//  attachmentVehicleCell.swift
//  CarInsurance
//
//  Created by Apple on 8/28/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol showattachmentProtocol {
    func showattach(img:String)
}
class attachmentVehicleCell: VehicalInfoBaseCell {
   var section = 0
    var index = 0
    var imagepath = ""
    @IBOutlet weak var lblatachment: UILabel!
    @IBOutlet weak var lblquestion: UILabel!
    var deleagate:showattachmentProtocol?
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadcell(imgpath:String){
       self.imagepath = imgpath
    }
    @IBAction func attachementAction(_ sender: UIButton) {
        self.deleagate?.showattach(img: self.imagepath)
    }
    
}
