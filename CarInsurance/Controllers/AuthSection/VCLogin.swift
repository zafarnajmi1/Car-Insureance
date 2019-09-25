//
//  VCLogin.swift
//  CarInsurance
//
//  Created by Apple on 7/1/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

import SKActivityIndicatorView
class VCLogin: UIViewController {
let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var btnregisternow: UIButton!
    @IBOutlet weak var lbldonthaveaccount: UILabel!
    @IBOutlet weak var btnforgotpassword: UIButton!
    @IBOutlet weak var btnlogin: UIButton!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var lblpassword: UILabel!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var lblemail: UILabel!
    var myerrors =  [Errors]()
    override func viewDidLoad() {
        super.viewDidLoad()
      
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        self.setupView()
        self.setLoaclization()
    }
    
    func setupView(){
        self.title = "Login".localized
        self.setNavigationBar()
        self.addBackButton()
        self.navigationController?.navigationBar.isHidden = false;
        self.emailView.setcornerUiview(Corner: 10)
        self.passwordView.setcornerUiview(Corner: 10)
        self.btnlogin.setcornerButton(Corner: 10)
        
        lblemail.text = "Email".localized
        lblpassword.text = "Password".localized
        btnlogin.setTitle("Login".localized, for: .normal)
        btnforgotpassword.setTitle("Forgot your password?".localized, for: .normal)
        lbldonthaveaccount.text = "Don't have an account?".localized
        btnregisternow.setTitle("Register Now".localized, for: .normal)
    }

    func setLoaclization(){
        let tfs = [txtemail,txtpassword] as! [UITextField]
        AppLanguage.updateTextFieldsDirection(tfs)
        
    }
    
    
    
    
    
    @IBAction func LoginAction(_ sender: UIButton) {
        
        if isCheck(){
            
            self.LoginApiCall()
        }
    }
    
    
    func isCheck() -> Bool{
//        
        if(self.txtemail.text == ""){
            alertMessage(message: "Please Enter Email".localized, completionHandler:nil)
            return false
        }else if(self.txtpassword.text == ""){
            alertMessage(message: "Please Enter Password".localized, completionHandler:nil)
            return false
        }else if(self.txtemail.text?.isValidEmail1 == false){
            alertMessage(message: "Please Enter Valid Email".localized, completionHandler:nil)
            return false
        }else if((txtemail.text!.count > 128)){
            self.alertMessage(message: "Please Enter Valid Email".localized, completionHandler: nil)
            return false
        }
        
        return true
    }
    
    /*else if((txtpassword.text!.count < 6) || (txtpassword.text!.count > 32) ){
     self.alertMessage(message: "Password must be between 6-32 characters".localized, completionHandler: nil)
     return false
     
     }*/
    //MARK:- LoginAPiCall
    func LoginApiCall(){
        SKActivityIndicator.show()
        let dic: [String: Any] = ["email":self.txtemail.text!,"password":txtpassword.text!]
        
        userhandler.Login(parameter: dic, Success: {(rootProfile)in
           SKActivityIndicator.dismiss()

        
            
            if rootProfile.success ?? false == false {
                if rootProfile.message == "Validation failed." {
                    self.alertMessage(message: "Email or Password is Wrong".localized, completionHandler: nil)
                }
                else {
                    self.alertMessage(message: rootProfile.message!, completionHandler: nil)
                }
                return
            }
            
            //save Record
            AppUserDefault.shared.authmethod = "local"
            AppUserDefault.shared.AutoLogin = true
            AppUserDefault.shared.password = self.txtpassword.text
            
            AppUserDefault.shared.saveUserData(profile: rootProfile.data)
            
            
            if rootProfile.data?.isEmailVerified == false {
                self.moveonEmailverification()
                return
            }
            else {
                switch myDefaultAccount {
                case .customer:
                    self.moveonHome()
                case .organization:
                    self.appDelegate.moveToHome()
                default:
                    self.alertMessage(message: "Account Type not Found", completionHandler: nil)
                }
            }
          
        }, Falioure: {(error)in
            SKActivityIndicator.dismiss()
            self.alertMessage(message: error.message, completionHandler: nil)
            
        })
            
            
            
            
    }
    
    
    func moveonHome(){
        
        AppDelegate.appDelegate.moveToUserHome()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "VCTabbarHome") as! VCTabbarHome
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveonCompanyHome(){
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCCompanyHome") as! VCCompanyHome
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveonEmailverification(){
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCEmailverification") as! VCEmailverification
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    
    
    @IBAction func forgotAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCForgotpassword") as! VCForgotpassword
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func registerNowAction(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCRegister") as! VCRegister
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
