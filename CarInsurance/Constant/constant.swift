//
//  constant.swift
//  CarInsurance
//
//  Created by Apple on 7/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

class Constant {
    
    
    struct instgramUrls {
        static let clientId = "1a50df5f7e4a413b88059ece6c3de03f" //"c09e8026cf0f4335a2fa978ebfa7871e"
        static let redirectUri = "https://www.projects.mytechnology.ae/car-insurance/"//"https://www.projects.mytechnology.ae/car-insurance/en/api/"
       
        static let clientScret = "54786ef7ce44467ba81408c1a9adf89d"
        static let  authorization = "https://api.instagram.com/oauth/authorize/"
        static let scope = "likes+comments+relationships"
    }
    //https://api.instagram.com/oauth/authorize/?client_id=CLIENT-ID&redirect_uri=REDIRECT-URI&response_type=code
    //https://api.instagram.com/v1/users/self/?access_token=ACCESS-TOKEN
    //my accountID = c09e8026cf0f4335a2fa978ebfa7871e

//    Instagram client ID: 1a50df5f7e4a413b88059ece6c3de03f
//    Please use this for all current or new projects.
    //"http://192.168.18.19:3000/en/api/"
    static var MainUrl : String { return "https://www.projects.mytechnology.ae/car-insurance/en/api/"
        //"http://216.200.116.25/around-uae/api/login"
        
    }
    
    
    struct activitySize {
        static let size = CGSize(width: 40, height: 40)
    }
    
    enum loaderMessages : String {
        case loadingMessage = "Loading..."
    }
    
    //AuthPArt
    struct URLs {
        
        static let Register = "register"
        static let Login = "login"
        static let logout = "auth/logout?fcm="
        static let emailverification = "auth/verify-email"
        static let ResendCode = "auth/resend-verification-code"
        static let socialLoginUrl = "social-login"
        static let forgotPasswordUrl = "forgot-password"
        static let resetpasswordurl = "reset-password"
        static let Setting = "settings"
        static let pagesUrl = "page-slug?slug="//"/page-slug?slug="
        static let ContactUS = "contact-us"
        static let GetProfile = "auth/profile"
        static let UpdateProfile = "auth/update-profile"
        static let ChangePassword = "auth/change-password"
        static let getQuestionListurl = "auth/questions-list"
        static let OrderFiltersUrl = "auth/order-search" //"auth/order-search?status="
        static let OrderSave = "auth/order-store"
        static let UserOrderdetail = "auth/order-detail"
        static let sendquotquestionurl = "auth/service-search"
        static let sendqouturl = "auth/send-quote"
        static let quotlistUrl = "auth/quote-list"
        static let saveAddressUrl = "auth/update/user-addresses"
        static let acceptedQuotUrl = "auth/accept-quote"
        static let acceptedQuotDetailUrl = "auth/accept-quote-detail"
        static let companysendAcceptedQuotUrl = "auth/send-quote-detail"
        static let policypathUrl = "auth/policy-path"
        static let companyProfileUpdateUrl = "auth/organization/update-profile"
        static let  notficationsettingurl = "auth/change-settings"
    }
    
    struct NetworkErrorType {
        static let timeOutInterval: TimeInterval = 20
        
        static let error = "Error"
        static let internetNotAvailable = "Internet Not Available. Please Try Again"
        static let pleaseTryAgain = "Please Try Again"
        
        static let generic = 4000
        static let genericError = "Please Try Again."
        
        static let serverErrorCode = 5000
        static let serverNotAvailable = "Server Not Available"
        static let serverError = "Server Not Availabe, Please Try Later."
        
        static let timout = 4001
        static let timoutError = "Network Time Out, Please Try Again."
        
        static let login = 4003
        static let loginMessage = "Unable To Login"
        static let loginError = "Please Try Again."
        
        static let internet = 4004
        static let internetError = "Internet Not Available. Please Try Again"
    }
    
    struct NetworkSuccess {
        static let statusOK = 200
    }
    
}

let NOTIFICATIONS_UPDATED = "NOTIFICATIONS_UPDATED"
