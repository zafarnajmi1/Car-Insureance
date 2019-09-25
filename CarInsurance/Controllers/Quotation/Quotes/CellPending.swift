//
//  CellPending.swift
//  CarInsurance
//
//  Created by Apple on 7/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

protocol pendingProtocool {
    func mypending(cell:CellPending)
}
class CellPending: UITableViewCell {

    @IBOutlet weak var lbldateheading: UILabel!
    @IBOutlet weak var btnArrow: UIButton!
    @IBOutlet weak var lbltotalcount: UILabel!
    @IBOutlet weak var lblordercountes: UILabel!
    @IBOutlet weak var lbldate: UILabel!
    @IBOutlet weak var lblordernumber: UILabel!
    @IBOutlet weak var mainView: UIView!
    var delegate:pendingProtocool?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainView.cardViewUiview()
        ///self.mainView.addShadow(location: VerticalLocation.top)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

    func loadpendingCell(){
        lbldateheading.text = "Date:".localized
        lblordercountes.text = "Total Quotes Recieved:".localized
        if myDefaultLanguage == .ar {
            let image = UIImage(named: "CircleWithRightArrow-1") //?.withHorizontallyFlippedOrientation()
            self.btnArrow.setBackgroundImage(image, for: .normal)//setImage(image, for: .normal)
        }else{

            let image = UIImage(named: "CircleWithRightArrow")
            self.btnArrow.setBackgroundImage(image, for: .normal)
        }
    }
    @IBAction func pendingAction(_ sender: UIButton) {
        self.delegate?.mypending(cell: self)
    }
}
