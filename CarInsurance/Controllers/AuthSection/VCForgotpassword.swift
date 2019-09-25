//
//  VCForgotpassword.swift
//  CarInsurance
//
//  Created by Apple on 7/1/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  NVActivityIndicatorView
import SKActivityIndicatorView
class VCForgotpassword: UIViewController, NVActivityIndicatorViewable {

    
    @IBOutlet weak var btnrecover: UIButton!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var lbldiscription: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.setviewForgot()
        self.setLoaclization()
    }
    
    func setLoaclization(){
        
        let tfs = [txtemail] as! [UITextField]
        AppLanguage.updateTextFieldsDirection(tfs)
        
    }
    func setviewForgot(){
        self.title = "Forgot Password".localized
       self.addBackButton()
        self.emailView.setcornerUiview(Corner: 10)
        self.btnrecover.setcornerButton(Corner: 10)
        
        lbldiscription.text = "Enter your email address below to recover your password".localized
        lblemail.text = "Email".localized
        btnrecover.setTitle("Recover".localized, for: .normal)
    }
    
    @IBAction func recoverAction(_ sender: UIButton) {
        if isCheckForGot(){
            
            self.forgotPasswordApiCall()
        }
    }
    
    
    func isCheckForGot() -> Bool{
        
        if(self.txtemail.text == ""){
            alertMessage(message: "Please Enter Email".localized, completionHandler:nil)
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
    
    

    
    
    //MARK:- ForGotPAsswordAPiCall
    func forgotPasswordApiCall(){
        
        let dic :[String: Any] = ["email": self.txtemail.text!]
        SKActivityIndicator.show()
        userhandler.UserForgotPassword(parameter: dic as NSDictionary, Success: {(SuccessResponse)in
            SKActivityIndicator.dismiss()
            
            if(SuccessResponse.success!){
                self.alertMessage(message: SuccessResponse.message!, completionHandler: {
                    
                    self.moveOnResetPAssword(id: SuccessResponse.data!._id!)
                    
                })
                
            }else{
                SKActivityIndicator.dismiss()
                 self.alertMessage(message: SuccessResponse.message!, completionHandler: nil)
                
            }
        }, Falioure: {(error)in
            
            SKActivityIndicator.dismiss()
            
            self.alertMessage(message: error.message, completionHandler: nil)
        })
        
        
    }
    
    func moveOnResetPAssword(id:String){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCResetPassword") as! VCResetPassword
        vc.id = id
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}
