//
//  DateSectionCell.swift
//  CarInsurance
//
//  Created by Apple on 7/25/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

protocol DateProtocol {
    func mydate(cell:DateSectionCell)
}
class DateSectionCell: VehicalInfoBaseCell {

    
    var datePicker = UIDatePicker()
    @IBOutlet weak var txtDatePick: UITextField!
    @IBOutlet weak var mainViewDate: UIView!
    @IBOutlet weak var lbldate: UILabel!
    var delegate: DateProtocol?
    var dateISOFormate = ""
    var checkdateType: Bool?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainViewDate.setcornerUiview(Corner: 10)
        
        self.txtDatePick.delegate = self
        
        datePicker.minimumDate = Date()
        
        datePicker.datePickerMode = .date
        
        datePicker.addTarget(self, action: #selector(pickerChnaged(_:)), for: UIControl.Event.valueChanged)
        txtDatePick.inputView = datePicker
        let tfs = [txtDatePick] as! [UITextField]
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
        self.txtDatePick.text = stringDate
        
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
        delegate?.mydate(cell: self)
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func LoadDatePickerCell(object: Questions){
        self.question = object
        lbldate.text = object.title
          txtDatePick.placeholder = object.placeholder
            txtDatePick.text = object.answerText
        self.question = object
    }
    @IBAction func onClick_Calender(_ sender : Any){
        txtDatePick.becomeFirstResponder()
    }
    
}
extension DateSectionCell : UITextViewDelegate, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "" {
            if textField == txtDatePick{
                pickerChnaged(datePicker)
            }
        }
    }
}
