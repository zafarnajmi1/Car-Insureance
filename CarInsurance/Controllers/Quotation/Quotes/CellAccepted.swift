//
//  CellAccepted.swift
//  CarInsurance
//
//  Created by Apple on 7/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol acceptedProtocool {
    func myaccepted(cell:CellAccepted)
}
class CellAccepted: UITableViewCell {

    @IBOutlet weak var lbldateheading: UILabel!
    @IBOutlet weak var btnArrow: UIButton!
    @IBOutlet weak var lbltotalcount: UILabel!
    @IBOutlet weak var lblQuotCount: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblorderNumber: UILabel!
    @IBOutlet weak var mainUiView: UIView!
    var delegate:acceptedProtocool?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainUiView.cardViewUiview()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

    func loadAcceptedCell(){
        lbldateheading.text = "Date:".localized
        lblQuotCount.text = "Total Quotes Recieved:".localized
        if myDefaultLanguage == .ar {
            let image = UIImage(named: "CircleWithRightArrow-1") //?.withHorizontallyFlippedOrientation()
            self.btnArrow.setBackgroundImage(image, for: .normal)//setImage(image, for: .normal)
        }else{
            
            let image = UIImage(named: "CircleWithRightArrow")
            self.btnArrow.setBackgroundImage(image, for: .normal)
        }
    }
    @IBAction func acceptedAction(_ sender: UIButton) {
        self.delegate?.myaccepted(cell: self)
    }
}
