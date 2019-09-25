//
//  ContactUsModels.swift
//  CarInsurance
//
//  Created by Apple on 7/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
public class ContactUs {
    public var success : Bool?
    public var message : String?
    public var data : ContactUsData?
    public var errors : ContactUsErrors?
    

    public class func modelsFromDictionaryArray(array:NSArray) -> [ContactUs]
    {
        var models:[ContactUs] = []
        for item in array
        {
            models.append(ContactUs(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    

    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        message = dictionary["message"] as? String
        if (dictionary["data"] != nil) { data = ContactUsData(dictionary: dictionary["data"] as! NSDictionary) }
        if (dictionary["errors"] != nil) { errors = ContactUsErrors(dictionary: dictionary["errors"] as! NSDictionary) }
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


public class ContactUsData {
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [ContactUsData]
    {
        var models:[ContactUsData] = []
        for item in array
        {
            models.append(ContactUsData(dictionary: item as! NSDictionary)!)
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
public class ContactUsErrors {
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [ContactUsErrors]
    {
        var models:[ContactUsErrors] = []
        for item in array
        {
            models.append(ContactUsErrors(dictionary: item as! NSDictionary)!)
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
