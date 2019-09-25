//
//  VCRegister.swift
//  CarInsurance
//
//  Created by Apple on 7/2/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import DLRadioButton
import SKActivityIndicatorView
class VCRegister: UIViewController, UITextViewDelegate, UITextFieldDelegate {

//MARK: USER
    @IBOutlet weak var btnuserLoginNow: UIButton!
    @IBOutlet weak var lbluserAlreadyhaveAccount: UILabel!
    var usergender = ""
    @IBOutlet weak var lblusername: UILabel!
    @IBOutlet weak var usernameView: UIView!
    @IBOutlet weak var txtusername: UITextField!
    
    @IBOutlet weak var lbluserlastname: UILabel!
    
    @IBOutlet weak var userlastnameView: UIView!
    @IBOutlet weak var txtuserlastname: UITextField!
    
    @IBOutlet weak var txtuseremail: UITextField!
    @IBOutlet weak var useremailView: UIView!
    @IBOutlet weak var lbluseremail: UILabel!
    
    @IBOutlet weak var lbluserpassword: UILabel!
    
    @IBOutlet weak var userpasswordView: UIView!
    
    @IBOutlet weak var txtuserpassword: UITextField!
    
    @IBOutlet weak var lbluserConfirmpassword: UILabel!
    
    @IBOutlet weak var userconfirmPasswordView: UIView!
    
    @IBOutlet weak var txtuserConfirmpassword: UITextField!
    
    @IBOutlet weak var lblselectGender: UILabel!
    
    @IBOutlet weak var btnmale: DLRadioButton!
    
    @IBOutlet weak var btnFemale: DLRadioButton!
    @IBOutlet weak var btnUserSignUp: UIButton!
    
    //MARK:- Company
    
    @IBOutlet weak var lblcompanyname: UILabel!
    
    @IBOutlet weak var companyNameView: UIView!
    
    
    @IBOutlet weak var txtcompanyName: UITextField!
    
    @IBOutlet weak var lblcompanyEmail: UILabel!
    
    @IBOutlet weak var companyEmailView: UIView!
    
    @IBOutlet weak var txtcompanyEmail: UITextField!
    
    @IBOutlet weak var lblcompanypassword: UILabel!
    
    @IBOutlet weak var companypasswordView: UIView!
    @IBOutlet weak var txtcompanyPassword: UITextField!
    
    @IBOutlet weak var lblcompanyConfirmpassword: UILabel!
    
    @IBOutlet weak var cmpanyconfirmpasswordView: UIView!
    
    @IBOutlet weak var btncompanySignUp: UIButton!
    @IBOutlet weak var txtCompanyConforimpassword: UITextField!
    
    
    
