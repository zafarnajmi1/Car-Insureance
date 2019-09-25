//
//  CellSentCompany.swift
//  CarInsurance
//
//  Created by Apple on 8/2/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol  sentProtocool {
    func mysent(cell:CellSentCompany)
}
class CellSentCompany: UITableViewCell {

    @IBOutlet weak var lbldateHeading: UILabel!
    @IBOutlet weak var btnArrow: UIButton!
    @IBOutlet weak var lblCategoryname: UILabel!
    @IBOutlet weak var lbldate: UILabel!
    @IBOutlet weak var lblOrdernumber: UILabel!
    @IBOutlet weak var maincardView: UIView!
    var delegate:sentProtocool?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.maincardView.cardViewUiview()
        lbldateHeading.text = "Date:".localized
        lblCategoryname.text = "".localized
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    func loadsentCell() {
        
        if myDefaultLanguage == .ar {
            let image = UIImage(named:"CircleWithRightArrow-1")
            self.btnArrow.setBackgroundImage(image, for: .normal)
        }else{
            let image = UIImage(named:"CircleWithRightArrow")
            self.btnArrow.setBackgroundImage(image, for: .normal)
        }
    }
    @IBAction func sentAction(_ sender: UIButton) {
        self.delegate?.mysent(cell: self)
    }
    
}
