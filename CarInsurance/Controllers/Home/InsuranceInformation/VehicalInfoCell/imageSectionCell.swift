//
//  imageSectionCell.swift
//  CarInsurance
//
//  Created by Apple on 7/25/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol getImageProtocol {
    func myimage(cell:imageSectionCell)
}
class imageSectionCell: VehicalInfoBaseCell {
     var delegate:getImageProtocol?
    @IBOutlet weak var lblimgename: UILabel!
    @IBOutlet weak var mainViewVehicalLicence: UIView!
    @IBOutlet weak var lblVehicalLicenceImage: UILabel!
    var queationarray = [Questions]()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainViewVehicalLicence.setcornerUiview(Corner: 10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    @IBAction func getImagAction(_ sender: UIButton) {
       
        delegate?.myimage(cell: self)
    }
    
   func LoadImageCell(objec: Questions){
    self.question = objec
    
        lblVehicalLicenceImage.text = objec.title
    lblimgename.text = objec.imageURL
    lblimgename.text =  objec.placeholder
    if   objec.imageURL != nil{
        lblimgename.text =  objec.imageURL
    }
    }
    
}
