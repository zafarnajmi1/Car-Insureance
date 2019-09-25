//
//  claimDatePickerCell.swift
//  CarInsurance
//
//  Created by Apple on 9/6/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol claimDateProtocol {
    func myclaimdate(cell:claimDatePickerCell,Section:Int)
}
class claimDatePickerCell: VehicalInfoBaseCell {
   var section = 0
    var datePicker = UIDatePicker()
    @IBOutlet weak var lblquestion: UILabel!
    @IBOutlet weak var txtclaimdate: UITextField!
    @IBOutlet weak var mainView: UIView!
    var delegate:claimDateProtocol?
    var dateISOFormate = ""
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
        
        self.mainView.setcornerUiview(Corner: 10)
        
        self.txtclaimdate.delegate = self
        
        datePicker.minimumDate = Date()
        
        datePicker.datePickerMode = .date
        
        datePicker.addTarget(self, action: #selector(pickerChnaged(_:)), for: UIControl.Event.valueChanged)
        txtclaimdate.inputView = datePicker
        let tfs = [txtclaimdate] as! [UITextField]
        AppLanguage.updateTextFieldsDirection(tfs)
        
    }
    
    @objc func pickerChnaged(_ picker : UIDatePicker){
        if picker == datePicker {
            print("Date :\(picker.date)")
            setPolicyDate(date: datePicker.date)
        }
    }
    
    
    func setPolicyDate(date : Date){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd,MMMM, yyyy" //HH:mm
        let stringDate = dateFormatter.string(from: date)
        self.txtclaimdate.text = stringDate
        
        ///MARK:ISO
        let enUSPosixLocale = Locale(identifier: "en_US_POSIX")
        dateFormatter.locale = enUSPosixLocale
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        
        let iso8601String = dateFormatter.string(from: date)
        self.dateISOFormate = iso8601String
        print(self.dateISOFormate)
        //str_date = date.dateString(dateFormate: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        // self.txtpolicyDate.text = date.dateString(dateFormate: "d MMM yyyy")
        delegate?.myclaimdate(cell: self, Section: section)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func LoadDatePickerCell(object: Questions, Section:Int){
        self.section  = Section
        self.question = object
        lblquestion.text = object.title
        txtclaimdate.placeholder = object.placeholder
        txtclaimdate.text = object.answerText 
        self.question = object
    }
    @IBAction func onClick_Calender(_ sender : Any){
        txtclaimdate.becomeFirstResponder()
    }
}
extension claimDatePickerCell : UITextViewDelegate, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "" {
            if textField == txtclaimdate{
                pickerChnaged(datePicker)
            }
        }
    }
}
