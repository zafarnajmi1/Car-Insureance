//
//  claimFileCell.swift
//  CarInsurance
//
//  Created by Apple on 9/6/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol getclaimImageProtocol {
    func myimage(cell:claimFileCell, mysection:Int)
}
class claimFileCell: VehicalInfoBaseCell {
  var section = 0
    @IBOutlet weak var mainview: UIView!
    @IBOutlet weak var lblimagename: UILabel!
    @IBOutlet weak var lblquestion: UILabel!
    var delegate:getclaimImageProtocol?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainview.setcornerUiview(Corner: 10)
    }

    @IBAction func imageAction(_ sender: UIButton) {
        self.delegate?.myimage(cell: self, mysection: section)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func LoadImageCell(objec: Questions,Section:Int){
        self.question = objec
        self.section = Section
        lblquestion.text = objec.title
        lblimagename.text = objec.imageURL
        lblimagename.text =  objec.placeholder
        if   objec.imageURL != nil{
            lblimagename.text =  objec.imageURL
        }
    }
}
