//
//  DriveDropwDownSectionCell.swift
//  CarInsurance
//
//  Created by Apple on 7/25/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  DropDown
protocol DriverDropDownProtocool {
    func mydriverProctocol(cell:DriveDropwDownSectionCell, index: Int)
}
class DriveDropwDownSectionCell: VehicalInfoBaseCell {

    @IBOutlet weak var btndrivedropwdown: UIButton!
    @IBOutlet weak var txtdropwdowndrive: UITextField!
    @IBOutlet weak var dropDownMainView: UIView!
    @IBOutlet weak var lblmainHeading: UILabel!
    var delegate:DriverDropDownProtocool?
     var optionArray = [Options]()
    //var question = [Questions]()
    var driverDrowpDown = DropDown()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.dropDownMainView.setcornerUiview(Corner: 10)
        
        let tfs = [txtdropwdowndrive] as! [UITextField]
        AppLanguage.updateTextFieldsDirection(tfs)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       self.dropDownMainView.setcornerUiview(Corner: 10)
        
    }
    
    func loadDriverCellDropdown(object: Questions){
         self.question = object
        lblmainHeading.text = object.title
        self.optionArray = object.options!
        self.txtdropwdowndrive.placeholder = object.placeholder
        self.txtdropwdowndrive.text = self.question?.answerText
       
    }
    @IBAction func btnDriverDropwDownAction(_ sender: UIButton) {
        
        driverDrowpDown.anchorView = btndrivedropwdown
        driverDrowpDown.backgroundColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        driverDrowpDown.selectionBackgroundColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
        driverDrowpDown.dataSource =  self.optionArray.map({$0.title!})
        DropDown.appearance().textColor = #colorLiteral(red: 0.5527616143, green: 0.5568413734, blue: 0.5609211326, alpha: 1)
        DropDown.appearance().selectedTextColor = UIColor.red
        DropDown.appearance().textFont = UIFont(name: "JosefinSans-Regular", size: 18)!
        self.driverDrowpDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            
            cell.optionLabel.textAlignment = .center
            
        }
        
        driverDrowpDown.bottomOffset = CGPoint(x: 0, y: btndrivedropwdown.bounds.height)
        driverDrowpDown.selectionAction = {(index: Int, item: String) in
            
            self.txtdropwdowndrive.text = item
            self.question?.selectedAns = index
            self.question?.answerText = item
            self.delegate?.mydriverProctocol(cell:self, index: index )
           
            
         
        }
        driverDrowpDown.show()
        
    }
}
