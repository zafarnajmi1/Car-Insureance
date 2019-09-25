//
//  CompanyProfileUpdateModel.swift
//  CarInsurance
//
//  Created by Apple on 8/30/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
public class companyprofileUpdate {
    public var success : Bool?
    public var message : String?
    public var data : companyprofileUpdateData?
    public var errors : companyprofileUpdateErrors?
    

    public class func modelsFromDictionaryArray(array:NSArray) -> [companyprofileUpdate]
    {
        var models:[companyprofileUpdate] = []
        for item in array
        {
            models.append(companyprofileUpdate(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    

    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        message = dictionary["message"] as? String
        if (dictionary["data"] != nil) { data = companyprofileUpdateData(dictionary: dictionary["data"] as! NSDictionary) }
        if (dictionary["errors"] != nil) { errors = companyprofileUpdateErrors(dictionary: dictionary["errors"] as! NSDictionary) }
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


public class companyprofileUpdateData {
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
    public var location : Array<String>?
    public var accountType : String?
    public var gender : String?
    public var image : String?
    public var isActive : Bool?
    public var isApproved : Bool?
    public var isEmailVerified : Bool?
    public var isLoggedIn : Bool?
    public var role : companyprofileUpdateRole?
    public var addresses : Array<String>?
    public var createdAt : String?
    public var updatedAt : String?
    public var notificationsSetting : companyprofileUpdateNotificationsSetting?
    public var detailEn : String?
    public var detailAr : String?
    public var orgnizationTitleEn : String?
    public var orgnizationTitleAr : String?
    public var termsConditionEn : String?
    public var termsConditionAr : String?
    public var language : companyprofileUpdateLanguage?
    public var city : String?
    public var currency : String?
    public var authorization : String?
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [companyprofileUpdateData]
    {
        var models:[companyprofileUpdateData] = []
        for item in array
        {
            models.append(companyprofileUpdateData(dictionary: item as! NSDictionary)!)
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
        location = dictionary["location"] as?  Array<String>
        //if (dictionary["location"] != nil) { location = Location.modelsFromDictionaryArray(dictionary["location"] as! NSArray) }
        accountType = dictionary["accountType"] as? String
        gender = dictionary["gender"] as? String
        image = dictionary["image"] as? String
        isActive = dictionary["isActive"] as? Bool
        isApproved = dictionary["isApproved"] as? Bool
        isEmailVerified = dictionary["isEmailVerified"] as? Bool
        isLoggedIn = dictionary["isLoggedIn"] as? Bool
        if (dictionary["role"] != nil) { role = companyprofileUpdateRole(dictionary: dictionary["role"] as! NSDictionary) }
        addresses = dictionary["addresses"] as?  Array<String>
        //if (dictionary["addresses"] != nil) { addresses = Addresses.modelsFromDictionaryArray(dictionary["addresses"] as! NSArray) }
        createdAt = dictionary["createdAt"] as? String
        updatedAt = dictionary["updatedAt"] as? String
        if (dictionary["notificationsSetting"] != nil) { notificationsSetting = companyprofileUpdateNotificationsSetting(dictionary: dictionary["notificationsSetting"] as! NSDictionary) }
        detailEn = dictionary["detailEn"] as? String
        detailAr = dictionary["detailAr"] as? String
        orgnizationTitleEn = dictionary["orgnizationTitleEn"] as? String
        orgnizationTitleAr = dictionary["orgnizationTitleAr"] as? String
        termsConditionEn = dictionary["termsConditionEn"] as? String
        termsConditionAr = dictionary["termsConditionAr"] as? String
        if (dictionary["language"] != nil) { language = companyprofileUpdateLanguage(dictionary: dictionary["language"] as! NSDictionary) }
        city = dictionary["city"] as? String
        currency = dictionary["currency"] as? String
        authorization = dictionary["authorization"] as? String
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
        dictionary.setValue(self.language?.dictionaryRepresentation(), forKey: "language")
        dictionary.setValue(self.city, forKey: "city")
        dictionary.setValue(self.currency, forKey: "currency")
        dictionary.setValue(self.authorization, forKey: "authorization")
        
        return dictionary
    }
    
}


public class companyprofileUpdateErrors {
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [companyprofileUpdateErrors]
    {
        var models:[companyprofileUpdateErrors] = []
        for item in array
        {
            models.append(companyprofileUpdateErrors(dictionary: item as! NSDictionary)!)
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



public class companyprofileUpdateLanguage {
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [companyprofileUpdateLanguage]
    {
        var models:[companyprofileUpdateLanguage] = []
        for item in array
        {
            models.append(companyprofileUpdateLanguage(dictionary: item as! NSDictionary)!)
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


public class companyprofileUpdateNotificationsSetting {
    public var quotes : Bool?
    public var chats : Bool?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [companyprofileUpdateNotificationsSetting]
    {
        var models:[companyprofileUpdateNotificationsSetting] = []
        for item in array
        {
            models.append(companyprofileUpdateNotificationsSetting(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        quotes = dictionary["quotes"] as? Bool
        chats = dictionary["chats"] as? Bool
    }
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.quotes, forKey: "quotes")
        dictionary.setValue(self.chats, forKey: "chats")
        
        return dictionary
    }
    
}


public class companyprofileUpdateRole {
    public var _id : String?
    public var title : String?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [companyprofileUpdateRole]
    {
        var models:[companyprofileUpdateRole] = []
        for item in array
        {
            models.append(companyprofileUpdateRole(dictionary: item as! NSDictionary)!)
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
