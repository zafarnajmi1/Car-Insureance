//
//  VCChangePassword.swift
//  CarInsurance
//
//  Created by Apple on 7/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  NVActivityIndicatorView
import SKActivityIndicatorView
class VCChangePassword: UIViewController,NVActivityIndicatorViewable {

      //var delegate: LeftMenuProtocol?
    @IBOutlet weak var brnsave: UIButton!
    @IBOutlet weak var txtconfirmnewpassword: UITextField!
    @IBOutlet weak var confirmpasswordUiview: UIView!
    @IBOutlet weak var lblconfirmnewpassword: UILabel!
    @IBOutlet weak var newpasswordUiview: UIView!
    @IBOutlet weak var txtnewpassword: UITextField!
    @IBOutlet weak var txtcurrentpassword: UITextField!
    @IBOutlet weak var lblnewpassword: UILabel!
    @IBOutlet weak var currentPAssowrdUiView: UIView!
    @IBOutlet weak var lblcurrentpasssword: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Change Password".localized
        self.setchnagePAsswordView()
        self.setNavigationBar()
        
        
       self.addBackButton()
      self.setLoaclization()
        
    }
    func setLoaclization(){
        
        let tfs = [txtnewpassword,txtcurrentpassword, txtconfirmnewpassword] as! [UITextField]
        AppLanguage.updateTextFieldsDirection(tfs)
        
        lblcurrentpasssword.text = "Current Password".localized
        lblnewpassword.text = "New Password".localized
        lblconfirmnewpassword.text = "Confirm New Password".localized
        brnsave.setTitle("Save".localized, for: .normal)
    }
    
    
    func setchnagePAsswordView(){
        self.brnsave.setcornerButton(Corner: 10)
        self.confirmpasswordUiview.setcornerUiview(Corner: 10)
        self.newpasswordUiview.setcornerUiview(Corner: 10)
        self.currentPAssowrdUiView.setcornerUiview(Corner: 10)
        
        
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        if ischeckchangepassword(){
            self.changePasswordApiCall()
            
        }
    }
    
    
    
    func ischeckchangepassword()-> Bool{
        if( self.txtcurrentpassword.text == ""){
            self.alertMessage(message: "Please Enter Your Current Password".localized, completionHandler: nil)
            return false
        }else if((txtcurrentpassword.text!.count < 6) || (txtcurrentpassword.text!.count > 32) ){
            self.alertMessage(message: "Password must be between 6-32 characters".localized, completionHandler: nil)
            return false
        }else if( self.txtnewpassword.text == ""){
            self.alertMessage(message: "Please Enter Your New Password".localized, completionHandler: nil)
            return false
        }else if((txtnewpassword.text!.count < 6) || (txtnewpassword.text!.count > 32) ){
            self.alertMessage(message: "New Password must be between 6-32 characters".localized, completionHandler: nil)
            return false
        }else if( self.txtconfirmnewpassword.text == ""){
            self.alertMessage(message: "Please Enter Your Confirm Password".localized, completionHandler: nil)
            return false
        }else if((txtconfirmnewpassword.text!.count < 6) || (txtconfirmnewpassword.text!.count > 32) ){
            self.alertMessage(message: "Confirm Password must be between 6-32 characters".localized, completionHandler: nil)
            return false
        }else if( self.txtconfirmnewpassword.text != self.txtnewpassword.text ){
            self.alertMessage(message: "New Password And Confirm New Password Should Be Same!".localized, completionHandler: nil)
            return false
        }
        
        return true
    }
    
    //MARK:- chnagePAsswordApiCall
    func changePasswordApiCall(){
        let dic : [String:Any] = ["currentPassword":self.txtcurrentpassword.text!,
                                  "password":txtnewpassword.text!,
                                  "passwordConfirmation":txtconfirmnewpassword.text!]
        SKActivityIndicator.show()
        userhandler.changepassword(parameter: dic as NSDictionary, Success: {(SuccessResponse)in
            SKActivityIndicator.dismiss()
            if(SuccessResponse.success!){
                AppUserDefault.shared.password = self.txtnewpassword.text!
                self.alertMessage(message: SuccessResponse.message!, completionHandler: {
                    self.navigationController?.popViewController(animated: true)
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
    
}
