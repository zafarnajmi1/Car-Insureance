//
//  ChangePasswordModel.swift
//  CarInsurance
//
//  Created by Apple on 7/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
public class changeuserPassword {
    public var success : Bool?
    public var message : String?
    public var data : changeuserPasswordData?
    public var errors : changeuserPasswordErrors?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [changeuserPassword]
    {
        var models:[changeuserPassword] = []
        for item in array
        {
            models.append(changeuserPassword(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        message = dictionary["message"] as? String
        if (dictionary["data"] != nil) { data = changeuserPasswordData(dictionary: dictionary["data"] as! NSDictionary) }
        if (dictionary["errors"] != nil) { errors = changeuserPasswordErrors(dictionary: dictionary["errors"] as! NSDictionary) }
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
public class changeuserPasswordData {
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [changeuserPasswordData]
    {
        var models:[changeuserPasswordData] = []
        for item in array
        {
            models.append(changeuserPasswordData(dictionary: item as! NSDictionary)!)
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

public class changeuserPasswordErrors {
    

    public class func modelsFromDictionaryArray(array:NSArray) -> [changeuserPasswordErrors]
    {
        var models:[changeuserPasswordErrors] = []
        for item in array
        {
            models.append(changeuserPasswordErrors(dictionary: item as! NSDictionary)!)
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
