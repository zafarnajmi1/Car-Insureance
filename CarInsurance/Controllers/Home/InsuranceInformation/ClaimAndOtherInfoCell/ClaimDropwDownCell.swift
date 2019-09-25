//
//  ClaimDropwDownCell.swift
//  CarInsurance
//
//  Created by Apple on 9/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  DropDown
protocol claimdropdownprotocool {
    func myclaimdropdown(cell:ClaimDropwDownCell, ind:Int, Section: Int )
}
class ClaimDropwDownCell: VehicalInfoBaseCell {

    @IBOutlet weak var btndropwdown: UIButton!
    @IBOutlet weak var txtselcted: UITextField!
    @IBOutlet weak var mainview: UIView!
    @IBOutlet weak var lblquestion: UILabel!
    var  delegate:claimdropdownprotocool?
     var optionArray = [Options]()
    var mysection = 0
     var driverDrowpDown = DropDown()
    override func awakeFromNib() {
        super.awakeFromNib()
       self.mainview.setcornerUiview(Corner: 10)
        let tfs = [txtselcted] as! [UITextField]
        AppLanguage.updateTextFieldsDirection(tfs)
    }

    func loadCellClainDropDown(object: Questions, section: Int){
        
        
        self.question = object
        self.mysection = section
        lblquestion.text = object.title
        self.optionArray = object.options!
        self.txtselcted.placeholder = object.placeholder
        self.txtselcted.text = self.question?.answerText
        

    }
    
    
    @IBAction func selctionAction(_ sender: UIButton) {
        
        
        driverDrowpDown.anchorView = btndropwdown
        driverDrowpDown.backgroundColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        driverDrowpDown.selectionBackgroundColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        driverDrowpDown.dataSource =  self.optionArray.map({$0.title!})
        DropDown.appearance().textColor = #colorLiteral(red: 0.5527616143, green: 0.5568413734, blue: 0.5609211326, alpha: 1)
        DropDown.appearance().selectedTextColor = UIColor.red
        DropDown.appearance().textFont = UIFont(name: "JosefinSans-Regular", size: 18)!
        self.driverDrowpDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            
            cell.optionLabel.textAlignment = .center
            
        }
        
        driverDrowpDown.bottomOffset = CGPoint(x: 0, y: btndropwdown.bounds.height)
        driverDrowpDown.selectionAction = {(index: Int, item: String) in
            
            self.txtselcted.text = item
            self.question?.selectedAns = index
            self.question?.answerText = item
            self.delegate?.myclaimdropdown(cell:self, ind: index, Section: self.mysection  )
            
            
            
        }
        driverDrowpDown.show()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
