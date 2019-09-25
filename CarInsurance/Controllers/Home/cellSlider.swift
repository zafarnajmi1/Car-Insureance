//
//  cellSlider.swift
//  CarInsurance
//
//  Created by Apple on 7/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class cellSlider: UICollectionViewCell {

    
    @IBOutlet weak var lbldetail: UILabel!
    @IBOutlet weak var mainimage: UIImageView!
    @IBOutlet weak var bgimage: UIImageView!
    
    @IBOutlet weak var lblname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setData(model: Sliders)  {
        self.lbldetail.text = model.detailMobileEn
        self.lblname.text = model.title
        
        self.bgimage.setPath(string: model.image?.resizeImage(width: Int(UIScreen.main.bounds.width) , height: 170), "Bg")
    }
  
}
