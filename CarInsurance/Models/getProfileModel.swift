//
//  getProfileModel.swift
//  CarInsurance
//
//  Created by Apple on 7/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
public class getProfile {
    public var success : Bool?
    public var message : String?
    public var data : getProfileData?
    public var errors : getProfileErrors?
    

    public class func modelsFromDictionaryArray(array:NSArray) -> [getProfile]
    {
        var models:[getProfile] = []
        for item in array
        {
            models.append(getProfile(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        message = dictionary["message"] as? String
        if (dictionary["data"] != nil) { data = getProfileData(dictionary: dictionary["data"] as! NSDictionary) }
        if (dictionary["errors"] != nil) { errors = getProfileErrors(dictionary: dictionary["errors"] as! NSDictionary) }
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

public class getProfileData {
    
    
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
    public var resetPasswordCode : Int?
    public var fcmTokens : Array<String>?
    public var isLoggedIn : Bool?
    public var role : Role?
    public var addresses : Array<Addresses>?
    public var createdAt : String?
    public var updatedAt : String?
    public var notificationsSetting : getProfileNotificationsSetting?
    public var detailEn : String?
    public var detailAr : String?
    public var orgnizationTitleEn : String?
    public var orgnizationTitleAr : String?
    public var termsConditionEn : String?
    public var termsConditionAr : String?
    public var authorization : String?
 
    public var language : Language?
    public var city : String?
   
    
 
    
    
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [getProfileData]
    {
        var models:[getProfileData] = []
        for item in array
        {
            models.append(getProfileData(dictionary: item as! NSDictionary)!)
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
        resetPasswordCode = dictionary["resetPasswordCode"] as? Int
        fcmTokens = dictionary["fcmTokens"] as? Array<String>
        //if (dictionary["fcmTokens"] != nil) { fcmTokens = FcmTokens.modelsFromDictionaryArray(dictionary["fcmTokens"] as! NSArray) }
        isLoggedIn = dictionary["isLoggedIn"] as? Bool
        if (dictionary["role"] != nil) { role = Role(dictionary: dictionary["role"] as! NSDictionary) }
        //addresses = dictionary["addresses"] as? Array<Addresses>
        if (dictionary["addresses"] != nil) { addresses = Addresses.modelsFromDictionaryArray(array: dictionary["addresses"] as! NSArray) }
        createdAt = dictionary["createdAt"] as? String
        updatedAt = dictionary["updatedAt"] as? String
        if (dictionary["notificationsSetting"] != nil) { notificationsSetting = getProfileNotificationsSetting(dictionary: dictionary["notificationsSetting"] as! NSDictionary) }
        detailEn = dictionary["detailEn"] as? String
        detailAr = dictionary["detailAr"] as? String
        orgnizationTitleEn = dictionary["orgnizationTitleEn"] as? String
        orgnizationTitleAr = dictionary["orgnizationTitleAr"] as? String
        termsConditionEn = dictionary["termsConditionEn"] as? String
        termsConditionAr = dictionary["termsConditionAr"] as? String
        authorization = dictionary["authorization"] as? String
        
      
        if (dictionary["language"] != nil) {
            language = Language(dictionary: dictionary["language"] as! NSDictionary)
            
        }
        city = dictionary["city"] as? String
      
    }
    
    
   
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
        dictionary.setValue(self.resetPasswordCode, forKey: "resetPasswordCode")
        dictionary.setValue(self.isLoggedIn, forKey: "isLoggedIn")
        dictionary.setValue(self.role?.dictionaryRepresentation(), forKey: "role")
        dictionary.setValue(self.createdAt, forKey: "createdAt")
        dictionary.setValue(self.updatedAt, forKey: "updatedAt")
        dictionary.setValue(self.notificationsSetting?.dictionaryRepresentation(), forKey: "notificationsSetting")
        dictionary.setValue(self.detailEn, forKey: "detailEn")
        dictionary.setValue(self.detailAr, forKey: "detailAr")
        dictionary.setValue(self.orgnizationTitleEn, forKey: "orgnizationTitleEn")
        dictionary.setValue(self.orgnizationTitleAr, forKey: "orgnizationTitleAr")
        dictionary.setValue(self.termsConditionEn, forKey: "termsConditionEn")
        dictionary.setValue(self.termsConditionAr, forKey: "termsConditionAr")
        dictionary.setValue(self.authorization, forKey: "authorization")
        
        return dictionary
    }
    
    
//    public var _id : String?
//    public var detail : String?
//    //public var orgnizationTitle : getProfileOrgnizationTitle?
//    public var fullName : String?
//    public var firstName : String?
//    public var lastName : String?
//    public var email : String?
//    public var phone : String?
//    public var address : String?
//    public var location : Array<String>?
//    public var accountType : String?
//    public var gender : String?
//    public var image : String?
//    public var isActive : Bool?
//    public var isApproved : Bool?
//    public var isEmailVerified : Bool?
//    public var resetPasswordCode : Int?
//    public var fcmTokens : Array<String>?
//    public var isLoggedIn : Bool?
//    public var role : getProfileRole?
//    public var createdAt : String?
//    public var updatedAt : String?
//    public var detailEn : String?
//    public var detailAr : String?
//    public var authorization : String?
//
//
//    public class func modelsFromDictionaryArray(array:NSArray) -> [getProfileData]
//    {
//        var models:[getProfileData] = []
//        for item in array
//        {
//            models.append(getProfileData(dictionary: item as! NSDictionary)!)
//        }
//        return models
//    }
//
//    required public init?(dictionary: NSDictionary) {
//
//        _id = dictionary["_id"] as? String
//        detail = dictionary["detail"] as? String
//        //if (dictionary["orgnizationTitle"] != nil) { orgnizationTitle = getProfileOrgnizationTitle(dictionary: dictionary["orgnizationTitle"] as! NSDictionary) }
//        fullName = dictionary["fullName"] as? String
//        firstName = dictionary["firstName"] as? String
//        lastName = dictionary["lastName"] as? String
//        email = dictionary["email"] as? String
//        phone = dictionary["phone"] as? String
//        address = dictionary["address"] as? String
//        location = dictionary["location"] as? Array<String>
//        //if (dictionary["location"] != nil) { location = Location.modelsFromDictionaryArray(dictionary["location"] as! NSArray) }
//        accountType = dictionary["accountType"] as? String
//        gender = dictionary["gender"] as? String
//        image = dictionary["image"] as? String
//        isActive = dictionary["isActive"] as? Bool
//        isApproved = dictionary["isApproved"] as? Bool
//        isEmailVerified = dictionary["isEmailVerified"] as? Bool
//        resetPasswordCode = dictionary["resetPasswordCode"] as? Int
//        fcmTokens = dictionary["fcmTokens"] as? Array<String>
//        //if (dictionary["fcmTokens"] != nil) { fcmTokens = FcmTokens.modelsFromDictionaryArray(dictionary["fcmTokens"] as! NSArray) }
//        isLoggedIn = dictionary["isLoggedIn"] as? Bool
//        if (dictionary["role"] != nil) { role = getProfileRole(dictionary: dictionary["role"] as! NSDictionary) }
//        createdAt = dictionary["createdAt"] as? String
//        updatedAt = dictionary["updatedAt"] as? String
//        detailEn = dictionary["detailEn"] as? String
//        detailAr = dictionary["detailAr"] as? String
//        authorization = dictionary["authorization"] as? String
//    }
//
//
//    public func dictionaryRepresentation() -> NSDictionary {
//
//        let dictionary = NSMutableDictionary()
//
//        dictionary.setValue(self._id, forKey: "_id")
//        dictionary.setValue(self.detail, forKey: "detail")
//        //dictionary.setValue(self.orgnizationTitle?.dictionaryRepresentation(), forKey: "orgnizationTitle")
//        dictionary.setValue(self.fullName, forKey: "fullName")
//        dictionary.setValue(self.firstName, forKey: "firstName")
//        dictionary.setValue(self.lastName, forKey: "lastName")
//        dictionary.setValue(self.email, forKey: "email")
//        dictionary.setValue(self.phone, forKey: "phone")
//        dictionary.setValue(self.address, forKey: "address")
//        dictionary.setValue(self.accountType, forKey: "accountType")
//        dictionary.setValue(self.gender, forKey: "gender")
//        dictionary.setValue(self.image, forKey: "image")
//        dictionary.setValue(self.isActive, forKey: "isActive")
//        dictionary.setValue(self.isApproved, forKey: "isApproved")
//        dictionary.setValue(self.isEmailVerified, forKey: "isEmailVerified")
//        dictionary.setValue(self.resetPasswordCode, forKey: "resetPasswordCode")
//        dictionary.setValue(self.isLoggedIn, forKey: "isLoggedIn")
//        dictionary.setValue(self.role?.dictionaryRepresentation(), forKey: "role")
//        dictionary.setValue(self.createdAt, forKey: "createdAt")
//        dictionary.setValue(self.updatedAt, forKey: "updatedAt")
//        dictionary.setValue(self.detailEn, forKey: "detailEn")
//        dictionary.setValue(self.detailAr, forKey: "detailAr")
//        dictionary.setValue(self.authorization, forKey: "authorization")
//
//        return dictionary
//    }
    
}



public class getProfileNotificationsSetting {
    public var quotes : Int?
    public var chats : Int?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [getProfileNotificationsSetting]
    {
        var models:[getProfileNotificationsSetting] = []
        for item in array
        {
            models.append(getProfileNotificationsSetting(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        quotes = dictionary["quotes"] as? Int
        chats = dictionary["chats"] as? Int
    }
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.quotes, forKey: "quotes")
        dictionary.setValue(self.chats, forKey: "chats")
        
        return dictionary
    }
    
}




public class getProfileErrors {
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [getProfileErrors]
    {
        var models:[getProfileErrors] = []
        for item in array
        {
            models.append(getProfileErrors(dictionary: item as! NSDictionary)!)
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


public class getProfileOrgnizationTitle {
    public var en : String?
    public var ar : String?
    

    public class func modelsFromDictionaryArray(array:NSArray) -> [getProfileOrgnizationTitle]
    {
        var models:[getProfileOrgnizationTitle] = []
        for item in array
        {
            models.append(getProfileOrgnizationTitle(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        en = dictionary["en"] as? String
        ar = dictionary["ar"] as? String
    }
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.en, forKey: "en")
        dictionary.setValue(self.ar, forKey: "ar")
        
        return dictionary
    }
    
}


public class getProfileRole {
    public var _id : String?
    public var title : String?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [getProfileRole]
    {
        var models:[getProfileRole] = []
        for item in array
        {
            models.append(getProfileRole(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
    }
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.title, forKey: "title")
        
        return dictionary
    }
    
}
