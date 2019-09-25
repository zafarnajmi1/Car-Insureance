//
//  buttonsectionCell.swift
//  CarInsurance
//
//  Created by Apple on 7/25/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol  nextProtocol {
    func nextAction(cell: buttonsectionCell)
}
class buttonsectionCell: VehicalInfoBaseCell {

    
    var delegate:nextProtocol?
    @IBOutlet weak var btnnext: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.btnnext.setcornerButton(Corner: 10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    @IBAction func btnNextAction(_ sender: UIButton) {
        self.delegate?.nextAction(cell: self)
        
    }
    
}
