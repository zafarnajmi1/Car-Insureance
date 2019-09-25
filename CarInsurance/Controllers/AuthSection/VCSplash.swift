//
//  ViewController.swift
//  CarInsurance
//
//  Created by Apple on 7/1/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  NVActivityIndicatorView
import SKActivityIndicatorView

enum accountType {
    case none
    case guest
    case customer
    case organization
}

var myDefaultAccount = accountType.none

class VCSplash: UIViewController,NVActivityIndicatorViewable {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.settingApiCall()
     
    }
    override func viewWillAppear(_ animated: Bool) {
        
        
        SocketIOManager.sharedInstance.setupSocket()
        SocketIOManager.sharedInstance.establishConnection()
        
        self.navigationController?.navigationBar.isHidden = true;
        
    }
    
    
    func moveOnLanguage(){
     let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCChangeLanguage") as! VCChangeLanguage
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //SettingsAppiCall
    func settingApiCall(){
       // SKActivityIndicator.show()
        
        userhandler.Settings(Success: {(SuccessResponse)in
          //  SKActivityIndicator.dismiss()
            if(SuccessResponse.success!){
                AppUserDefault.shared.settingData = SuccessResponse.data
                
                self.requestToFetchProfileByAcountType()
            
            }else{
               // SKActivityIndicator.dismiss()
                self.alertMessage(message: SuccessResponse.message ?? "", completionHandler: nil)
            }
        }, Falioure: {(error)in
           // SKActivityIndicator.dismiss()
             self.alertMessage(message: error.message, completionHandler: nil)
           
        })
        
    }
    
    
    
    func requestToFetchProfileByAcountType(){
        
    
        guard let autoLogin = AppUserDefault.shared.AutoLogin, let loginType = AppUserDefault.shared.authmethod else {
            
            if  AppUserDefault.shared.isLanguageRemembered == true {
                self.moveToLoginOptionVC()
                return
            }
            moveToChangeLanguage()
            return
        }
        
        if autoLogin == false {
            
            
            if  AppUserDefault.shared.isLanguageRemembered == true {
                self.moveToLoginOptionVC()
                return
            }
            
            moveToChangeLanguage()
            return
        }
       
        //if login is true then
        switch loginType {
            case "local":
                fetchProfileByAppLogin()
            case "google", "facebook", "instagram":
                fetchProfileBySocialLogin()
            default:
                moveToChangeLanguage()
        }
        
    }
        
            
            
    
    //MARK:- LoginAPiCall
  
    
    func fetchProfileByAppLogin(){
       
        guard let email = AppUserDefault.shared.Email, let password = AppUserDefault.shared.password else {
            moveToChangeLanguage()
            return
        }
        
        let dic: [String: Any] = ["email":email,"password":password]
        
        userhandler.Login(parameter: dic, Success: {(rootProfile)in
          
            if rootProfile.success ?? false == false && AppUserDefault.shared.isLanguageRemembered == true {
                self.moveToLoginOptionVC()
                return
            }
            
            if rootProfile.success ?? false == false {
                self.moveToChangeLanguage()
                return
            }
            
            AppUserDefault.shared.authmethod = "local"
            AppUserDefault.shared.AutoLogin = true
            AppUserDefault.shared.saveUserData(profile: rootProfile.data)
            
            
            if rootProfile.data?.isEmailVerified == false {
                 self.moveToEmailverification()
                 return
            }
                
            self.checkIfLanguageIsRemembered()
            
            
        }, Falioure: {(error)in
            SKActivityIndicator.dismiss()
            self.alertMessage(message: error.message, completionHandler: nil)
            
        })
        
    }

    
    
    
    func fetchProfileBySocialLogin(){
       
    
        guard let socialId = AppUserDefault.shared.socialID, let socialToken = AppUserDefault.shared.socialAccessToken , let authMethod = AppUserDefault.shared.authmethod else {
            moveToChangeLanguage()
            return
        }
       
        let dic: [String: Any] = ["id": socialId, "accessToken": socialToken, "authMethod": authMethod]
        userhandler.UserLoginWithSocial(parameter:dic  , Success: {(rootProfile)in
          
            if rootProfile.success ?? false == false && AppUserDefault.shared.isLanguageRemembered == true {
                self.moveToLoginOptionVC()
                return
            }
            
            if rootProfile.success ?? false == false {
                self.moveToChangeLanguage()
                return
            }
            
            AppUserDefault.shared.AutoLogin = true
            AppUserDefault.shared.saveUserData(profile: rootProfile.data)
            
            if rootProfile.data?.isEmailVerified == false {
                self.moveToEmailverification()
                return
            }
         
            self.checkIfLanguageIsRemembered()
            
        }, Falioure: {(error)in
          
            self.alertMessage(message: error.message, completionHandler: nil)
        })
        
        
   
    }
    
    
    fileprivate func checkIfLanguageIsRemembered() {
        if AppUserDefault.shared.isLanguageRemembered == true {
            
            switch myDefaultAccount {
            case .customer:
                self.moveToHome()
            case .organization:
                self.appDelegate.moveToHome()
            default:
                self.moveToLoginOptionVC()
            }
        }
            
        else {
            
            self.moveToChangeLanguage()
        }
    }
    
    
    
    
    
    func moveToChangeLanguage(){
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCChangeLanguage") as! VCChangeLanguage
        vc.isfromSetting = false
        vc.fromsplash = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func moveToHome(){
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "VCTabbarHome") as! VCTabbarHome
//        self.navigationController?.pushViewController(vc, animated: true)
        AppDelegate.appDelegate.moveToUserHome()
    }
    
//    func moveToCompanyHome(){
//
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "VCCompanyHome") as! VCCompanyHome
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
//
    func moveToEmailverification(){
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCEmailverification") as! VCEmailverification
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveToLoginOptionVC(){


        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCLoginORCreateAccount") as! VCLoginORCreateAccount
        self.navigationController?.pushViewController(vc, animated: true)
    }

    

}

