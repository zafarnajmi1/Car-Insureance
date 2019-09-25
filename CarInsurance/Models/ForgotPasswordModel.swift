//
//  ForgotPasswordModel.swift
//  CarInsurance
//
//  Created by Apple on 7/4/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
public class forgotPassword {
    public var success : Bool?
    public var message : String?
    public var data : forgotPasswordData?
    public var errors : forgotPasswordErrors?
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [forgotPassword]
    {
        var models:[forgotPassword] = []
        for item in array
        {
            models.append(forgotPassword(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        message = dictionary["message"] as? String
        if (dictionary["data"] != nil) { data = forgotPasswordData(dictionary: dictionary["data"] as! NSDictionary) }
        if (dictionary["errors"] != nil) { errors = forgotPasswordErrors(dictionary: dictionary["errors"] as! NSDictionary) }
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
public class forgotPasswordData {
    public var _id : String?
    public var firstName : String?
    public var lastName : String?
    public var email : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [forgotPasswordData]
    {
        var models:[forgotPasswordData] = []
        for item in array
        {
            models.append(forgotPasswordData(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
   
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        firstName = dictionary["firstName"] as? String
        lastName = dictionary["lastName"] as? String
        email = dictionary["email"] as? String
    }
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.firstName, forKey: "firstName")
        dictionary.setValue(self.lastName, forKey: "lastName")
        dictionary.setValue(self.email, forKey: "email")
        
        return dictionary
    }
    
}
public class forgotPasswordErrors {
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [forgotPasswordErrors]
    {
        var models:[forgotPasswordErrors] = []
        for item in array
        {
            models.append(forgotPasswordErrors(dictionary: item as! NSDictionary)!)
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
