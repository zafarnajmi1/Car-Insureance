//
//  Userhandler.swift
//  CarInsurance
//
//  Created by Apple on 7/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit
import AlamofireObjectMapper
import Alamofire




class userhandler {
    
    class func Login(parameter : [String: Any], Success : @escaping (getProfile)->Void, Falioure: @escaping (NetworkError)-> Void)
    {
        let  url = Constant.MainUrl + Constant.URLs.Login
        print(url)
        
        var myParams = parameter
        if let fcm = AppUserDefault.shared.fcmToken {
            myParams.updateValue(fcm, forKey: "fcm")
        }
        
        Networkhandler.PostRequiest(url: url, parameters: myParams , success: { (success)  in
            let dictionaryData = success as! [String : AnyObject]
            let ResponseData = getProfile.init(dictionary: dictionaryData as NSDictionary)
            print(ResponseData!)
            Success(ResponseData!)
            
            
        }, Falioure: {(error) in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
    }
    
    
    
    class func logout(response : @escaping (getProfile)->Void, failure: @escaping (NetworkError)-> Void)
    {
        
        guard let fcm = AppUserDefault.shared.fcmToken else {
            failure(NetworkError(status: Constant.NetworkErrorType.generic, message: "Token not found"))
            return
        }
        
        let  url = Constant.MainUrl + Constant.URLs.logout + fcm
        print("Logut URL: \(url)")

        
        Networkhandler.GetRequiest(url: url, parameters: nil , success: { (success)  in
            let dictionaryData = success as! [String : AnyObject]
            let ResponseData = getProfile.init(dictionary: dictionaryData as NSDictionary)
            print(ResponseData!)
            response(ResponseData!)
            
            
        }, Falioure: {(error) in
            
            failure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
    }
    
    
    class func emailVerification(parameter : NSDictionary, Success : @escaping (getProfile)->Void, Falioure: @escaping (NetworkError)-> Void)
    {
        let  url = Constant.MainUrl + Constant.URLs.emailverification
        print(url)
        Networkhandler.PostRequiest(url: url, parameters: parameter as? Parameters, success: { (success)  in
            let dictionaryData = success as! [String : AnyObject]
            let ResponseData = getProfile.init(dictionary: dictionaryData as NSDictionary)
            print(ResponseData!)
            Success(ResponseData!)
            
            
        }, Falioure: {(error) in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
    }
    
    class func resendCode( Success : @escaping (ResendCode)->Void, Falioure: @escaping (NetworkError)-> Void)
    {
        let  url = Constant.MainUrl + Constant.URLs.ResendCode
        print(url)
        Networkhandler.PostRequiest(url: url, parameters:nil, success: { (success)  in
            let dictionaryData = success as! [String : AnyObject]
            let ResponseData = ResendCode.init(dictionary: dictionaryData as NSDictionary)
            print(ResponseData!)
            Success(ResponseData!)
            
            
        }, Falioure: {(error) in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
    }
    
    
    class func UserRegisteration(parameter : NSDictionary, Success : @escaping (getProfile)->Void, Falioure: @escaping (NetworkError)-> Void)
    {
        let  url = Constant.MainUrl + Constant.URLs.Register
        print(url)
        Networkhandler.PostRequiest(url: url, parameters: parameter as? Parameters, success: { (success)  in
            let dictionaryData = success as! [String : AnyObject]
            let ResponseData = getProfile.init(dictionary: dictionaryData as NSDictionary)
            print(ResponseData!)
            Success(ResponseData!)
            
            
        }, Falioure: {(error) in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
    }
    
    class func UserLoginWithSocial(parameter : [String: Any], Success : @escaping (getProfile)->Void, Falioure: @escaping (NetworkError)-> Void)
    {
        
    
        let  url = Constant.MainUrl + Constant.URLs.socialLoginUrl
        print(url)
    
        var myParams = parameter
        if let fcm = AppUserDefault.shared.fcmToken {
            myParams.updateValue(fcm, forKey: "fcm")
        }
        
        
        Networkhandler.PostRequiest(url: url, parameters: myParams, success: { (success)  in
            let dictionaryData = success as! [String : AnyObject]
            let ResponseData = getProfile.init(dictionary: dictionaryData as NSDictionary)
            print(ResponseData!)
            Success(ResponseData!)
            
            
        }, Falioure: {(error) in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
    }
    
    
    class func UserForgotPassword(parameter : NSDictionary, Success : @escaping (forgotPassword)->Void, Falioure: @escaping (NetworkError)-> Void)
    {
        let  url = Constant.MainUrl + Constant.URLs.forgotPasswordUrl
        print(url)
        Networkhandler.PostRequiest(url: url, parameters: parameter as? Parameters, success: { (success)  in
            let dictionaryData = success as! [String : AnyObject]
            let ResponseData = forgotPassword.init(dictionary: dictionaryData as NSDictionary)
            print(ResponseData!)
            Success(ResponseData!)
            
            
        }, Falioure: {(error) in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
    }
    
    
    class func Resetpassword(parameter : NSDictionary, Success : @escaping (ResetPAssword)->Void, Falioure: @escaping (NetworkError)-> Void)
    {
        let  url = Constant.MainUrl + Constant.URLs.resetpasswordurl
        print(url)
        Networkhandler.PostRequiest(url: url, parameters: parameter as? Parameters, success: { (success)  in
            let dictionaryData = success as! [String : AnyObject]
            let ResponseData = ResetPAssword.init(dictionary: dictionaryData as NSDictionary)
            print(ResponseData!)
            Success(ResponseData!)
            
            
        }, Falioure: {(error) in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
    }
    
    //SettingAppi
    
    class func Settings(Success: @escaping (AppSettings) -> Void, Falioure: @escaping (NetworkError)-> Void )
    {
        let url = Constant.MainUrl + Constant.URLs.Setting
        print(url)
        Networkhandler.GetRequiest(url: url, parameters: nil, success: {(successResponse)in
            
            let SplashResponse = successResponse as! [String : AnyObject]
            let splashdictionary = AppSettings.init(dictionary: SplashResponse as NSDictionary)
            print(splashdictionary!)
            Success(splashdictionary!)
        }, Falioure: {(error)in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
        
    }
    
    
    class func aboutUs(slug:String,Success: @escaping (aboutUS) -> Void, Falioure: @escaping (NetworkError)-> Void )
    {
        let url = Constant.MainUrl + Constant.URLs.pagesUrl + slug
        print(url)
        Networkhandler.GetRequiest(url: url, parameters: nil, success: {(successResponse)in
            
            let SplashResponse = successResponse as! [String : AnyObject]
            let splashdictionary = aboutUS.init(dictionary: SplashResponse as NSDictionary)
            print(splashdictionary!)
            Success(splashdictionary!)
        }, Falioure: {(error)in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
        
    }
    
    class func privacyPolicys(slug:String,Success: @escaping (privacyPolicy) -> Void, Falioure: @escaping (NetworkError)-> Void )
    {
        let url = Constant.MainUrl + Constant.URLs.pagesUrl + slug
        print(url)
        Networkhandler.GetRequiest(url: url, parameters: nil, success: {(successResponse)in
            
            let SplashResponse = successResponse as! [String : AnyObject]
            let splashdictionary = privacyPolicy.init(dictionary: SplashResponse as NSDictionary)
            print(splashdictionary!)
            Success(splashdictionary!)
        }, Falioure: {(error)in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
        
    }
    
    
    
    class func termsandContion(slug:String,Success: @escaping (TermsAndConditions) -> Void, Falioure: @escaping (NetworkError)-> Void )
    {
        
        let url = Constant.MainUrl + Constant.URLs.pagesUrl + slug
        print(url)
        Networkhandler.GetRequiest(url: url, parameters: nil, success: {(successResponse)in
            
            let SplashResponse = successResponse as! [String : AnyObject]
            let splashdictionary = TermsAndConditions.init(dictionary: SplashResponse as NSDictionary)
            print(splashdictionary!)
            Success(splashdictionary!)
        }, Falioure: {(error)in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
        
    }
    
    
    //ContactUsApi
    
    class func contactUs(parameter : NSDictionary, Success : @escaping (ContactUs)->Void, Falioure: @escaping (NetworkError)-> Void)
    {
        let  url = Constant.MainUrl + Constant.URLs.ContactUS
        print(url)
        Networkhandler.PostRequiest(url: url, parameters: parameter as? Parameters, success: { (success)  in
            let dictionaryData = success as! [String : AnyObject]
            let ResponseData = ContactUs.init(dictionary: dictionaryData as NSDictionary)
            print(ResponseData!)
            Success(ResponseData!)
            
            
        }, Falioure: {(error) in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
    }
    
    
    //MARK:- GetProfile
    
    
    class func getUserProfile(Success: @escaping (getProfile) -> Void, Falioure: @escaping (NetworkError)-> Void )
    {
        let url = Constant.MainUrl + Constant.URLs.GetProfile
        print(url)
        Networkhandler.GetRequiest(url: url, parameters: nil, success: {(successResponse)in
            
            let SplashResponse = successResponse as! [String : AnyObject]
            let splashdictionary = getProfile.init(dictionary: SplashResponse as NSDictionary)
            print(splashdictionary!)
            Success(splashdictionary!)
        }, Falioure: {(error)in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
        
    }
    
    
    
//    //MARK:- UpdateProfile
//    class  func  updateUserProfile( params: NSDictionary,userimg: UIImage,success: @escaping (updateProfile) -> Void,Falioure: @escaping (NetworkError) -> Void ) {
//        let  RegisterUrl = Constant.MainUrl + Constant.URLs.UpdateProfile
//        print(RegisterUrl)
//        Networkhandler.UploadData(url: RegisterUrl,parameters: params as? Parameters, userimg: userimg , Progress: {( progress )in
//
//        }, Success: {(successResponse) in
//
//            let UserDictionary = successResponse  as! [String:Any];
//
//            let userObject = NSKeyedArchiver.archivedData(withRootObject: UserDictionary)
//            UserDefaults.standard.set(userObject, forKey: "user")
//            UserDefaults.standard.synchronize()
//
//            let Responsedata = updateProfile.init(dictionary: UserDictionary as NSDictionary)
//            print(Responsedata!)
//            success(Responsedata!)
//        }, Falioure: {(error) in
//            print(error,"This is the Server Response")
//            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
//
//        })
//
//    }
    
    
    //MARK:companyProfileupadat
    class func updateUserProfile(parameter : NSDictionary, Success : @escaping (getProfile)->Void, Falioure: @escaping (NetworkError)-> Void)
    {
        let  url = Constant.MainUrl + Constant.URLs.UpdateProfile
        
        print(url)
        Networkhandler.PostRequiest(url: url, parameters: parameter as? Parameters, success: { (success)  in
            let dictionaryData = success as! [String : AnyObject]
            let ResponseData = getProfile.init(dictionary: dictionaryData as NSDictionary)
            print(ResponseData!)
            Success(ResponseData!)
            
            
        }, Falioure: {(error) in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
    }
    
    
    
    //chnagePAsswordApi
    
    class func changepassword(parameter : NSDictionary, Success : @escaping (changeuserPassword)->Void, Falioure: @escaping (NetworkError)-> Void)
    {
        let  url = Constant.MainUrl + Constant.URLs.ChangePassword
        print(url)
        Networkhandler.PostRequiest(url: url, parameters: parameter as? Parameters, success: { (success)  in
            let dictionaryData = success as! [String : AnyObject]
            let ResponseData = changeuserPassword.init(dictionary: dictionaryData as NSDictionary)
            print(ResponseData!)
            Success(ResponseData!)
            
            
        }, Falioure: {(error) in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
    }
    
    
    
    //GetQuestionList
    
    class func getQuestionListUser(Success: @escaping (QuestionList) -> Void, Falioure: @escaping (NetworkError)-> Void )
    {
        let url = Constant.MainUrl + Constant.URLs.getQuestionListurl
        print(url)
        Networkhandler.GetRequiest(url: url, parameters: nil, success: {(successResponse)in
            
            let SplashResponse = successResponse as! [String : AnyObject]
            let splashdictionary = QuestionList.init(dictionary: SplashResponse as NSDictionary)
            print(splashdictionary!)
            Success(splashdictionary!)
        }, Falioure: {(error)in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
        
    }
    
    
    
    //MARK:OrderFilter Get
    class func ordersFilterGet(status: String,pagenumber : Int,Success: @escaping (OrderFilters) -> Void, Falioure: @escaping (NetworkError)-> Void )
    {
        let url = Constant.MainUrl + Constant.URLs.OrderFiltersUrl + "?page=" + "\(pagenumber)" + "&status=" + status
        print(url)
        Networkhandler.GetRequiest(url: url, parameters: nil, success: {(successResponse)in
            
            let SplashResponse = successResponse as! [String : AnyObject]
            let splashdictionary = OrderFilters.init(dictionary: SplashResponse as NSDictionary)
            print(splashdictionary!)
            Success(splashdictionary!)
        }, Falioure: {(error)in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
        
    }
    
    
    //MARK:OrderSave
    
    class func userOrderSave(parameter : NSDictionary, Success : @escaping (OrderSave)->Void, Falioure: @escaping (NetworkError)-> Void)
    {
        let  url = Constant.MainUrl + Constant.URLs.OrderSave
        
        print(url)
        Networkhandler.PostRequiest(url: url, parameters: parameter as? Parameters, success: { (success)  in
            let dictionaryData = success as! [String : AnyObject]
            let ResponseData = OrderSave.init(dictionary: dictionaryData as NSDictionary)
            print(ResponseData!)
            Success(ResponseData!)
            
            
        }, Falioure: {(error) in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
    }
    
    
    //MARK:UserOrderDetail
    class func userorderdetailget(parameter : NSDictionary, Success : @escaping (UserOrderDeatil)->Void, Falioure: @escaping (NetworkError)-> Void)
    {
        let  url = Constant.MainUrl + Constant.URLs.UserOrderdetail
        
        print(url)
        Networkhandler.PostRequiest(url: url, parameters: parameter as? Parameters, success: { (success)  in
            let dictionaryData = success as! [String : AnyObject]
            let ResponseData = UserOrderDeatil.init(dictionary: dictionaryData as NSDictionary)
            print(ResponseData!)
            Success(ResponseData!)
            
            
        }, Falioure: {(error) in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
    }
    
    
    
    
    //MARK:SendQuotQuestions Get
    class func sendqutequestioncompany(Success: @escaping (sendquoteQuestions) -> Void, Falioure: @escaping (NetworkError)-> Void )
    {
        let url = Constant.MainUrl + Constant.URLs.sendquotquestionurl
        print(url)
        Networkhandler.GetRequiest(url: url, parameters: nil, success: {(successResponse)in
            
            let SplashResponse = successResponse as! [String : AnyObject]
            let splashdictionary = sendquoteQuestions.init(dictionary: SplashResponse as NSDictionary)
            print(splashdictionary!)
            Success(splashdictionary!)
        }, Falioure: {(error)in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
        
    }
    
    
    
    //MARK:SendQuot
    class func companysendqout(parameter : NSDictionary, Success : @escaping (sendQuot)->Void, Falioure: @escaping (NetworkError)-> Void)
    {
        let  url = Constant.MainUrl + Constant.URLs.sendqouturl
        
        print(url)
        Networkhandler.PostRequiest(url: url, parameters: parameter as? Parameters, success: { (success)  in
            let dictionaryData = success as! [String : AnyObject]
            let ResponseData = sendQuot.init(dictionary: dictionaryData as NSDictionary)
            print(ResponseData!)
            Success(ResponseData!)
            
            
        }, Falioure: {(error) in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
    }
    
    
    
    //MARK:QuotList
    class func getquotlist(pagenumber : Int , parameter : NSDictionary, Success : @escaping (QuotList)->Void, Falioure: @escaping (NetworkError)-> Void)
    {
        let  url = Constant.MainUrl + Constant.URLs.quotlistUrl + "?page=" + "\(pagenumber)"
        
        print(url)
        Networkhandler.PostRequiest(url: url, parameters: parameter as? Parameters, success: { (success)  in
            let dictionaryData = success as! [String : AnyObject]
            let ResponseData = QuotList.init(dictionary: dictionaryData as NSDictionary)
            print(ResponseData!)
            Success(ResponseData!)
            
            
        }, Falioure: {(error) in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
    }
    
    
    //MARK:SaveAddresses
    class func usersaveaddress(parameter : NSDictionary, Success : @escaping (saveAddresses)->Void, Falioure: @escaping (NetworkError)-> Void)
    {
        let  url = Constant.MainUrl + Constant.URLs.saveAddressUrl
        
        print(url)
        Networkhandler.PostRequiest(url: url, parameters: parameter as? Parameters, success: { (success)  in
            let dictionaryData = success as! [String : AnyObject]
            let ResponseData = saveAddresses.init(dictionary: dictionaryData as NSDictionary)
            print(ResponseData!)
            Success(ResponseData!)
            
            
        }, Falioure: {(error) in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
    }
    
    
    
    //MARK:SaveAddresses
    class func acceptedQuot(parameter : NSDictionary, Success : @escaping (acceptquot)->Void, Falioure: @escaping (NetworkError)-> Void)
    {
        let  url = Constant.MainUrl + Constant.URLs.acceptedQuotUrl
        
        print(url)
        Networkhandler.PostRequiest(url: url, parameters: parameter as? Parameters, success: { (success)  in
            let dictionaryData = success as! [String : AnyObject]
            let ResponseData = acceptquot.init(dictionary: dictionaryData as NSDictionary)
            print(ResponseData!)
            Success(ResponseData!)
            
            
        }, Falioure: {(error) in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
    }
    
    
    //MARK:AcceptedQuoutDetail
    class func acceptedQuotDetailGet(parameter : NSDictionary, Success : @escaping (acceptedQuotDetail)->Void, Falioure: @escaping (NetworkError)-> Void)
    {
        let  url = Constant.MainUrl + Constant.URLs.acceptedQuotDetailUrl
        
        print(url)
        Networkhandler.PostRequiest(url: url, parameters: parameter as? Parameters, success: { (success)  in
            let dictionaryData = success as! [String : AnyObject]
            let ResponseData = acceptedQuotDetail.init(dictionary: dictionaryData as NSDictionary)
            print(ResponseData!)
            Success(ResponseData!)
            
            
        }, Falioure: {(error) in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
    }
    
    
    //MARK:companySendQuotDetailget
    class func companySendQuotDetailget(parameter : NSDictionary, Success : @escaping (companysendQuotDetail)->Void, Falioure: @escaping (NetworkError)-> Void)
    {
        let  url = Constant.MainUrl + Constant.URLs.companysendAcceptedQuotUrl
        
        print(url)
        Networkhandler.PostRequiest(url: url, parameters: parameter as? Parameters, success: { (success)  in
            let dictionaryData = success as! [String : AnyObject]
            let ResponseData = companysendQuotDetail.init(dictionary: dictionaryData as NSDictionary)
            print(ResponseData!)
            Success(ResponseData!)
            
            
        }, Falioure: {(error) in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
    }
    
    
    
    
    //MARK:policypath
    class func uploadPolicyPath(parameter : NSDictionary, Success : @escaping (policypathmodel)->Void, Falioure: @escaping (NetworkError)-> Void)
    {
        let  url = Constant.MainUrl + Constant.URLs.policypathUrl
        
        print(url)
        Networkhandler.PostRequiest(url: url, parameters: parameter as? Parameters, success: { (success)  in
            let dictionaryData = success as! [String : AnyObject]
            let ResponseData = policypathmodel.init(dictionary: dictionaryData as NSDictionary)
            print(ResponseData!)
            Success(ResponseData!)
            
            
        }, Falioure: {(error) in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
    }
    
    
    
    //MARK:- GetCompanyProfile
    
    
    class func getCompanyProfile(Success: @escaping (getProfile) -> Void, Falioure: @escaping (NetworkError)-> Void )
    {
        let url = Constant.MainUrl + Constant.URLs.GetProfile
        print(url)
        Networkhandler.GetRequiest(url: url, parameters: nil, success: {(successResponse)in
            
            let SplashResponse = successResponse as! [String : AnyObject]
            let splashdictionary = getProfile.init(dictionary: SplashResponse as NSDictionary)
            print(splashdictionary!)
            Success(splashdictionary!)
        }, Falioure: {(error)in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
        
    }
    
    
    
    //MARK:companyProfileupadat
    class func updatecompanyProfile(parameter : NSDictionary, Success : @escaping (getProfile)->Void, Falioure: @escaping (NetworkError)-> Void)
    {
        let  url = Constant.MainUrl + Constant.URLs.companyProfileUpdateUrl
        
        print(url)
        Networkhandler.PostRequiest(url: url, parameters: parameter as? Parameters, success: { (success)  in
            let dictionaryData = success as! [String : AnyObject]
            let ResponseData = getProfile.init(dictionary: dictionaryData as NSDictionary)
            print(ResponseData!)
            Success(ResponseData!)
            
            
        }, Falioure: {(error) in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
    }
    
    
    class func notificationSettings(parameter : NSDictionary, Success : @escaping (getProfile)->Void, Falioure: @escaping (NetworkError)-> Void)
    {
        let  url = Constant.MainUrl + Constant.URLs.notficationsettingurl
        
        print(url)
        Networkhandler.PostRequiest(url: url, parameters: parameter as? Parameters, success: { (success)  in
            let dictionaryData = success as! [String : AnyObject]
            let ResponseData = getProfile.init(dictionary: dictionaryData as NSDictionary)
            print(ResponseData!)
            Success(ResponseData!)
            
            
        }, Falioure: {(error) in
            
            Falioure(NetworkError(status: Constant.NetworkErrorType.generic, message: error.message))
            
            
        })
    }
    
}
