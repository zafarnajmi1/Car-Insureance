//
//  ResetPasswordModel.swift
//  CarInsurance
//
//  Created by Apple on 7/5/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation


public class ResetPAssword {
    public var success : Bool?
    public var message : String?
    public var data : ResetPAsswordData?
    public var errors : ResetPAsswordErrors?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [ResetPAssword]
    {
        var models:[ResetPAssword] = []
        for item in array
        {
            models.append(ResetPAssword(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    

    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        message = dictionary["message"] as? String
        if (dictionary["data"] != nil) { data = ResetPAsswordData(dictionary: dictionary["data"] as! NSDictionary) }
        if (dictionary["errors"] != nil) { errors = ResetPAsswordErrors(dictionary: dictionary["errors"] as! NSDictionary) }
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
public class ResetPAsswordData {
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [ResetPAsswordData]
    {
        var models:[ResetPAsswordData] = []
        for item in array
        {
            models.append(ResetPAsswordData(dictionary: item as! NSDictionary)!)
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
public class ResetPAsswordErrors {
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [ResetPAsswordErrors]
    {
        var models:[ResetPAsswordErrors] = []
        for item in array
        {
            models.append(ResetPAsswordErrors(dictionary: item as! NSDictionary)!)
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