    @IBOutlet weak var companyView: UIView!
    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var mysegmentedcontroll: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtuserlastname.delegate = self
        txtusername.delegate = self
        self.mysegmentedcontroll.selectedSegmentIndex = 0
    }
    override func viewWillAppear(_ animated: Bool) {
        self.setregisterView()
        self.setLoaclization()
    }
    
    func setLoaclization(){
        
        let tfs = [txtusername,txtuseremail, txtuserlastname,txtuserpassword,txtuserConfirmpassword] as! [UITextField]
        AppLanguage.updateTextFieldsDirection(tfs)
        
        lblusername.text = "First Name".localized
        lbluserlastname.text = "Last Name".localized
        lbluseremail.text = "Email".localized
        lbluserpassword.text = "Password".localized
        lbluserConfirmpassword.text = "Confirm Password".localized
        lbluserAlreadyhaveAccount.text = "Already  have an account?".localized
         btnmale.setTitle("Male".localized, for: .normal)
        btnFemale.setTitle("Female".localized, for: .normal)
        lblselectGender.text = "Select Gender".localized
        btnUserSignUp.setTitle("Sign Up".localized, for: .normal)
        btnuserLoginNow.setTitle("Login Now".localized, for: .normal)
        
    }
    
    func setregisterView(){
        self.addBackButton()
     
        self.title = "Register".localized
     self.mysegmentedcontroll.selectedSegmentIndex = 0
        self.userView.isHidden = false
        self.companyView.isHidden = true
        
        self.mysegmentedcontroll.defaultConfiguration(color: #colorLiteral(red: 0.6469054222, green: 0.8400972486, blue: 0.3769381642, alpha: 1))
        
        //MARK:- USER
        self.btnUserSignUp.setcornerButton(Corner: 10)
        self.useremailView.setcornerUiview(Corner: 10)
        self.usernameView.setcornerUiview(Corner: 10)
        self.userlastnameView.setcornerUiview(Corner: 10)
        self.userpasswordView.setcornerUiview(Corner: 10)
        self.userconfirmPasswordView.setcornerUiview(Corner: 10)
        
        //MARK:- COMPANY

        self.btncompanySignUp.setcornerButton(Corner: 10)
        self.companyNameView.setcornerUiview(Corner: 10)
        self.companyEmailView.setcornerUiview(Corner: 10)
        self.companypasswordView.setcornerUiview(Corner: 10)
        self.cmpanyconfirmpasswordView.setcornerUiview(Corner: 10)
        
        
        
        
        
    }
    
 @IBAction func segmentedaction(_ sender: UISegmentedControl) {
    switch mysegmentedcontroll.selectedSegmentIndex
    {
        case 0:
            self.userView.isHidden = false
            self.companyView.isHidden = true
        case 1:
            self.companyView.isHidden = false
            self.userView.isHidden = true
        
        default:
            break;
    }
    
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.isFirstResponder {
            let validString = CharacterSet(charactersIn: " !@#$%^&*()_+{}[]|\"<>,.~`/:;?=\\¥'£•¢")
            
            if (txtusername.textInputMode?.primaryLanguage == "emoji") || txtusername.textInputMode?.primaryLanguage == nil {
                return false
            } else if (txtuserlastname.textInputMode?.primaryLanguage == "emoji") || txtuserlastname.textInputMode?.primaryLanguage == nil {
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
    
    
    
    
    
    @IBAction func UserSignupAction(_ sender: UIButton) {
        
        if isregisterData(){
            
            self.RegisterApiCall()
        }
    }
    
    
    
    func isregisterData()-> Bool{
        
        if(self.txtusername.text == ""){
            self.alertMessage(message: "Please Enter First Name".localized, completionHandler: nil)
            return false
        }else if((txtusername.text!.count < 3) || (txtusername.text!.count > 30) ){
            self.alertMessage(message: "Please Enter First Name 3 to 35 Characters".localized, completionHandler: nil)
            return false
        }else if(self.txtuserlastname.text == ""){
            self.alertMessage(message: "Please Enter Last Name".localized, completionHandler: nil)
            return false
        }else if((txtuserlastname.text!.count < 3) || (txtuserlastname.text!.count > 30) ){
            self.alertMessage(message: "Please Enter Last Name 3 to 35 Characters".localized, completionHandler: nil)
            return false
        }else if(self.txtuseremail.text == ""){
            self.alertMessage(message: "Please Enter Email".localized, completionHandler: nil)
            return false
        }else if(self.txtuserpassword.text == ""){
            self.alertMessage(message: "Please Enter Password".localized, completionHandler: nil)
            return false
        }else if(self.txtuserConfirmpassword.text == ""){
            self.alertMessage(message: "Please Enter Confirm Password".localized, completionHandler: nil)
            return false
        }else if(self.txtuserConfirmpassword.text != self.txtuserpassword.text){
            self.alertMessage(message: "Password Does Not Match".localized, completionHandler: nil)
            return false
        }else if(self.txtuseremail.text!.isValidEmail1 == false){
            self.alertMessage(message: "Please Enter Valid Email".localized, completionHandler: nil)
            return false
        }else if((txtuserpassword.text!.count < 6) || (txtuserpassword.text!.count > 32) ){
            self.alertMessage(message: "Password must be between 6-32 characters".localized, completionHandler: nil)
            return false
        }else if((txtuserConfirmpassword.text!.count < 6) || (txtuserConfirmpassword.text!.count > 32) ){
            self.alertMessage(message: "Confirm Password must be between 6-32 characters".localized, completionHandler: nil)
            return false
        }else if((txtuseremail.text!.count > 128)){
            self.alertMessage(message: "Please Enter Valid Email".localized, completionHandler: nil)
            return false
        }
//        if (btnmale.isSelected == true){
//            self.usergender = "male".localized//(btnmale.isSelected) ? "male" : "female"
//        }else if(btnFemale.isSelected == true){
//            self.usergender == "female".localized
//        }else{
//
//            self.usergender = ""
//        }
        return true
        
    }
    
    
    
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if textField == txt_min {
//            let allowedCharacters = "1234567890"
//            let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
//            let typedCharacterSet = CharacterSet(charactersIn: string)
//            let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
//            let Range = range.length + range.location > (txt_min.text?.count)!
//
//            if Range == false && alphabet == false {
//                return false
//            }
//
//            let NewLength = (txt_min.text?.count)! + string.count - range.length
//            return NewLength <= 6
//        }else if textField == txt_max{
//
//            let allowedCharacters = "1234567890"
//            let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
//            let typedCharacterSet = CharacterSet(charactersIn: string)
//            let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
//            let Range = range.length + range.location > (txt_max.text?.count)!
//
//            if Range == false && alphabet == false {
//                return false
//            }
//
//            let NewLength = (txt_max.text?.count)! + string.count - range.length
//            return NewLength <= 10
//        }
//        return true
//    }
    
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//                guard let text = userMobileNoTextFiled.text else { return true }
//                let newLength = text.count + string.count - range.length
//                return newLength <= 10
//            }
    
    
    

    //MARK:- RegisterAPiCall
    func RegisterApiCall(){
        SKActivityIndicator.show()
        
                if (btnmale.isSelected == true){
                    self.usergender = "male".localized  //(btnmale.isSelected) ? "male" : "female"
                }else if(btnFemale.isSelected == true){
                    self.usergender = "female".localized
                }else{
        
                    self.usergender = ""
                }
        let dic :[String: Any] = ["firstName":txtusername.text!,
                                  "lastName":txtuserlastname.text!,
                                  "email":self.txtuseremail.text!,
                                  "password":txtuserpassword.text!,
                                  "passwordConfirmation":txtuserConfirmpassword.text!,
                                  "gender": self.usergender]
        
       userhandler.UserRegisteration(parameter: dic as NSDictionary, Success: {(rootProfile)in
        SKActivityIndicator.dismiss()
        if(rootProfile.success!){
            AppUserDefault.shared.userData = rootProfile.data
            AppUserDefault.shared.authmethod = "local"
            
//            self.txtusername.text = ""
//             self.txtuserlastname.text = ""
//            self.txtuseremail.text = ""
//             self.txtuserpassword.text = ""
//             self.txtuserConfirmpassword.text = ""
//             self.usergender = ""
//            self.btnmale.isSelected = false
//            self.btnFemale.isSelected = false
//
//             AppUserDefault.shared.password = self.txtuserpassword.text!
//            AppUserDefault.shared.Email =  self.txtuseremail.text
//            AppUserDefault.shared.accountType = rootProfile.data?.role?._id
//            AppUserDefault.shared.token = rootProfile.data?.authorization
//            AppUserDefault.shared.FirstName = rootProfile.data?.firstName
//            AppUserDefault.shared.LastName = rootProfile.data?.lastName
//
//
//
//
//
//            UserDefaults.standard.set(rootProfile.data?.authorization, forKey: "userAuthToken")
            self.alertMessage(message: rootProfile.message!, completionHandler: {
                self.moveonEmaiVerification()
            })
            
        }else{
            SKActivityIndicator.dismiss()
            if(rootProfile.message == "Validation failed."){
                self.alertMessage(message: "This email is already used try something else!".localized, completionHandler: nil)
            }else{
            self.alertMessage(message: rootProfile.message!, completionHandler: nil)
            }
        }
            
        }, Falioure: {(error)in
            SKActivityIndicator.dismiss()
            self.alertMessage(message: error.message, completionHandler: nil)
            
        })
    }
    
    
    func moveonEmaiVerification(){
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCEmailverification") as! VCEmailverification
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func moveonLogin(){
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCLogin") as! VCLogin
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func LoginNowActionUser(_ sender: UIButton) {
        
        self.moveonLogin()
        
    }
    
    @IBAction func companySignupAction(_ sender: UIButton) {
    }
    
    
}
