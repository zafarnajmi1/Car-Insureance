//
//  orderDetailModel.swift
//  CarInsurance
//
//  Created by Apple on 8/2/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
public class UserOrderDeatil {
    public var success : Bool?
    public var message : String?
    public var data : UserOrderDeatilData?
    public var errors : UserOrderDeatilErrors?
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [UserOrderDeatil]
    {
        var models:[UserOrderDeatil] = []
        for item in array
        {
            models.append(UserOrderDeatil(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    

    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        message = dictionary["message"] as? String
        if (dictionary["data"] != nil) { data = UserOrderDeatilData(dictionary: dictionary["data"] as! NSDictionary) }
        if (dictionary["errors"] != nil) { errors = UserOrderDeatilErrors(dictionary: dictionary["errors"] as! NSDictionary) }
    }
    
    
   
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.success, forKey: "success")
        dictionary.setValue(self.message, forKey: "message")
        dictionary.setValue(self.data?.dictionaryRepresentation(), forKey: "data")
        dictionary.setValue(self.errors?.dictionaryRepresentation(), forKey: "errors")
        
        return dictionary
    }
    
}




public class UserOrderDeatilData {
    
    public var _id : String?
    public var companies : Array<String>?
    public var orderInfo : Array<UserOrderDeatilOrderInfo>?
    public var quotes : Array<String>?
    public var companiesResponse : Array<String>?
    public var quotesCount : Int?
    public var policyPath : String?
    public var status : String?
    public var firstName : String?
    public var lastName : String?
    public var payerId : String?
    public var payerEmail : String?
    public var paymentId : String?
    public var payerStatus : String?
    public var paymentMethod : String?
    public var currency : String?
    public var chargesAED : Int?
    public var chargesUSD : Double?
    public var state : String?
    public var paypalResponse : String?
    public var ip : String?
    public var paymentDate : String?
    public var category : UserOrderDeatilCategory?
    public var user : UserOrderDeatilUser?
    public var addresses : Array<UserOrderDeatilAddresses>?
    public var createdAt : String?
    public var updatedAt : String?
    public var orderNumber : String?
    public var company : UserOrderDeatilCompany?
    public var alreadyQuote : Bool?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [UserOrderDeatilData]
    {
        var models:[UserOrderDeatilData] = []
        for item in array
        {
            models.append(UserOrderDeatilData(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
   
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        companies = dictionary["companies"] as? Array<String>
        //if (dictionary["companies"] != nil) { companies = Companies.modelsFromDictionaryArray(dictionary["companies"] as! NSArray) }
        if (dictionary["orderInfo"] != nil) { orderInfo = UserOrderDeatilOrderInfo.modelsFromDictionaryArray(array: dictionary["orderInfo"] as! NSArray) }
        quotes = dictionary["quotes"] as? Array<String>
        //if (dictionary["quotes"] != nil) { quotes = Quotes.modelsFromDictionaryArray(dictionary["quotes"] as! NSArray) }
        //if (dictionary["companiesResponse"] != nil) { companiesResponse = CompaniesResponse.modelsFromDictionaryArray(dictionary["companiesResponse"] as! NSArray) }
        companiesResponse = dictionary["companiesResponse"] as? Array<String>
        quotesCount = dictionary["quotesCount"] as? Int
        policyPath = dictionary["policyPath"] as? String
        status = dictionary["status"] as? String
        firstName = dictionary["firstName"] as? String
        lastName = dictionary["lastName"] as? String
        payerId = dictionary["payerId"] as? String
        payerEmail = dictionary["payerEmail"] as? String
        paymentId = dictionary["paymentId"] as? String
        payerStatus = dictionary["payerStatus"] as? String
        paymentMethod = dictionary["paymentMethod"] as? String
        currency = dictionary["currency"] as? String
        chargesAED = dictionary["chargesAED"] as? Int
        chargesUSD = dictionary["chargesUSD"] as? Double
        state = dictionary["state"] as? String
        paypalResponse = dictionary["paypalResponse"] as? String
        ip = dictionary["ip"] as? String
        paymentDate = dictionary["paymentDate"] as? String
        if (dictionary["category"] != nil) { category = UserOrderDeatilCategory(dictionary: dictionary["category"] as! NSDictionary) }
        if (dictionary["user"] != nil) { user = UserOrderDeatilUser(dictionary: dictionary["user"] as! NSDictionary) }
        if (dictionary["addresses"] != nil) { addresses = UserOrderDeatilAddresses.modelsFromDictionaryArray(array: dictionary["addresses"] as! NSArray) }
        createdAt = dictionary["createdAt"] as? String
        updatedAt = dictionary["updatedAt"] as? String
        orderNumber = dictionary["orderNumber"] as? String
        if (dictionary["company"] != nil) { company = UserOrderDeatilCompany(dictionary: dictionary["company"] as! NSDictionary) }
        alreadyQuote = dictionary["alreadyQuote"] as? Bool
    }
    
    
   
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.quotesCount, forKey: "quotesCount")
        dictionary.setValue(self.policyPath, forKey: "policyPath")
        dictionary.setValue(self.status, forKey: "status")
        dictionary.setValue(self.firstName, forKey: "firstName")
        dictionary.setValue(self.lastName, forKey: "lastName")
        dictionary.setValue(self.payerId, forKey: "payerId")
        dictionary.setValue(self.payerEmail, forKey: "payerEmail")
        dictionary.setValue(self.paymentId, forKey: "paymentId")
        dictionary.setValue(self.payerStatus, forKey: "payerStatus")
        dictionary.setValue(self.paymentMethod, forKey: "paymentMethod")
        dictionary.setValue(self.currency, forKey: "currency")
        dictionary.setValue(self.chargesAED, forKey: "chargesAED")
        dictionary.setValue(self.chargesUSD, forKey: "chargesUSD")
        dictionary.setValue(self.state, forKey: "state")
        dictionary.setValue(self.paypalResponse, forKey: "paypalResponse")
        dictionary.setValue(self.ip, forKey: "ip")
        dictionary.setValue(self.paymentDate, forKey: "paymentDate")
        dictionary.setValue(self.category?.dictionaryRepresentation(), forKey: "category")
        dictionary.setValue(self.user?.dictionaryRepresentation(), forKey: "user")
        dictionary.setValue(self.createdAt, forKey: "createdAt")
        dictionary.setValue(self.updatedAt, forKey: "updatedAt")
        dictionary.setValue(self.orderNumber, forKey: "orderNumber")
        dictionary.setValue(self.company?.dictionaryRepresentation(), forKey: "company")
        dictionary.setValue(self.alreadyQuote, forKey: "alreadyQuote")
        
        return dictionary
    }
    
}




public class UserOrderDeatilAddresses {
    public var email : String?
    public var phone : String?
    public var postCode : String?
    public var address1 : String?
    public var address2 : String?
    public var address3 : String?
    public var addressType : String?
    public var _id : String?
    public var firstName : String?
    public var lastName : String?
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [UserOrderDeatilAddresses]
    {
        var models:[UserOrderDeatilAddresses] = []
        for item in array
        {
            models.append(UserOrderDeatilAddresses(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        email = dictionary["email"] as? String
        phone = dictionary["phone"] as? String
        postCode = dictionary["postCode"] as? String
        address1 = dictionary["address1"] as? String
        address2 = dictionary["address2"] as? String
        address3 = dictionary["address3"] as? String
        addressType = dictionary["addressType"] as? String
        _id = dictionary["_id"] as? String
        firstName = dictionary["firstName"] as? String
        lastName = dictionary["lastName"] as? String
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.email, forKey: "email")
        dictionary.setValue(self.phone, forKey: "phone")
        dictionary.setValue(self.postCode, forKey: "postCode")
        dictionary.setValue(self.address1, forKey: "address1")
        dictionary.setValue(self.address2, forKey: "address2")
        dictionary.setValue(self.address3, forKey: "address3")
        dictionary.setValue(self.addressType, forKey: "addressType")
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.firstName, forKey: "firstName")
        dictionary.setValue(self.lastName, forKey: "lastName")
        
        return dictionary
    }
    
}




public class UserOrderDeatilUser {
    public var _id : String?
    public var detail : String?
    public var fullName : String?
    public var firstName : String?
    public var lastName : String?
    public var email : String?
    public var phone : String?
    public var address : String?
    public var location : Array<Double>?
    public var accountType : String?
    public var gender : String?
    public var image : String?
    public var isActive : Bool?
    public var isApproved : Bool?
    public var isEmailVerified : Bool?
    public var verificationCode : String?
    public var resetPasswordCode : Int?
    public var fcmTokens : Array<String>?
    public var isLoggedIn : Bool?
    public var password : String?
    public var role : String?
    public var createdAt : String?
    public var updatedAt : String?
    public var addresses : Array<UserOrderDeatilAddresses>?
    public var notificationsSetting : NotificationsSetting?
    public var detailEn : String?
    public var detailAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [UserOrderDeatilUser]
    {
        var models:[UserOrderDeatilUser] = []
        for item in array
        {
            models.append(UserOrderDeatilUser(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    

    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        detail = dictionary["detail"] as? String
        fullName = dictionary["fullName"] as? String
        firstName = dictionary["firstName"] as? String
        lastName = dictionary["lastName"] as? String
        email = dictionary["email"] as? String
        phone = dictionary["phone"] as? String
        address = dictionary["address"] as? String
        
        location  = dictionary["location"] as? Array<Double>
        //if (dictionary["location"] != nil) { location = Location.modelsFromDictionaryArray(dictionary["location"] as! NSArray) }
        accountType = dictionary["accountType"] as? String
        gender = dictionary["gender"] as? String
        image = dictionary["image"] as? String
        isActive = dictionary["isActive"] as? Bool
        isApproved = dictionary["isApproved"] as? Bool
        isEmailVerified = dictionary["isEmailVerified"] as? Bool
        verificationCode = dictionary["verificationCode"] as? String
        resetPasswordCode = dictionary["resetPasswordCode"] as? Int
        fcmTokens = dictionary["fcmTokens"] as? Array<String>
        //if (dictionary["fcmTokens"] != nil) { fcmTokens = FcmTokens.modelsFromDictionaryArray(dictionary["fcmTokens"] as! NSArray) }
        isLoggedIn = dictionary["isLoggedIn"] as? Bool
        password = dictionary["password"] as? String
        role = dictionary["role"] as? String
        createdAt = dictionary["createdAt"] as? String
        updatedAt = dictionary["updatedAt"] as? String
        if (dictionary["addresses"] != nil) { addresses = UserOrderDeatilAddresses.modelsFromDictionaryArray(array: dictionary["addresses"] as! NSArray) }
        if (dictionary["notificationsSetting"] != nil) { notificationsSetting = NotificationsSetting(dictionary: dictionary["notificationsSetting"] as! NSDictionary) }
        detailEn = dictionary["detailEn"] as? String
        detailAr = dictionary["detailAr"] as? String
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.detail, forKey: "detail")
        dictionary.setValue(self.fullName, forKey: "fullName")
        dictionary.setValue(self.firstName, forKey: "firstName")
        dictionary.setValue(self.lastName, forKey: "lastName")
        dictionary.setValue(self.email, forKey: "email")
        dictionary.setValue(self.phone, forKey: "phone")
        dictionary.setValue(self.address, forKey: "address")
        dictionary.setValue(self.accountType, forKey: "accountType")
        dictionary.setValue(self.gender, forKey: "gender")
        dictionary.setValue(self.image, forKey: "image")
        dictionary.setValue(self.isActive, forKey: "isActive")
        dictionary.setValue(self.isApproved, forKey: "isApproved")
        dictionary.setValue(self.isEmailVerified, forKey: "isEmailVerified")
        dictionary.setValue(self.verificationCode, forKey: "verificationCode")
        dictionary.setValue(self.resetPasswordCode, forKey: "resetPasswordCode")
        dictionary.setValue(self.isLoggedIn, forKey: "isLoggedIn")
        dictionary.setValue(self.password, forKey: "password")
        dictionary.setValue(self.role, forKey: "role")
        dictionary.setValue(self.createdAt, forKey: "createdAt")
        dictionary.setValue(self.updatedAt, forKey: "updatedAt")
        dictionary.setValue(self.notificationsSetting?.dictionaryRepresentation(), forKey: "notificationsSetting")
        dictionary.setValue(self.detailEn, forKey: "detailEn")
        dictionary.setValue(self.detailAr, forKey: "detailAr")
        
        return dictionary
    }
    
}









public class UserOrderDeatilCompany {
    public var _id : String?
    public var detail : String?
    public var termsCondition : String?
    public var orgnizationTitle : String?
    public var fullName : String?
    public var firstName : String?
    public var lastName : String?
    public var email : String?
    public var phone : String?
    public var address : String?
    public var location : Array<Double>?
    public var accountType : String?
    public var gender : String?
    public var image : String?
    public var isActive : Bool?
    public var isApproved : Bool?
    public var isEmailVerified : Bool?
    public var verificationCode : Int?
    public var resetPasswordCode : Int?
    public var fcmTokens : Array<String>?
    public var isLoggedIn : Bool?
    public var password : String?
    public var role : String?
    public var addresses : Array<String>?
    public var createdAt : String?
    public var updatedAt : String?
    public var detailEn : String?
    public var detailAr : String?
    public var orgnizationTitleEn : String?
    public var orgnizationTitleAr : String?
    public var termsConditionEn : String?
    public var termsConditionAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [UserOrderDeatilCompany]
    {
        var models:[UserOrderDeatilCompany] = []
        for item in array
        {
            models.append(UserOrderDeatilCompany(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        detail = dictionary["detail"] as? String
        termsCondition = dictionary["termsCondition"] as? String
        orgnizationTitle = dictionary["orgnizationTitle"] as? String
        fullName = dictionary["fullName"] as? String
        firstName = dictionary["firstName"] as? String
        lastName = dictionary["lastName"] as? String
        email = dictionary["email"] as? String
        phone = dictionary["phone"] as? String
        address = dictionary["address"] as? String
        location = dictionary["location"] as? Array<Double>
        //if (dictionary["location"] != nil) { location = Location.modelsFromDictionaryArray(dictionary["location"] as! NSArray) }
        accountType = dictionary["accountType"] as? String
        gender = dictionary["gender"] as? String
        image = dictionary["image"] as? String
        isActive = dictionary["isActive"] as? Bool
        isApproved = dictionary["isApproved"] as? Bool
        isEmailVerified = dictionary["isEmailVerified"] as? Bool
        verificationCode = dictionary["verificationCode"] as? Int
        resetPasswordCode = dictionary["resetPasswordCode"] as? Int
        fcmTokens = dictionary["fcmTokens"] as? Array<String>
        //if (dictionary["fcmTokens"] != nil) { fcmTokens = FcmTokens.modelsFromDictionaryArray(dictionary["fcmTokens"] as! NSArray) }
        isLoggedIn = dictionary["isLoggedIn"] as? Bool
        password = dictionary["password"] as? String
        role = dictionary["role"] as? String
        addresses = dictionary["addresses"]  as? Array<String>
        //if (dictionary["addresses"] != nil) { addresses = Addresses.modelsFromDictionaryArray(dictionary["addresses"] as! NSArray) }
        createdAt = dictionary["createdAt"] as? String
        updatedAt = dictionary["updatedAt"] as? String
        detailEn = dictionary["detailEn"] as? String
        detailAr = dictionary["detailAr"] as? String
        orgnizationTitleEn = dictionary["orgnizationTitleEn"] as? String
        orgnizationTitleAr = dictionary["orgnizationTitleAr"] as? String
        termsConditionEn = dictionary["termsConditionEn"] as? String
        termsConditionAr = dictionary["termsConditionAr"] as? String
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.detail, forKey: "detail")
        dictionary.setValue(self.termsCondition, forKey: "termsCondition")
        dictionary.setValue(self.orgnizationTitle, forKey: "orgnizationTitle")
        dictionary.setValue(self.fullName, forKey: "fullName")
        dictionary.setValue(self.firstName, forKey: "firstName")
        dictionary.setValue(self.lastName, forKey: "lastName")
        dictionary.setValue(self.email, forKey: "email")
        dictionary.setValue(self.phone, forKey: "phone")
        dictionary.setValue(self.address, forKey: "address")
        dictionary.setValue(self.accountType, forKey: "accountType")
        dictionary.setValue(self.gender, forKey: "gender")
        dictionary.setValue(self.image, forKey: "image")
        dictionary.setValue(self.isActive, forKey: "isActive")
        dictionary.setValue(self.isApproved, forKey: "isApproved")
        dictionary.setValue(self.isEmailVerified, forKey: "isEmailVerified")
        dictionary.setValue(self.verificationCode, forKey: "verificationCode")
        dictionary.setValue(self.resetPasswordCode, forKey: "resetPasswordCode")
        dictionary.setValue(self.isLoggedIn, forKey: "isLoggedIn")
        dictionary.setValue(self.password, forKey: "password")
        dictionary.setValue(self.role, forKey: "role")
        dictionary.setValue(self.createdAt, forKey: "createdAt")
        dictionary.setValue(self.updatedAt, forKey: "updatedAt")
        dictionary.setValue(self.detailEn, forKey: "detailEn")
        dictionary.setValue(self.detailAr, forKey: "detailAr")
        dictionary.setValue(self.orgnizationTitleEn, forKey: "orgnizationTitleEn")
        dictionary.setValue(self.orgnizationTitleAr, forKey: "orgnizationTitleAr")
        dictionary.setValue(self.termsConditionEn, forKey: "termsConditionEn")
        dictionary.setValue(self.termsConditionAr, forKey: "termsConditionAr")
        
        return dictionary
    }
    
}












public class UserOrderDeatilErrors {
    
    

    public class func modelsFromDictionaryArray(array:NSArray) -> [UserOrderDeatilErrors]
    {
        var models:[UserOrderDeatilErrors] = []
        for item in array
        {
            models.append(UserOrderDeatilErrors(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
    }
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        
        return dictionary
    }
    
}


public class UserOrderDeatilQuestions {
    public var _id : String?
    public var title : String?
    public var placeholder : String?
    public var isRequired : Bool?
    public var questionType : String?
    public var options : Array<UserOrderDeatilOptions>?
    public var titleEn : String?
    public var titleAr : String?
    public var placeholderEn : String?
    public var placeholderAr : String?
    public var answer1: String?
    public var answer : UserOrderDeatilAnswer?
    
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [UserOrderDeatilQuestions]
    {
        var models:[UserOrderDeatilQuestions] = []
        for item in array
        {
            models.append(UserOrderDeatilQuestions(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        placeholder = dictionary["placeholder"] as? String
        isRequired = dictionary["isRequired"] as? Bool
        questionType = dictionary["questionType"] as? String
        if (dictionary["options"] != nil) { options = UserOrderDeatilOptions.modelsFromDictionaryArray(array: dictionary["options"] as! NSArray) }
        titleEn = dictionary["titleEn"] as? String
        titleAr = dictionary["titleAr"] as? String
        placeholderEn = dictionary["placeholderEn"] as? String
        placeholderAr = dictionary["placeholderAr"] as? String
        answer1 = dictionary["answer"] as? String
        if (dictionary["answer"] != nil) { answer = UserOrderDeatilAnswer(dictionary: dictionary["answer"] as? NSDictionary ?? [:]) }
    }
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.placeholder, forKey: "placeholder")
        dictionary.setValue(self.isRequired, forKey: "isRequired")
        dictionary.setValue(self.questionType, forKey: "questionType")
        dictionary.setValue(self.titleEn, forKey: "titleEn")
        dictionary.setValue(self.titleAr, forKey: "titleAr")
        dictionary.setValue(self.placeholderEn, forKey: "placeholderEn")
        dictionary.setValue(self.placeholderAr, forKey: "placeholderAr")
        dictionary.setValue(self.answer1, forKey: "answer")
        dictionary.setValue(self.answer?.dictionaryRepresentation(), forKey: "answer")
        
        return dictionary
    }
    
}


public class UserOrderDeatilCategory {
    public var _id : String?
    public var title : String?
    public var icon : String?
    public var image : String?
    public var isActive : Bool?
    public var sortOrder : Int?
    public var children : Array<Children>?
    public var depth : Int?
    public var createdAt : String?
    public var updatedAt : String?
    public var detail : String?
    public var titleEn : String?
    public var titleAr : String?
    public var detailEn : String?
    public var detailAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [UserOrderDeatilCategory]
    {
        var models:[UserOrderDeatilCategory] = []
        for item in array
        {
            models.append(UserOrderDeatilCategory(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        icon = dictionary["icon"] as? String
        image = dictionary["image"] as? String
        isActive = dictionary["isActive"] as? Bool
        sortOrder = dictionary["sortOrder"] as? Int
        if (dictionary["children"] != nil) { children = Children.modelsFromDictionaryArray(array: dictionary["children"] as! NSArray) }
        depth = dictionary["depth"] as? Int
        createdAt = dictionary["createdAt"] as? String
        updatedAt = dictionary["updatedAt"] as? String
        detail = dictionary["detail"] as? String
        titleEn = dictionary["titleEn"] as? String
        titleAr = dictionary["titleAr"] as? String
        detailEn = dictionary["detailEn"] as? String
        detailAr = dictionary["detailAr"] as? String
    }
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.icon, forKey: "icon")
        dictionary.setValue(self.image, forKey: "image")
        dictionary.setValue(self.isActive, forKey: "isActive")
        dictionary.setValue(self.sortOrder, forKey: "sortOrder")
        dictionary.setValue(self.depth, forKey: "depth")
        dictionary.setValue(self.createdAt, forKey: "createdAt")
        dictionary.setValue(self.updatedAt, forKey: "updatedAt")
        dictionary.setValue(self.detail, forKey: "detail")
        dictionary.setValue(self.titleEn, forKey: "titleEn")
        dictionary.setValue(self.titleAr, forKey: "titleAr")
        dictionary.setValue(self.detailEn, forKey: "detailEn")
        dictionary.setValue(self.detailAr, forKey: "detailAr")
        
        return dictionary
    }
    
}


public class UserOrderDeatilAnswer {
    public var _id : String?
    public var title : String?
    public var children : Array<Children>?
    public var titleEn : String?
    public var titleAr : String?
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [UserOrderDeatilAnswer]
    {
        var models:[UserOrderDeatilAnswer] = []
        for item in array
        {
            models.append(UserOrderDeatilAnswer(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        if (dictionary["children"] != nil) { children = Children.modelsFromDictionaryArray(array: dictionary["children"] as! NSArray) }
        titleEn = dictionary["titleEn"] as? String
        titleAr = dictionary["titleAr"] as? String
    }
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.titleEn, forKey: "titleEn")
        dictionary.setValue(self.titleAr, forKey: "titleAr")
        
        return dictionary
    }
    
}


public class UserOrderDeatilOptions {
    public var _id : String?
    public var title : String?
    public var children : Array<Children>?
    public var titleEn : String?
    public var titleAr : String?
    

    public class func modelsFromDictionaryArray(array:NSArray) -> [UserOrderDeatilOptions]
    {
        var models:[UserOrderDeatilOptions] = []
        for item in array
        {
            models.append(UserOrderDeatilOptions(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        if (dictionary["children"] != nil) { children = Children.modelsFromDictionaryArray(array: dictionary["children"] as! NSArray) }
        titleEn = dictionary["titleEn"] as? String
        titleAr = dictionary["titleAr"] as? String
    }
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.titleEn, forKey: "titleEn")
        dictionary.setValue(self.titleAr, forKey: "titleAr")
        
        return dictionary
    }
    
}



public class UserOrderDeatilOrderInfo {
    public var _id : String?
    public var title : String?
    public var sortOrder : Int?
    public var questions : Array<UserOrderDeatilQuestions>?
    public var children : Array<Children>?
    public var titleEn : String?
    public var titleAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [UserOrderDeatilOrderInfo]
    {
        var models:[UserOrderDeatilOrderInfo] = []
        for item in array
        {
            models.append(UserOrderDeatilOrderInfo(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        sortOrder = dictionary["sortOrder"] as? Int
        if (dictionary["questions"] != nil) { questions = UserOrderDeatilQuestions.modelsFromDictionaryArray(array: dictionary["questions"] as! NSArray) }
        if (dictionary["children"] != nil) { children = Children.modelsFromDictionaryArray(array: dictionary["children"] as! NSArray) }
        titleEn = dictionary["titleEn"] as? String
        titleAr = dictionary["titleAr"] as? String
       
    }
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.sortOrder, forKey: "sortOrder")
        dictionary.setValue(self.titleEn, forKey: "titleEn")
        dictionary.setValue(self.titleAr, forKey: "titleAr")
        
        
        return dictionary
    }
    
}
