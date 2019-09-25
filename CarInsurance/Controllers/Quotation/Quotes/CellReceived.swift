//
//  CellReceived.swift
//  CarInsurance
//
//  Created by Apple on 7/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol receivedProtocool {
    func myrecieved(cell: CellReceived)
}
class CellReceived: UITableViewCell {

    @IBOutlet weak var lbldateheading: UILabel!
    @IBOutlet weak var btnArrow: UIButton!
    @IBOutlet weak var lbltotalcount: UILabel!
    @IBOutlet weak var lblQuotNumber: UILabel!
    @IBOutlet weak var lbldate: UILabel!
    @IBOutlet weak var lblordernumber: UILabel!
    @IBOutlet weak var mainView: UIView!
    var delegate:receivedProtocool?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainView.cardViewUiview()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func loadRecievedCell(){
        lbldateheading.text = "Date:".localized
        lblQuotNumber.text = "Total Quotes Recieved:".localized
        if myDefaultLanguage == .ar {
            let image = UIImage(named: "CircleWithRightArrow-1") //?.withHorizontallyFlippedOrientation()
            self.btnArrow.setBackgroundImage(image, for: .normal)//setImage(image, for: .normal)
        }else{
            
            let image = UIImage(named: "CircleWithRightArrow")
            self.btnArrow.setBackgroundImage(image, for: .normal)
        }
    }
    
    @IBAction func RecievedAction(_ sender: UIButton) {
        self.delegate?.myrecieved(cell: self)
    }
}
