//
//  VCContactUs.swift
//  CarInsurance
//
//  Created by Apple on 7/8/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  DropDown

import SKActivityIndicatorView
class VCContactUs: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var btnsend: UIButton!
   
    @IBOutlet weak var btndropwdown: UIButton!
    @IBOutlet weak var txtMessage: UITextView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var lblmessage: UILabel!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var txtLastNameView: UITextField!
    @IBOutlet weak var lastNameView: UIView!
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblFeedBack: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblHeading: UILabel!
    var mydropwdown = DropDown()
   let RISTRICTED_CHARACTERS = "'*=+[]\\|;:'\",<>/?%"
    // var mypickerview = UIPickerView()
    var feedBack = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         txtLastNameView.delegate = self
        txtFirstName.delegate = self
        txtMessage.delegate = self
        txtMessage.textColor = UIColor.lightGray
        txtMessage.text = "Write your message here".localized
       txtMessage.textColor = #colorLiteral(red: 0.5566827655, green: 0.5607631207, blue: 0.5648422837, alpha: 1)
       txtMessage.font = UIFont(name: "JosefinSans-Regular", size: 18)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.feedBack.removeAll()
        
        let mystring = AppUserDefault.shared.settingData?.settings!.contactFeedbackSelectors!
        let result = mystring?.components(separatedBy: "\n")
        
        for i in result ?? []{
            self.feedBack.append(i)
        }
       print(self.feedBack)
        self.SetViewContactUs()
        self.setLoaclization()
    }
    
    func setLoaclization(){
        
        let tfs = [txtEmail,txtFirstName, txtLastNameView] as! [UITextField]
        AppLanguage.updateTextFieldsDirection(tfs)
        
        
        let txtView = [txtMessage ] as! [UITextView]
        AppLanguage.updateTextViewsDirection(txtView)
        
        lblHeading.text = "What can we help you with?".localized
        lblFeedBack.text = "App Feedback".localized
        lblFirstName.text = "First Name".localized
        lblLastName.text = "Last Name".localized
        lblemail.text = "Email".localized
        lblmessage.text = "Message".localized
        btnsend.setTitle("Send".localized, for: .normal)
    }
    
    func SetViewContactUs(){
        
       self.title = "Contact Us".localized
        self.mainView.setcornerUiview(Corner: 0)
        self.btnsend.setcornerButton(Corner: 10)
        self.messageView.setcornerUiview(Corner: 10)
        self.emailView.setcornerUiview(Corner: 10)
        self.nameView.setcornerUiview(Corner: 10)
        self.lastNameView.setcornerUiview(Corner: 10)
        self.addBackButton()
       self.setNavigationBar()
        
        
        
        
    }

   func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.isFirstResponder {
            let validString = CharacterSet(charactersIn: " !@#$%^&*()_+{}[]|\"<>,.~`/:;?=\\¥'£•¢")
            
            if (txtFirstName.textInputMode?.primaryLanguage == "emoji") || txtFirstName.textInputMode?.primaryLanguage == nil {
                return false
            } else if (txtLastNameView.textInputMode?.primaryLanguage == "emoji") || txtLastNameView.textInputMode?.primaryLanguage == nil {
                return false
            }
            if let range = string.rangeOfCharacter(from: validString)
            {
                print(range)
                return false
            }
        }
        return true
    }
    
    
    
    @IBAction func DropDownAction(_ sender: UIButton) {
        
        
        
        mydropwdown.anchorView = btndropwdown
        mydropwdown.backgroundColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        mydropwdown.selectionBackgroundColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        mydropwdown.dataSource = self.feedBack
        DropDown.appearance().textColor = #colorLiteral(red: 0.5527616143, green: 0.5568413734, blue: 0.5609211326, alpha: 1)
        DropDown.appearance().textFont = UIFont(name: "JosefinSans-Regular", size: 18)!
        self.mydropwdown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            
            cell.optionLabel.text  = "  \(item)"
            
            if myDefaultLanguage == .en {
            cell.optionLabel.textAlignment = .left
               
                
            }else{
                cell.optionLabel.textAlignment = .right
                
                
            }
        }
        
        mydropwdown.bottomOffset = CGPoint(x: 0, y: btndropwdown.bounds.height)
        mydropwdown.selectionAction = {(index: Int, item: String) in
            
            self.lblFeedBack.text =  item
            
        }
        
        
        mydropwdown.show()
        
        
        
    }
    
    
   
    @IBAction func sendAction(_ sender: UIButton) {
        if ischeckContactUs(){
            
            self.ContactUsApiCall()
            
        }
    }
    
    
    func ischeckContactUs()-> Bool{
        
      if(self.txtFirstName.text == ""){
            self.alertMessage(message: "Please Enter First Name".localized, completionHandler: nil)
            return false
      }else if((txtFirstName.text!.count < 3) || (txtFirstName.text!.count > 30) ){
        self.alertMessage(message: " First Name Must be  3 to 30 Characters".localized, completionHandler: nil)
        return false
        }else if(self.txtLastNameView.text == ""){
            self.alertMessage(message: "Please Enter Last Name".localized, completionHandler: nil)
            return false
        }else if((txtLastNameView.text!.count < 3) || (txtLastNameView.text!.count > 30) ){
        self.alertMessage(message: "Last  Name Must be 3 to 30 Characters".localized, completionHandler: nil)
        return false
      }else if(self.txtEmail.text == ""){
            self.alertMessage(message: "Please Enter Email".localized, completionHandler: nil)
            return false
        }else if((txtEmail.text!.count > 128)){
            self.alertMessage(message: "Please Enter Valid Email".localized, completionHandler: nil)
            return false
        }else if(self.txtEmail.text!.isValidEmail1 == false){
            self.alertMessage(message: "Please Enter Valid Email".localized, completionHandler: nil)
            return false
        }else if(self.txtMessage.text == ""){
            self.alertMessage(message: "Please Enter Your Message".localized, completionHandler: nil)
            return false
      }else if(self.txtMessage.text.count <= 15){
        self.alertMessage(message: "Message Length too Short".localized, completionHandler: nil)
        return false
        }
        
        return true
        
    }
    
    
