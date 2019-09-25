//
//  VCResetPassword.swift
//  CarInsurance
//
//  Created by Apple on 7/4/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  NVActivityIndicatorView
import SKActivityIndicatorView
class VCResetPassword: UIViewController, NVActivityIndicatorViewable {

    @IBOutlet weak var btnsubmit: UIButton!
    @IBOutlet weak var txtxconfirmpassword: UITextField!
    @IBOutlet weak var confirmpasswordView: UIView!
    @IBOutlet weak var lblbconfirmapassword: UILabel!
    @IBOutlet weak var txtxnewpassword: UITextField!
    @IBOutlet weak var newpasswordView: UIView!
    @IBOutlet weak var lblnewpassword: UILabel!
    @IBOutlet weak var txtcode: UITextField!
    @IBOutlet weak var codeView: UIView!
    @IBOutlet weak var lblentercode: UILabel!
    @IBOutlet weak var lbldescriptions: UILabel!
    var id = ""
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigationBar()
        self.addBackButton()
        self.setForgot()
        self.setLoaclization()
    }
    
    func setLoaclization() {
        
        let tfs = [txtcode,txtxnewpassword, txtxconfirmpassword] as! [UITextField]
        AppLanguage.updateTextFieldsDirection(tfs)
        
    }
    
    func setForgot(){
        
        self.title = "Reset Password".localized
        self.codeView.setcornerUiview(Corner: 10)
        self.newpasswordView.setcornerUiview(Corner: 10)
        self.confirmpasswordView.setcornerUiview(Corner: 10)
        self.btnsubmit.setcornerButton(Corner: 10)
        
        self.lbldescriptions.text = "Please enter verification code sent at your email address to activate account".localized
        lblentercode.text = "Enter Code".localized
        lblbconfirmapassword.text = "Enter Confirm Password".localized
        lblnewpassword.text = "Enter New Password".localized
        btnsubmit.setTitle("Submit".localized, for: .normal)
        
        
    }
    @IBAction func submitAcction(_ sender: UIButton) {
        if ischeckResetpassword(){
            
            self.RestePasswordApiCall()
            
        }
    }
    
    
    func ischeckResetpassword()-> Bool{
        
        if(self.txtcode.text == ""){
           
            self.alertMessage(message: "Please Enter Code".localized, completionHandler: nil)
            
            return false
        }else if(self.txtxnewpassword.text == ""){
            
            self.alertMessage(message: "Please Enter New Password".localized, completionHandler: nil)
            
            return false
        }else if(self.txtxconfirmpassword.text == ""){
            
            self.alertMessage(message: "Please Enter confirm Password".localized, completionHandler: nil)
            
            return false
        }else if(self.txtxnewpassword.text != self.txtxnewpassword.text){
            
            self.alertMessage(message: "Password Does Not Match".localized, completionHandler: nil)
            
            return false
        }
        
        return true
        
    }
    
    //MARK:- ResetPasswordAPiCall
    
    func RestePasswordApiCall(){
        let dic :[String:Any] = ["resetPasswordCode":self.txtcode.text!,
                                 "password":self.txtxnewpassword.text!,
                                 "passwordConfirmation": self.txtxconfirmpassword.text!,
                                 "_id": id]
        SKActivityIndicator.show()
        userhandler.Resetpassword(parameter: dic as NSDictionary, Success: {(Successresponse)in
            SKActivityIndicator.dismiss()
            if(Successresponse.success!){
                self.alertMessage(message: Successresponse.message!, completionHandler: {
                    
                    
                    self.moveonLogin()
                    
                })
                
                
            }else{
                SKActivityIndicator.dismiss()
                self.alertMessage(message: Successresponse.message!, completionHandler: nil)
                
            }
            
        }, Falioure: {(error)in
            
            SKActivityIndicator.dismiss()
            self.alertMessage(message: error.message, completionHandler: nil)
            
            
        })
        
        
        
    }
    
    func moveonLogin(){
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCLogin") as! VCLogin
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
