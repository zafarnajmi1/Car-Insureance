//
//  VCSocialLogin.swift
//  CarInsurance
//
//  Created by Apple on 7/2/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import DLRadioButton
import  NVActivityIndicatorView
import SKActivityIndicatorView
class VCSocialLogin: UIViewController, NVActivityIndicatorViewable {

    @IBOutlet weak var txtconfirmpassword: UITextField!
    @IBOutlet weak var confirmpasswordView: UIView!
    @IBOutlet weak var lblconfirmpassword: UILabel!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var lblpassword: UILabel!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnfemale: DLRadioButton!
    @IBOutlet weak var btnmale: DLRadioButton!
    @IBOutlet weak var lblselectgender: UILabel!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var txtlastname: UITextField!
    @IBOutlet weak var lastNameView: UIView!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var txtname: UITextField!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var lblName: UILabel!
    
    var usergender = ""
    var socialEmail = ""
    var accesstoken = ""
    var socialID = ""
    var socialfirstName = ""
    var socialLastName = ""
    var authmethod = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.setViewsocialLogin()
        self.setLoaclization()
    }
    
    
    func setLoaclization(){
        
        let tfs = [txtpassword,txtemail, txtname,txtconfirmpassword,txtlastname] as! [UITextField]
        AppLanguage.updateTextFieldsDirection(tfs)
        
    }
    
    func setViewsocialLogin(){
        self.addBackButton()
        self.title = "Login With \(authmethod)".localized
        self.btnSignUp.setcornerButton(Corner: 10)
        self.emailView.setcornerUiview(Corner: 10)
        self.lastNameView.setcornerUiview(Corner: 10)
        self.nameView.setcornerUiview(Corner: 10)
        self.emailView.setcornerUiview(Corner: 10)
        self.passwordView.setcornerUiview(Corner: 10)
        self.confirmpasswordView.setcornerUiview(Corner: 10)
        
        self.txtname.text =  socialfirstName
        //self.txtlastname.text = socialLastName
        self.txtemail.text = socialEmail
        
        
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
        if isSocialData(){
            
            self.SocialRegisterApiCall()
        }
    }
    
    
    func isSocialData()-> Bool{
        
        if(self.txtname.text == ""){
            self.alertMessage(message: "Please Enter First Name".localized, completionHandler: nil)
            return false
        }else if((txtname.text!.count < 3) || (txtname.text!.count > 30) ){
            self.alertMessage(message: "Please Enter First Name 3 to 35 Characters".localized, completionHandler: nil)
            return false
        }else if((txtlastname.text!.count < 3) || (txtlastname.text!.count > 30) ){
            self.alertMessage(message: "Please Enter Last Name 3 to 35 Characters".localized, completionHandler: nil)
            return false
        }else if(self.txtlastname.text == ""){
            self.alertMessage(message: "Please Enter Last Name".localized, completionHandler: nil)
            return false
        }else if(self.txtemail.text == ""){
            self.alertMessage(message: "Please Enter Email".localized, completionHandler: nil)
            return false
        }else if(self.txtpassword.text == ""){
            self.alertMessage(message: "Please Enter Password".localized, completionHandler: nil)
            return false
        }else if(self.txtconfirmpassword.text == ""){
            self.alertMessage(message: "Please Enter Confirm Password".localized, completionHandler: nil)
            return false
        }else if(self.txtconfirmpassword.text != self.txtpassword.text){
            self.alertMessage(message: "Password Does Not Match".localized, completionHandler: nil)
            return false
        }else if(self.txtemail.text!.isValidEmail1 == false){
            self.alertMessage(message: "Please Enter Valid Email".localized, completionHandler: nil)
            return false
        }
        else if((txtpassword.text!.count < 6) || (txtpassword.text!.count > 32) ){
            self.alertMessage(message: "Password must be between 6-32 characters".localized, completionHandler: nil)
            return false
        }else if((txtconfirmpassword.text!.count < 6) || (txtconfirmpassword.text!.count > 32) ){
            self.alertMessage(message: "Confirm Password must be between 6-32 characters".localized, completionHandler: nil)
            return false
        }else if((txtemail.text!.count > 128)){
            self.alertMessage(message: "Please Enter Valid Email".localized, completionHandler: nil)
            return false
        }
        return true
        
    }
    
   
    //MARK:- RegisterAPiCall
    func SocialRegisterApiCall(){
        SKActivityIndicator.show()
        
        if (btnmale.isSelected == true){
            self.usergender = "male".localized  //(btnmale.isSelected) ? "male" : "female"
        }else if(btnfemale.isSelected == true){
            self.usergender = "female".localized
        }else{
            
            self.usergender = ""
        }
        let dic :[String: Any] = ["firstName":txtname.text!,
                                  "lastName":txtlastname.text!,
                                  "email":self.txtemail.text!,
                                  "password":txtpassword.text!,
                                  "passwordConfirmation":txtconfirmpassword.text!,
                                  "gender": self.usergender,"id":socialID,
                                  "accessToken":accesstoken,
                                  "authMethod":authmethod]
        
        userhandler.UserRegisteration(parameter: dic as NSDictionary, Success: {(rootProfile)in
            SKActivityIndicator.dismiss()
            
            if rootProfile.success ?? false == false {
               
                if rootProfile.message == "Validation failed." {
                    self.alertMessage(message: "This Email already exists, try something else.".localized, completionHandler: nil)
                }
                else {
                    self.alertMessage(message: rootProfile.message!, completionHandler: nil)
                }
                
                return
            }
            
            
            AppUserDefault.shared.authmethod = self.authmethod
            AppUserDefault.shared.AutoLogin = true
            AppUserDefault.shared.saveUserData(profile: rootProfile.data)
            
            if rootProfile.data?.isEmailVerified == false {
                self.moveToEmailverification()
                return
            }
          
            
            switch myDefaultAccount {
            case .customer:
                self.alertMessage(message: rootProfile.message ?? "--", completionHandler: {
                    self.moveonHome()
                })
            case .organization:
               self.alertMessage(message: "Organization Account Registered! unable to move next", completionHandler: nil)
            default:
                self.alertMessage(message: "Account Type not Found", completionHandler: nil)
            }
             
        }, Falioure: {(error)in
            SKActivityIndicator.dismiss()
            self.alertMessage(message: error.message, completionHandler: nil)
            
        })
            
            
        
            
            
//            if(rootProfile.success!){
//
//                UserDefaults.standard.set(rootProfile.data?.authorization, forKey: "userAuthToken")
//
//
//
//                AppUserDefault.shared.password = self.txtpassword.text
//                AppUserDefault.shared.Email =  self.txtemail.text
//                AppUserDefault.shared.accountType = rootProfile.data?.role?._id
//                AppUserDefault.shared.token = rootProfile.data?.authorization
//                AppUserDefault.shared.FirstName = rootProfile.data?.firstName
//                AppUserDefault.shared.LastName = rootProfile.data?.lastName
//                AppUserDefault.shared.authmethod = self.authmethod
//                AppUserDefault.shared.AutoLogin = true
//
//                AppUserDefault.shared.socialAccessToken = self.accesstoken
//                AppUserDefault.shared.socialID = self.socialID
//
//                self.txtname.text = ""
//                self.txtlastname.text = ""
//                self.txtemail.text = ""
//                self.txtpassword.text = ""
//                self.txtconfirmpassword.text = ""
//                 self.usergender = ""
//                 self.socialID = ""
//                self.accesstoken = ""
//                self.authmethod = ""
//                self.btnmale.isSelected = false
//                self.btnfemale.isSelected = false
//
//
//
//                self.alertMessage(message: rootProfile.message!, completionHandler: {
//
//                    self.moveonHome()
//                })
//
//            }else{
//
//                SKActivityIndicator.dismiss()
//                if(rootProfile.message == "Validation failed."){
//                    self.alertMessage(message: " This Email already exists, try something else.".localized, completionHandler: nil)
//                }else{
//                     self.alertMessage(message: rootProfile.message!, completionHandler: nil)
//                }
//            }
//
//        }, Falioure: {(error)in
//            SKActivityIndicator.dismiss()
//            self.alertMessage(message: error.message, completionHandler: nil)
//
//        })
    }
    
    
    func moveonHome(){
        
        AppDelegate.appDelegate.moveToUserHome()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "VCTabbarHome") as! VCTabbarHome
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveToEmailverification(){
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCEmailverification") as! VCEmailverification
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
