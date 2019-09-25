//
//  LoginModel.swift
//  CarInsurance
//
//  Created by Apple on 7/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
public class login {
    public var success : Bool?
    public var message : String?
    public var data : LoginData?
    public var errors : Errors?
    

    public class func modelsFromDictionaryArray(array:NSArray) -> [login]
    {
        var models:[login] = []
        for item in array
        {
            models.append(login(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        message = dictionary["message"] as? String
        if (dictionary["data"] != nil) { data = LoginData(dictionary: dictionary["data"] as! NSDictionary) }
        if (dictionary["errors"] != nil) { errors = Errors(dictionary: dictionary["errors"] as! NSDictionary) }
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

public class LoginData {
    
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
    public var isLoggedIn : Bool?
    public var role : Role?
    public var createdAt : String?
    public var updatedAt : String?
    public var addresses : Array<Addresses>?
    public var notificationsSetting : NotificationsSetting?
    public var detailEn : String?
    public var detailAr : String?
    public var language : Language?
    public var city : String?
    public var authorization : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [LoginData]
    {
        var models:[LoginData] = []
        for item in array
        {
            models.append(LoginData(dictionary: item as! NSDictionary)!)
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
        location = dictionary["location"]  as? Array<Double>
        //if (dictionary["location"] != nil) { location = Location.modelsFromDictionaryArray(dictionary["location"] as! NSArray) }
        accountType = dictionary["accountType"] as? String
        gender = dictionary["gender"] as? String
        image = dictionary["image"] as? String
        isActive = dictionary["isActive"] as? Bool
        isApproved = dictionary["isApproved"] as? Bool
        isEmailVerified = dictionary["isEmailVerified"] as? Bool
        isLoggedIn = dictionary["isLoggedIn"] as? Bool
        if (dictionary["role"] != nil) { role = Role(dictionary: dictionary["role"] as! NSDictionary) }
        createdAt = dictionary["createdAt"] as? String
        updatedAt = dictionary["updatedAt"] as? String
        if (dictionary["addresses"] != nil) { addresses = Addresses.modelsFromDictionaryArray(array: dictionary["addresses"] as! NSArray) }
        if (dictionary["notificationsSetting"] != nil) { notificationsSetting = NotificationsSetting(dictionary: dictionary["notificationsSetting"] as! NSDictionary) }
        detailEn = dictionary["detailEn"] as? String
        detailAr = dictionary["detailAr"] as? String
        if (dictionary["language"] != nil) { language = Language(dictionary: dictionary["language"] as! NSDictionary) }
        city = dictionary["city"] as? String
        authorization = dictionary["authorization"] as? String
    }

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
        dictionary.setValue(self.isLoggedIn, forKey: "isLoggedIn")
        dictionary.setValue(self.role?.dictionaryRepresentation(), forKey: "role")
        dictionary.setValue(self.createdAt, forKey: "createdAt")
        dictionary.setValue(self.updatedAt, forKey: "updatedAt")
        dictionary.setValue(self.notificationsSetting?.dictionaryRepresentation(), forKey: "notificationsSetting")
        dictionary.setValue(self.detailEn, forKey: "detailEn")
        dictionary.setValue(self.detailAr, forKey: "detailAr")
        dictionary.setValue(self.language?.dictionaryRepresentation(), forKey: "language")
        dictionary.setValue(self.city, forKey: "city")
        dictionary.setValue(self.authorization, forKey: "authorization")
        
        return dictionary
    }

    
    
//    public var _id : String?
//    public var detail : String?
//    //public var orgnizationTitle : OrgnizationTitle?
//    public var fullName : String?
//    public var firstName : String?
//    public var lastName : String?
//    public var email : String?
//    public var phone : String?
//    public var address : String?
//    public var location : Array<Int>?
//    public var accountType : String?
//    public var gender : String?
//    public var image : String?
//    public var isActive : Bool?
//    public var isApproved : Bool?
//    public var isEmailVerified : Bool?
//    public var isLoggedIn : Bool?
//    public var role : Role?
//    public var createdAt : String?
//    public var updatedAt : String?
//    public var detailEn : String?
//    public var detailAr : String?
//    public var language : Language?
//    public var city : String?
//    public var authorization : String?
//
//
//    public class func modelsFromDictionaryArray(array:NSArray) -> [LoginData]
//    {
//        var models:[LoginData] = []
//        for item in array
//        {
//            models.append(LoginData(dictionary: item as! NSDictionary)!)
//        }
//        return models
//    }
//
//    required public init?(dictionary: NSDictionary) {
//
//        _id = dictionary["_id"] as? String
//        detail = dictionary["detail"] as? String
//        //if (dictionary["orgnizationTitle"] != nil) { orgnizationTitle = OrgnizationTitle(dictionary: dictionary["orgnizationTitle"] as! NSDictionary) }
//        fullName = dictionary["fullName"] as? String
//        firstName = dictionary["firstName"] as? String
//        lastName = dictionary["lastName"] as? String
//        email = dictionary["email"] as? String
//        phone = dictionary["phone"] as? String
//        address = dictionary["address"] as? String
//        location = dictionary["location"] as? Array<Int>
//        //if (dictionary["location"] != nil) { location = Location.modelsFromDictionaryArray(dictionary["location"] as! NSArray) }
//        accountType = dictionary["accountType"] as? String
//        gender = dictionary["gender"] as? String
//        image = dictionary["image"] as? String
//        isActive = dictionary["isActive"] as? Bool
//        isApproved = dictionary["isApproved"] as? Bool
//        isEmailVerified = dictionary["isEmailVerified"] as? Bool
//        isLoggedIn = dictionary["isLoggedIn"] as? Bool
//        if (dictionary["role"] != nil) { role = Role(dictionary: dictionary["role"] as! NSDictionary) }
//        createdAt = dictionary["createdAt"] as? String
//        updatedAt = dictionary["updatedAt"] as? String
//        detailEn = dictionary["detailEn"] as? String
//        detailAr = dictionary["detailAr"] as? String
//        if (dictionary["language"] != nil) { language = Language(dictionary: dictionary["language"] as! NSDictionary) }
//        city = dictionary["city"] as? String
//        authorization = dictionary["authorization"] as? String
//    }
//
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
//        dictionary.setValue(self.isLoggedIn, forKey: "isLoggedIn")
//        dictionary.setValue(self.role?.dictionaryRepresentation(), forKey: "role")
//        dictionary.setValue(self.createdAt, forKey: "createdAt")
//        dictionary.setValue(self.updatedAt, forKey: "updatedAt")
//        dictionary.setValue(self.detailEn, forKey: "detailEn")
//        dictionary.setValue(self.detailAr, forKey: "detailAr")
//        dictionary.setValue(self.language?.dictionaryRepresentation(), forKey: "language")
//        dictionary.setValue(self.city, forKey: "city")
//        dictionary.setValue(self.authorization, forKey: "authorization")
//
//        return dictionary
//    }
//
}






public class Role {
    public var _id : String?
    public var title : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [Role]
    {
        var models:[Role] = []
        for item in array
        {
            models.append(Role(dictionary: item as! NSDictionary)!)
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



public class OrgnizationTitle {
    public var en : String?
    public var ar : String?
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [OrgnizationTitle]
    {
        var models:[OrgnizationTitle] = []
        for item in array
        {
            models.append(OrgnizationTitle(dictionary: item as! NSDictionary)!)
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


public class Language {
    

    public class func modelsFromDictionaryArray(array:NSArray) -> [Language]
    {
        var models:[Language] = []
        for item in array
        {
            models.append(Language(dictionary: item as! NSDictionary)!)
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

public class Errors {
    

    public class func modelsFromDictionaryArray(array:NSArray) -> [Errors]
    {
        var models:[Errors] = []
        for item in array
        {
            models.append(Errors(dictionary: item as! NSDictionary)!)
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
public class Addresses {
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
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [Addresses]
    {
        var models:[Addresses] = []
        for item in array
        {
            models.append(Addresses(dictionary: item as! NSDictionary)!)
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



public class NotificationsSetting {
    public var quotes : Bool?
    public var chats : Bool?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [NotificationsSetting]
    {
        var models:[NotificationsSetting] = []
        for item in array
        {
            models.append(NotificationsSetting(dictionary: item as! NSDictionary)!)
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
