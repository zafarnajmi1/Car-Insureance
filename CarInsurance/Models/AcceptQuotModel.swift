//
//  AcceptQuotModel.swift
//  CarInsurance
//
//  Created by Apple on 8/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
public class acceptquot {
    public var success : Bool?
    public var message : String?
    public var data : Array<String>?
    public var errors : acceptquotErrors?
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [acceptquot]
    {
        var models:[acceptquot] = []
        for item in array
        {
            models.append(acceptquot(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        message = dictionary["message"] as? String
        data = dictionary["data"] as? Array<String>
        //if (dictionary["data"] != nil) { data = Data.modelsFromDictionaryArray(dictionary["data"] as! NSArray) }
        if (dictionary["errors"] != nil) { errors = acceptquotErrors(dictionary: dictionary["errors"] as! NSDictionary) }
    }
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.success, forKey: "success")
        dictionary.setValue(self.message, forKey: "message")
        dictionary.setValue(self.errors?.dictionaryRepresentation(), forKey: "errors")
        
        return dictionary
    }
    
}


public class acceptquotErrors {
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [acceptquotErrors]
    {
        var models:[acceptquotErrors] = []
        for item in array
        {
            models.append(acceptquotErrors(dictionary: item as! NSDictionary)!)
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
