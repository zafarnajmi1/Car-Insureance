//
//  CellAcceptedCompany.swift
//  CarInsurance
//
//  Created by Apple on 8/2/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol companyacceptedProtocool {
    func myaccepted(cell:CellAcceptedCompany)
}
class CellAcceptedCompany: UITableViewCell {
    @IBOutlet weak var lblDateHeading: UILabel!
    
    @IBOutlet weak var btnArrow: UIButton!
    @IBOutlet weak var lblfile: UILabel!
    @IBOutlet weak var lblCategoryname: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblOrderNumber: UILabel!
    @IBOutlet weak var mainCardView: UIView!
    var delegate:companyacceptedProtocool?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainCardView.cardViewUiview()
        lblDateHeading.text = "Date:".localized
        lblfile.text = "Add Policy File".localized
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func loadAcceptedCell() {
        
        if myDefaultLanguage == .ar {
            let image = UIImage(named:"CircleWithRightArrow-1")
            self.btnArrow.setBackgroundImage(image, for: .normal)
        }else{
            let image = UIImage(named:"CircleWithRightArrow")
            self.btnArrow.setBackgroundImage(image, for: .normal)
        }
    }
    @IBAction func companyAcceptedAction(_ sender: UIButton) {
        self.delegate?.myaccepted(cell: self)
    }
}
