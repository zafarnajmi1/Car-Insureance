//
//  ResendCode.swift
//  CarInsurance
//
//  Created by Apple on 7/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
public class ResendCode {
    public var success : Bool?
    public var message : String?
    public var data : ResendCodeData?
    public var errors : ResendCodErrors?
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [ResendCode]
    {
        var models:[ResendCode] = []
        for item in array
        {
            models.append(ResendCode(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        message = dictionary["message"] as? String
        if (dictionary["data"] != nil) { data = ResendCodeData(dictionary: dictionary["data"] as! NSDictionary) }
        if (dictionary["errors"] != nil) { errors = ResendCodErrors(dictionary: dictionary["errors"] as! NSDictionary) }
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


public class ResendCodeData {
    public var _id : String?
    public var detail : String?
    //public var orgnizationTitle : ResendCodeOrgnizationTitle?
    public var fullName : String?
    public var firstName : String?
    public var lastName : String?
    public var email : String?
    public var phone : String?
    public var address : String?
    public var location : Array<Int>?
    public var accountType : String?
    public var gender : String?
    public var image : String?
    public var isActive : Bool?
    public var isApproved : Bool?
    public var isEmailVerified : Bool?
    public var isLoggedIn : Bool?
    public var role : ResendCodeRole?
    public var createdAt : String?
    public var updatedAt : String?
    public var detailEn : String?
    public var detailAr : String?
    public var language : ResendCodeLanguage?
    public var city : String?
    public var authorization : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [ResendCodeData]
    {
        var models:[ResendCodeData] = []
        for item in array
        {
            models.append(ResendCodeData(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    

    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        detail = dictionary["detail"] as? String
        //if (dictionary["orgnizationTitle"] != nil) { orgnizationTitle = ResendCodeOrgnizationTitle(dictionary: dictionary["orgnizationTitle"] as! NSDictionary) }
        fullName = dictionary["fullName"] as? String
        firstName = dictionary["firstName"] as? String
        lastName = dictionary["lastName"] as? String
        email = dictionary["email"] as? String
        phone = dictionary["phone"] as? String
        address = dictionary["address"] as? String
        location = dictionary["location"] as? Array<Int>
        //if (dictionary["location"] != nil) { location = Location.modelsFromDictionaryArray(dictionary["location"] as! NSArray) }
        accountType = dictionary["accountType"] as? String
        gender = dictionary["gender"] as? String
        image = dictionary["image"] as? String
        isActive = dictionary["isActive"] as? Bool
        isApproved = dictionary["isApproved"] as? Bool
        isEmailVerified = dictionary["isEmailVerified"] as? Bool
        isLoggedIn = dictionary["isLoggedIn"] as? Bool
        if (dictionary["role"] != nil) { role = ResendCodeRole(dictionary: dictionary["role"] as! NSDictionary) }
        createdAt = dictionary["createdAt"] as? String
        updatedAt = dictionary["updatedAt"] as? String
        detailEn = dictionary["detailEn"] as? String
        detailAr = dictionary["detailAr"] as? String
        if (dictionary["language"] != nil) { language = ResendCodeLanguage(dictionary: dictionary["language"] as! NSDictionary) }
        city = dictionary["city"] as? String
        authorization = dictionary["authorization"] as? String
    }
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.detail, forKey: "detail")
       // dictionary.setValue(self.orgnizationTitle?.dictionaryRepresentation(), forKey: "orgnizationTitle")
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
        dictionary.setValue(self.detailEn, forKey: "detailEn")
        dictionary.setValue(self.detailAr, forKey: "detailAr")
        dictionary.setValue(self.language?.dictionaryRepresentation(), forKey: "language")
        dictionary.setValue(self.city, forKey: "city")
        dictionary.setValue(self.authorization, forKey: "authorization")
        
        return dictionary
    }
    
}


public class ResendCodErrors {
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [ResendCodErrors]
    {
        var models:[ResendCodErrors] = []
        for item in array
        {
            models.append(ResendCodErrors(dictionary: item as! NSDictionary)!)
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


public class ResendCodeLanguage {
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [ResendCodeLanguage]
    {
        var models:[ResendCodeLanguage] = []
        for item in array
        {
            models.append(ResendCodeLanguage(dictionary: item as! NSDictionary)!)
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


public class ResendCodeOrgnizationTitle {
    public var en : String?
    public var ar : String?
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [ResendCodeOrgnizationTitle]
    {
        var models:[ResendCodeOrgnizationTitle] = []
        for item in array
        {
            models.append(ResendCodeOrgnizationTitle(dictionary: item as! NSDictionary)!)
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

public class ResendCodeRole {
    public var _id : String?
    public var title : String?
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [ResendCodeRole]
    {
        var models:[ResendCodeRole] = []
        for item in array
        {
            models.append(ResendCodeRole(dictionary: item as! NSDictionary)!)
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
