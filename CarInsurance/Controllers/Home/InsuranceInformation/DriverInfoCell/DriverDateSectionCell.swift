//
//  DriverDateSectionCell.swift
//  CarInsurance
//
//  Created by Apple on 7/25/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

protocol DriverDateProtocol {
    func driverdateget(cell: DriverDateSectionCell)
}
class DriverDateSectionCell: VehicalInfoBaseCell {

    var dateISOFormate = ""
    @IBOutlet weak var txtdrivedate: UITextField!
    @IBOutlet weak var mainDateView: UIView!
    @IBOutlet weak var lblheading: UILabel!
    var delegate:DriverDateProtocol?
    var datePicker = UIDatePicker()
    var UaeLicenceDate = UIDatePicker()
    var UAELicenseImg: UIImage?
    var cemeraimg = UIImagePickerController()
    var galleryimage = UIImagePickerController()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainDateView.setcornerUiview(Corner: 10)
        self.txtdrivedate.delegate = self
        datePicker.maximumDate = Date()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(pickerChnaged(_:)), for: UIControl.Event.valueChanged)
        txtdrivedate.inputView = datePicker
        let tfs = [txtdrivedate] as! [UITextField]
        AppLanguage.updateTextFieldsDirection(tfs)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    
    @objc func pickerChnaged(_ picker : UIDatePicker){
        if picker == datePicker {
            print("Date :\(picker.date)")
            setdateofBirthDate(date: datePicker.date)
        }else if picker == UaeLicenceDate {
            print("Date :\(picker.date)")
            setdateofBirthDate(date: UaeLicenceDate.date)
        }
    }
    
    
    
    
    
    
    func setdateofBirthDate(date : Date){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd,MMMM, yyyy" //HH:mm
        let stringDate = dateFormatter.string(from: date)
        self.txtdrivedate.text = stringDate
        
        
        
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
        delegate?.driverdateget(cell: self)
        
        
       
        
        
        
    }
    
    @IBAction func onClick_Calender(_ sender : Any){
        txtdrivedate.becomeFirstResponder()
    }
    
    func loadDriverCellDate(object: Questions){
        lblheading.text = object.title
         txtdrivedate.placeholder = object.placeholder
          txtdrivedate.text = question?.answerText
         self.question = object
    }
    
}
extension DriverDateSectionCell : UITextViewDelegate, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "" {
            if textField == txtdrivedate{
                pickerChnaged(datePicker)
            }
        }
    }
}
