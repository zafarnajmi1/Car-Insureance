//
//  VCSettings.swift
//  CarInsurance
//
//  Created by Apple on 7/8/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import DLRadioButton

import SKActivityIndicatorView
class VCSettings: UIViewController {

    @IBOutlet weak var lblchat: UILabel!
    @IBOutlet weak var lblNotification: UILabel!
   
    @IBOutlet weak var lblquotes: UILabel!
    
    @IBOutlet weak var btnchatswitch: UISwitch!
    @IBOutlet weak var btnquotswitch: UISwitch!
    @IBOutlet weak var btnAED: DLRadioButton!
    @IBOutlet weak var btnUSD: DLRadioButton!
    @IBOutlet weak var lblchangecurrency: UILabel!
    @IBOutlet weak var lblCurrency: UILabel!
    @IBOutlet weak var lbllanguageChange: UILabel!
    @IBOutlet weak var lblChnageLanguage: UILabel!
    @IBOutlet weak var lbllanguage: UILabel!
    @IBOutlet weak var lblpasswordchange: UILabel!
    @IBOutlet weak var lblchnagepassword: UILabel!
    @IBOutlet weak var lblpassword: UILabel!
    @IBOutlet weak var subViewLanguage: UIView!
    @IBOutlet weak var subViewPassword: UIView!
    @IBOutlet weak var mainNotification: UIView!
    @IBOutlet weak var mainViewCurrency: UIView!
    @IBOutlet weak var mainViewLanguage: UIView!
    @IBOutlet weak var mainViewPAssword: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
      self.notificationSetting()
        if AppUserDefault.shared.currency == "usd"{
            btnUSD.isSelected =  true
            
        }else{
            btnAED.isSelected =  true
        }
    
       
        
    }
    

    
    fileprivate func notificationSetting() {
        
        let userData = AppUserDefault.shared.userData
        let chats = userData?.notificationsSetting?.chats == 1 ? true: false
        btnchatswitch.setOn(chats, animated: true)
        
        let quotes = userData?.notificationsSetting?.quotes == 1 ? true: false
        btnquotswitch.setOn(quotes, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        btnchatswitch.localized()
        btnquotswitch.localized()
         self.setNavigationBar()
        self.setViewSetting()
        
        
        lblpassword.text = "Password".localized
        lblchnagepassword.text = "Change Password".localized
        lblpasswordchange.text = "Change".localized
        
        lbllanguage.text = "Language".localized
        lblChnageLanguage.text = "Change Language".localized
        lbllanguageChange.text = "Change".localized
        
        lblCurrency.text = "Currency".localized
        lblchangecurrency.text = "Select Currency".localized
        lblNotification.text = "Notifications Settings".localized
        lblquotes.text = "Quotes".localized
        lblchat.text = "Chats".localized
    }
    
    func setViewSetting(){
        AppLanguage.updateUIScreenDirection()
        
        let guest = UserDefaults.standard.value(forKey: "Guest")
        
        if guest != nil {
            self.addBackButton()
           
            
        }else{
        
        
                if ( AppUserDefault.shared.accountType == "5d08c0d814068021482f9d2d"){
                    self.addBackButton()
                    
                }else{
                    
                    self.addMenuBackButton()
                    
                    
                }
            }
        
        self.title = "Settings".localized
       
            if guest != nil {
        
                self.mainViewPAssword.isHidden =  true
                self.mainNotification.isHidden = true
                
                self.mainViewCurrency.setcornerUiview(Corner: 5)
                self.mainViewLanguage.setcornerUiview(Corner: 5)
                self.subViewLanguage.setcornerUiviewNoborder(Corner: 5)
               
        
            }else{
                self.mainViewPAssword.isHidden =  false
                self.mainNotification.isHidden = false
                //btnswitch.setSwitchView(width: 50, height: 30)
                self.mainNotification.setcornerUiview(Corner: 5)
                self.mainViewCurrency.setcornerUiview(Corner: 5)
                self.mainViewLanguage.setcornerUiview(Corner: 5)
                self.mainViewPAssword.setcornerUiview(Corner: 5)
                self.subViewLanguage.setcornerUiviewNoborder(Corner: 5)
                self.subViewPassword.setcornerUiviewNoborder(Corner: 5)
        }
        
       
        
    }

    @IBAction func quoteSwitch(_ sender: UISwitch) {
        
        let status = btnquotswitch.isOn == true ? "true": "false"
        let params : [String: Any] = ["quotes": status]
        requestToUpdateNotificationSettings(params: params)
      
        
       
    }
    @IBAction func chatSwitch(_ sender: UISwitch) {
        
        let status = btnchatswitch.isOn == true ? "true": "false"
        let params : [String: Any] = ["chats": status]
        requestToUpdateNotificationSettings(params: params)
        
//        if(btnchatswitch.isOn == true){
//            let dic : [String: Any] = ["chats": "true"]
//            userhandler.notificationSettings(parameter: dic as NSDictionary, Success: {(successResponse)in
//                if(successResponse.success!){
//
//                }else{
//
//                }
//            }, Falioure: {(error)in
//
//            })
//        }else{
//            let dic : [String: Any] = ["chats": "false"]
//            userhandler.notificationSettings(parameter: dic as NSDictionary, Success: {(successResponse)in
//                if(successResponse.success!){
//
//                }else{
//
//                }
//            }, Falioure: {(error)in
//
//            })
//        }
    }
    
    @IBAction func changePasswordAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCChangePassword") as! VCChangePassword
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func ChangeLanguageAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCChangeLanguage") as! VCChangeLanguage
         vc.isfromSetting = true
         vc.fromsplash = false
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func usdAction(_ sender: DLRadioButton) {
        
       AppUserDefault.shared.currency = "usd"
    }
    
    
    @IBAction func aedAction(_ sender: DLRadioButton) {
      AppUserDefault.shared.currency = "aed"
    }
    
    
    
    func requestToUpdateNotificationSettings(params: [String: Any])  {
      
        SKActivityIndicator.show()
        userhandler.notificationSettings(parameter: params as NSDictionary, Success: {(response)in
            SKActivityIndicator.dismiss()
            if(response.success!){
                AppUserDefault.shared.userData = response.data
                print(response.message ?? "")
            }
            else{
                self.alertMessage(message: response.message ?? "", completionHandler: nil)
            }
            
        }, Falioure: {(error)in
            SKActivityIndicator.dismiss()
            self.alertMessage(message: error.message , completionHandler: nil)
        })
        
    }
    
}



