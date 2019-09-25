//
//  VCEmailverification.swift
//  CarInsurance
//
//  Created by Apple on 7/1/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  NVActivityIndicatorView
import SKActivityIndicatorView
class VCEmailverification: UIViewController , NVActivityIndicatorViewable{

    @IBOutlet weak var lblresendcode: UILabel!
    @IBOutlet weak var btnsubmit: UIButton!
    @IBOutlet weak var txtcode: UITextField!
    @IBOutlet weak var codeView: UIView!
    @IBOutlet weak var lblverificationcode: UILabel!
    @IBOutlet weak var lbldiscription: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Email Verification".localized
        self.setupView()
        self.requestToResendCode()
        self.setLoaclization()
    }
    
    func setLoaclization(){
        
        let tfs = [txtcode] as! [UITextField]
        AppLanguage.updateTextFieldsDirection(tfs)
        
    }
    
    func setupView(){
       self.addBackButton()

        self.codeView.setcornerUiview(Corner: 10)
        self.btnsubmit.setcornerButton(Corner: 10)
        lbldiscription.text = "Please enter verification code sent  at your email address to activate your account".localized
        lblresendcode.text = "Resend Code".localized
        lblverificationcode.text = "Verification Code".localized
        btnsubmit.setTitle("Submit".localized, for: .normal)
    }
    
    
    
    @IBAction func submitAction(_ sender: UIButton) {
        
        if iscode(){
            self.emailVerificationApiCall()
        }
    }
    
    @IBAction func resendCodeAction(_ sender: UIButton) {
        
        self.requestToResendCode()
    }
    
    
    func iscode() -> Bool{
        
        if(self.txtcode.text == ""){
            self.alertMessage(message: "Please Enter Code".localized, completionHandler: nil)
            return false
            
        }
        
        return true
    }
    
    
    //MARK:- VeroficationApiCall
    func emailVerificationApiCall(){
        let dic = ["verificationCode":self.txtcode.text]
        SKActivityIndicator.show()
        userhandler.emailVerification(parameter:dic as NSDictionary , Success: {(rootProfile)in
            SKActivityIndicator.dismiss()
            if rootProfile.success ?? false == false {
                
                if rootProfile.message == "Validation failed." {
                    self.alertMessage(message: "Invalid Code".localized, completionHandler: nil)
                }
                else {
                    self.alertMessage(message: rootProfile.message!, completionHandler: nil)
                }
                
                return
            }
            
            
         
            AppUserDefault.shared.AutoLogin = true
            AppUserDefault.shared.saveUserData(profile: rootProfile.data)
            
            
            switch myDefaultAccount {
            case .customer:
                self.alertMessage(message: rootProfile.message ?? "--", completionHandler: {
                    self.moveonHome()
                })
            case .organization:
                let app = UIApplication.shared.delegate as! AppDelegate
                app.moveToHome() // company VC root controller
            default:
                self.alertMessage(message: "Account Type not Found", completionHandler: nil)
            }
            
        }, Falioure: {(error)in
            SKActivityIndicator.dismiss()
            self.alertMessage(message: error.message, completionHandler: nil)
            
        })
        
            
            
//            SKActivityIndicator.dismiss()
//            if(successResponse.success!){
//
//
//                        UserDefaults.standard.set(successResponse.data?.authorization, forKey: "userAuthToken")
//                         AppUserDefault.shared.Email =  successResponse.data?.email
//
//                        AppUserDefault.shared.accountType = successResponse.data?.accountType
//                        AppUserDefault.shared.token = successResponse.data?.authorization
//                        self.moveonHome()
//
//            }else{
//                SKActivityIndicator.dismiss()
//                self.alertMessage(message: successResponse.message!, completionHandler: nil)
//            }
//
//        }, Falioure: {(error)in
//            SKActivityIndicator.dismiss()
//            self.alertMessage(message: error.message, completionHandler: nil)
//
//
//
//        })
        
        
    }
    
    
    //MARK:- ResendCodeAPICall
    func requestToResendCode(){
        SKActivityIndicator.show()
        userhandler.resendCode( Success: {(successResponse)in
            SKActivityIndicator.dismiss()
            if(successResponse.success!){
                
                self.alertMessage(message: successResponse.message!, completionHandler: nil)
            }else{
                 SKActivityIndicator.dismiss()
                self.alertMessage(message: successResponse.message!, completionHandler: nil)
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
    

}
