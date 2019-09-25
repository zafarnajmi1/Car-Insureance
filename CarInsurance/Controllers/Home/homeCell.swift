//
//  testcell.swift
//  CarInsurance
//
//  Created by Apple on 7/5/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol homeprotocool {
    func myhome(Index:Int)
}
class homeCell: UITableViewCell {

    @IBOutlet weak var btnArrow: UIButton!
    @IBOutlet weak var txtview: UITextView!
    //@IBOutlet weak var lblDiscription: UILabel!
    @IBOutlet weak var lblheading: UILabel!
    @IBOutlet weak var bluerView: UIView!
    @IBOutlet weak var bgimage: UIImageView!
    var delegate:homeprotocool?
    var indx = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bgimage.setcornerImage(Corner: 15)
        self.bluerView.setcornerUiview(Corner: 15)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    func loadhomecel(index:Int){
      self.indx = index
        
        if myDefaultLanguage == .ar {
            self.txtview.textAlignment = .right
            self.btnArrow.setImage(UIImage.init(named: "CircleWithRightArrow-1"), for: .normal)
        }else{
            self.txtview.textAlignment = .left
            self.btnArrow.setImage(UIImage.init(named: "CircleWithRightArrow"), for: .normal)
        }
    }

    @IBAction func DetailButonAction(_ sender: UIButton) {
        self.delegate?.myhome(Index: indx )
        
    }
}
