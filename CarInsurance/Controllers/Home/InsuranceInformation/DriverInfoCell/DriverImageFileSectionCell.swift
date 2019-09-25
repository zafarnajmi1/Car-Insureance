//
//  DriverImageFileSectionCell.swift
//  CarInsurance
//
//  Created by Apple on 7/25/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol  driverprotocol {
    func getmyimage(cell:DriverImageFileSectionCell)
}
class DriverImageFileSectionCell: VehicalInfoBaseCell {

    var degelegate:driverprotocol?
    @IBOutlet weak var lblimageName: UILabel!
    @IBOutlet weak var mainUiViewImage: UIView!
    @IBOutlet weak var lblimageheading: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainUiViewImage.setcornerUiview(Corner: 10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadDriverCellImage(object: Questions){
        lblimageheading.text = object.title
        self.question = object
        self.lblimageName.text = question?.imageURL
        self.lblimageName.text = object.placeholder
        
        if   object.imageURL != nil{
            lblimageName.text =  object.imageURL
        }
        
    }
    
    @IBAction func getimageAction(_ sender: UIButton) {
        self.degelegate?.getmyimage(cell: self)
        
    }
    
}
