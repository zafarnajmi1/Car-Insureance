//
//  sharedata.swift
//  CarInsurance
//
//  Created by Apple on 7/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation



class AppUserDefault {
    static let shared = AppUserDefault()
    private init(){}
    
    
    var settingData : AppSettingsData?
    var questionListArray = [QuestionListData]()
    var sliderArray = [Sliders]()
    var addressList = [Addresses]()
     var UserInfoAddresses = [UserOrderDeatilAddresses]()
    var userData :getProfileData?
    private var unseenNotificationCount : Int = 0
    var unseenNotification : Int {
        set {
            
            unseenNotificationCount = newValue
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: NOTIFICATIONS_UPDATED), object: nil, userInfo: nil)
        }
        get{
            return unseenNotificationCount
        }
    }
    
    var password :String?
    {
        set
        {
            UserDefaults.standard.set(newValue , forKey: "password")
            UserDefaults.standard.synchronize()
            
        }
        get
        {
            return UserDefaults.standard.string(forKey:  "password")
        }
    }
    
    
    var FirstName :String?
    {
        set
        {
            UserDefaults.standard.set(newValue , forKey: "FirstName")
            UserDefaults.standard.synchronize()
            
        }
        get
        {
            return UserDefaults.standard.string(forKey:  "FirstName")
        }
    }
    
    var LastName :String?
    {
        set
        {
            UserDefaults.standard.set(newValue , forKey: "LastName")
            UserDefaults.standard.synchronize()
            
        }
        get
        {
            return UserDefaults.standard.string(forKey:  "LastName")
        }
    }
    
    
    var Email :String?
    {
        set
        {
            UserDefaults.standard.set(newValue , forKey: "Email")
            UserDefaults.standard.synchronize()
            
        }
        get
        {
            return UserDefaults.standard.string(forKey:  "Email")
        }
    }
    
    
    var accountType :String?
    {
        set
        {
            UserDefaults.standard.set(newValue , forKey: "accountType")
            UserDefaults.standard.synchronize()
            
        }
        get
        {
            return UserDefaults.standard.string(forKey:  "accountType")
        }
    }
    
    var token :String?
    {
        set
        {
            UserDefaults.standard.set(newValue , forKey: "token")
            UserDefaults.standard.synchronize()
            
        }
        get
        {
            return UserDefaults.standard.string(forKey:  "token")
        }
    }
    
    // cart Badge
    var notificationsCount : Int? {
        
        set{
            
            UserDefaults.standard.set(newValue, forKey:"notificationsCount" )
            UserDefaults.standard.synchronize()
        }
        get{
            return  UserDefaults.standard.integer(forKey: "notificationsCount")
            
        }
    }
    
    
    //SocalPart
    var socialAccessToken :String?
    {
        set
        {
            UserDefaults.standard.set(newValue , forKey: "socialAccessToken")
            UserDefaults.standard.synchronize()
            
        }
        get
        {
            return UserDefaults.standard.string(forKey:  "socialAccessToken")
        }
    }
    
    
    
    var socialID :String?
    {
        set
        {
            UserDefaults.standard.set(newValue , forKey: "socialID")
            UserDefaults.standard.synchronize()
            
        }
        get
        {
            return UserDefaults.standard.string(forKey:  "socialID")
        }
    }
    
    var authmethod :String?
    {
        set
        {
            UserDefaults.standard.set(newValue , forKey: "authmethod")
            UserDefaults.standard.synchronize()
            
        }
        get
        {
            return UserDefaults.standard.string(forKey:  "authmethod")
        }
    }
    
    
    var socialFiratName :String?
    {
        set
        {
            UserDefaults.standard.set(newValue , forKey: "socialFiratName")
            UserDefaults.standard.synchronize()
            
        }
        get
        {
            return UserDefaults.standard.string(forKey:  "socialFiratName")
        }
    }
    
    var socialLastName :String?
    {
        set
        {
            UserDefaults.standard.set(newValue , forKey: "socialLastName")
            UserDefaults.standard.synchronize()
            
        }
        get
        {
            return UserDefaults.standard.string(forKey:  "socialLastName")
        }
    }
    
    var socialemail :String?
    {
        set
        {
            UserDefaults.standard.set(newValue , forKey: "socialemail")
            UserDefaults.standard.synchronize()
            
        }
        get
        {
            return UserDefaults.standard.string(forKey:  "socialemail")
        }
    }
    
    
    var AutoLogin: Bool?
    {
        set{
            UserDefaults.standard.set(newValue , forKey: "isAutoLogin")
            UserDefaults.standard.synchronize()
            
        }
        get{
            
            return UserDefaults.standard.bool(forKey:  "isAutoLogin")
        }}
    
    var userId:String?{
        set{
            UserDefaults.standard.set(newValue , forKey: "userId")
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey:  "userId")
        }
    }
    
    
    var saveLanguage:String?{
        set{
            UserDefaults.standard.set(newValue , forKey: "saveLanguage")
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey:  "saveLanguage")
        }
    }
    
    
    var isLanguageRemembered:Bool?{
        set{
            UserDefaults.standard.set(newValue , forKey: "isLanguageRemembered")
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.bool(forKey:  "isLanguageRemembered")
        }
    }
    
    
    
    var isUpdatedCompany: Bool?
    {
        set{
            UserDefaults.standard.set(newValue , forKey: "isupdatedcompany")
            UserDefaults.standard.synchronize()
            
        }
        get{
            
            return UserDefaults.standard.bool(forKey:  "isupdatedcompany")
        }}
    
    var isUserupdate: Bool?
    {
        set{
            UserDefaults.standard.set(newValue , forKey: "isUserupdate")
            UserDefaults.standard.synchronize()
            
        }
        get{
            
            return UserDefaults.standard.bool(forKey:  "isUserupdate")
        }
        
    }
    
    var currency : String?
    {
        set
        {
            UserDefaults.standard.set(newValue , forKey: "currency")
            UserDefaults.standard.synchronize()
            
        }
        get
        {
            return UserDefaults.standard.string(forKey:  "currency")
        }
    }
    var fcmToken : String? {
        set {
            UserDefaults.standard.set(newValue, forKey:"fcmToken" )
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.string(forKey: "fcmToken")
        }
    }
    
    func saveUserData(profile: getProfileData?)  {
        guard let profile = profile else {
            print("User object not saved")
            return
        }
        UserDefaults.standard.set(profile.authorization, forKey: "userAuthToken")
        AppUserDefault.shared.addressList = profile.addresses ?? []
        AppUserDefault.shared.userId = profile._id
        AppUserDefault.shared.Email =  profile.email
        AppUserDefault.shared.FirstName = profile.firstName
        AppUserDefault.shared.LastName = profile.lastName
        AppUserDefault.shared.accountType = profile.role?._id
        AppUserDefault.shared.token = profile.authorization
        
       
//        SocketIOManager.sharedInstance.establishConnection()
        SocketIOManager.sharedInstance.setupAndEstablisConnection()
        // this ID is For Customer/ consumer
        if profile.role?._id == "5d08c0d814068021482f9d2d" {
            
            
            myDefaultAccount = .customer
            self.userData = profile
           
            return
        }
        
        // this id used for organization / consumer
        if profile.role?._id == "5d08c0d814068021482f9d2c" {
            
            myDefaultAccount = .organization
            self.userData = profile
            return
        }
        
        
     
    }
    
    func removeAllObjects() {
        //AppUserDefault.shared.isLanguageRemembered = nil
        AppUserDefault.shared.authmethod = nil
        AppUserDefault.shared.AutoLogin = false
        AppUserDefault.shared.notificationsCount = nil
        AppUserDefault.shared.userId = nil
        AppUserDefault.shared.password = nil
        AppUserDefault.shared.Email =  nil
        AppUserDefault.shared.accountType = nil
        AppUserDefault.shared.token = nil
        AppUserDefault.shared.FirstName = nil
        AppUserDefault.shared.LastName = nil
       
        AppUserDefault.shared.socialID = nil
        AppUserDefault.shared.socialAccessToken = nil
        UserDefaults.standard.set(nil, forKey: "userAuthToken")
        myDefaultAccount = .none
        
        SocketIOManager.sharedInstance.closeConnection()
    }
    
    
}




internal enum UploadResponse<progress,completion,failure> {
    case progress(Double)
    case path(String)
    case failure(String)
}


//extension UIViewController: NVActivityIndicatorViewable {
//    //MARK:- LodingMessage
//    func showNvLoader() {
////        self.startAnimating(CGSize(width: 35, height: 35), message:nil, messageFont: UIFont.systemFont(ofSize: 10), type: NVActivityIndicatorType.ballTrianglePath, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
//      self.startAnimating(Constant.activitySize.size, message: Constant.loaderMessages.loadingMessage.rawValue,messageFont: UIFont.systemFont(ofSize: 20), type: NVActivityIndicatorType.ballTrianglePath)
//    }
//
//    func hideNvloader() {
//        SKActivityIndicator.dismiss()
//    }
//    
//
//}