//COntactUs ApiCall
    func ContactUsApiCall(){
        let fullname  = self.txtFirstName.text! + " " + self.txtLastNameView.text!
        let dic : [String: Any] = ["fullName": fullname, "email":txtEmail.text!, "message": txtMessage.text!, "subject": lblFeedBack.text!]
         SKActivityIndicator.show()
        userhandler.contactUs(parameter: dic as NSDictionary, Success: {(Successresponse)in
           SKActivityIndicator.dismiss()
            if(Successresponse.success!){
                
                self.txtLastNameView.text = ""
                self.txtFirstName.text = ""
                self.txtEmail.text = ""
                
                self.txtMessage.text = ""
                self.alertMessage(message: Successresponse.message!, completionHandler: nil)
                
            }else{
                  SKActivityIndicator.dismiss()
                if(Successresponse.message == "Validation failed."){
                    self.alertMessage(message: "Somthing Went wrong! Please Check Your Email or Message  ".localized, completionHandler: nil)
                }else{
                    self.alertMessage(message: Successresponse.message!, completionHandler: nil)
                }
            }
            
        }, Falioure: {(error)in
              SKActivityIndicator.dismiss()
            self.alertMessage(message: error.message, completionHandler: nil)
            
        })
        
        
    }
    
    
}
extension VCContactUs: UITextViewDelegate{
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Write your message here".localized {
            textView.text = ""
            textView.textColor = #colorLiteral(red: 0.3529411765, green: 0.3568627451, blue: 0.3647058824, alpha: 1)
            textView.font = UIFont(name: "JosefinSans-Light", size: 18.0)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "Write your message here".localized
            textView.textColor = #colorLiteral(red: 0.3529411765, green: 0.3568627451, blue: 0.3647058824, alpha: 1)//UIColor.lightGray
            textView.font = UIFont(name: "JosefinSans-Light", size: 18.0)
        }
    }
    
    
    
    
    
    
}

//extension VCContactUs: UIPickerViewDelegate, UIPickerViewDataSource{
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return feedBack.count
//    }
//
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return feedBack[row]
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        lblFeedBack.text = feedBack[row]
//        self.mypickerview.isHidden = true
//    }
//
//
//
//
//}
