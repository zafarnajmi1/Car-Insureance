//
//  SocialLoginModel.swift
//  CarInsurance
//
//  Created by Apple on 7/4/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
public class socialLogin {
    public var success : Bool?
    public var message : String?
    public var data : socialLoginData?
    public var errors : socialLoginErrors?
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [socialLogin]
    {
        var models:[socialLogin] = []
        for item in array
        {
            models.append(socialLogin(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    

    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        message = dictionary["message"] as? String
        if (dictionary["data"] != nil) { data = socialLoginData(dictionary: dictionary["data"] as! NSDictionary) }
        if (dictionary["errors"] != nil) { errors = socialLoginErrors(dictionary: dictionary["errors"] as! NSDictionary) }
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




public class socialLoginData {
    public var detail : socialLoginDetail?
    public var orgnizationTitle : socialLoginOrgnizationTitle?
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
    public var _id : String?
    public var role : socialLoginRole?
    public var createdAt : String?
    public var updatedAt : String?
    public var language : socialLoginLanguage?
    public var city : String?
    public var authorization : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [socialLoginData]
    {
        var models:[socialLoginData] = []
        for item in array
        {
            models.append(socialLoginData(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
   
    required public init?(dictionary: NSDictionary) {
        
        if (dictionary["detail"] != nil) { detail = socialLoginDetail(dictionary: dictionary["detail"] as! NSDictionary) }
        if (dictionary["orgnizationTitle"] != nil) { orgnizationTitle = socialLoginOrgnizationTitle(dictionary: dictionary["orgnizationTitle"] as! NSDictionary) }
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
        _id = dictionary["_id"] as? String
        if (dictionary["role"] != nil) { role = socialLoginRole(dictionary: dictionary["role"] as! NSDictionary) }
        createdAt = dictionary["createdAt"] as? String
        updatedAt = dictionary["updatedAt"] as? String
        if (dictionary["language"] != nil) { language = socialLoginLanguage(dictionary: dictionary["language"] as! NSDictionary) }
        city = dictionary["city"] as? String
        authorization = dictionary["authorization"] as? String
    }
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.detail?.dictionaryRepresentation(), forKey: "detail")
        dictionary.setValue(self.orgnizationTitle?.dictionaryRepresentation(), forKey: "orgnizationTitle")
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
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.role?.dictionaryRepresentation(), forKey: "role")
        dictionary.setValue(self.createdAt, forKey: "createdAt")
        dictionary.setValue(self.updatedAt, forKey: "updatedAt")
        dictionary.setValue(self.language?.dictionaryRepresentation(), forKey: "language")
        dictionary.setValue(self.city, forKey: "city")
        dictionary.setValue(self.authorization, forKey: "authorization")
        
        return dictionary
    }
    
}


public class socialLoginOrgnizationTitle {
    public var en : String?
    public var ar : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [socialLoginOrgnizationTitle]
    {
        var models:[socialLoginOrgnizationTitle] = []
        for item in array
        {
            models.append(socialLoginOrgnizationTitle(dictionary: item as! NSDictionary)!)
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



public class socialLoginErrors {
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [socialLoginErrors]
    {
        var models:[socialLoginErrors] = []
        for item in array
        {
            models.append(socialLoginErrors(dictionary: item as! NSDictionary)!)
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




public class socialLoginRole {
    public var title : String?
    public var _id : String?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [socialLoginRole]
    {
        var models:[socialLoginRole] = []
        for item in array
        {
            models.append(socialLoginRole(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    

    required public init?(dictionary: NSDictionary) {
        
        title = dictionary["title"] as? String
        _id = dictionary["_id"] as? String
    }
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self._id, forKey: "_id")
        
        return dictionary
    }
    
}


public class socialLoginDetail {
    public var en : String?
    public var ar : String?
    

    public class func modelsFromDictionaryArray(array:NSArray) -> [socialLoginDetail]
    {
        var models:[socialLoginDetail] = []
        for item in array
        {
            models.append(socialLoginDetail(dictionary: item as! NSDictionary)!)
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


public class socialLoginLanguage {
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [socialLoginLanguage]
    {
        var models:[socialLoginLanguage] = []
        for item in array
        {
            models.append(socialLoginLanguage(dictionary: item as! NSDictionary)!)
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






//public class socialLogin {
//    public var success : Bool?
//    public var message : String?
//    public var data : socialLoginData?
//    public var errors : socialLoginErrors?
//
//    public class func modelsFromDictionaryArray(array:NSArray) -> [socialLogin]
//    {
//        var models:[socialLogin] = []
//        for item in array
//        {
//            models.append(socialLogin(dictionary: item as! NSDictionary)!)
//        }
//        return models
//    }
//
//    required public init?(dictionary: NSDictionary) {
//
//        success = dictionary["success"] as? Bool
//        message = dictionary["message"] as? String
//        if (dictionary["data"] != nil) { data = socialLoginData(dictionary: dictionary["data"] as! NSDictionary) }
//        if (dictionary["errors"] != nil) { errors = socialLoginErrors(dictionary: dictionary["errors"] as! NSDictionary) }
//    }
//
//    public func dictionaryRepresentation() -> NSDictionary {
//
//        let dictionary = NSMutableDictionary()
//
//        dictionary.setValue(self.success, forKey: "success")
//        dictionary.setValue(self.message, forKey: "message")
//        dictionary.setValue(self.data?.dictionaryRepresentation(), forKey: "data")
//        dictionary.setValue(self.errors?.dictionaryRepresentation(), forKey: "errors")
//
//        return dictionary
//    }
//
//}
//public class socialLoginData {
//    public var exists : Bool?
//
//
//    public class func modelsFromDictionaryArray(array:NSArray) -> [socialLoginData]
//    {
//        var models:[socialLoginData] = []
//        for item in array
//        {
//            models.append(socialLoginData(dictionary: item as! NSDictionary)!)
//        }
//        return models
//    }
//
//    required public init?(dictionary: NSDictionary) {
//
//        exists = dictionary["exists"] as? Bool
//    }
//
//
//    public func dictionaryRepresentation() -> NSDictionary {
//
//        let dictionary = NSMutableDictionary()
//
//        dictionary.setValue(self.exists, forKey: "exists")
//
//        return dictionary
//    }
//
//}
//public class socialLoginErrors {
//
//
//    public class func modelsFromDictionaryArray(array:NSArray) -> [socialLoginErrors]
//    {
//        var models:[socialLoginErrors] = []
//        for item in array
//        {
//            models.append(socialLoginErrors(dictionary: item as! NSDictionary)!)
//        }
//        return models
//    }
//
//
//    required public init?(dictionary: NSDictionary) {
//
//    }
//
//    public func dictionaryRepresentation() -> NSDictionary {
//
//        let dictionary = NSMutableDictionary()
//
//
//        return dictionary
//    }
//
//}
