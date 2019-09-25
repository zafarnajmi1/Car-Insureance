//
//  CompleteData.swift
//  Baqala
//
//  Created by Apple on 12/31/18.
//  Copyright © 2018 My Technology. All rights reserved.
//

import Foundation

public class CompleteChat {
    public var success : Bool?
    public var message : String?
    public var data : CompleteData?
    public var errors : ConversationErrors?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [CompleteChat]
    {
        var models:[CompleteChat] = []
        for item in array
        {
            models.append(CompleteChat(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        message = dictionary["message"] as? String
        if (dictionary["data"] != nil) { data = CompleteData(dictionary: dictionary["data"] as! NSDictionary) }
        if (dictionary["errors"] != nil) { errors = ConversationErrors(dictionary: dictionary["errors"] as! NSDictionary) }
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


public class CompleteData {
    public var fileName : String?
    public var progress : Int?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [CompleteData]
    {
        var models:[CompleteData] = []
        for item in array
        {
            models.append(CompleteData(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {
        
        fileName = dictionary["fileName"] as? String
        progress = dictionary["progress"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.fileName, forKey: "fileName")
        dictionary.setValue(self.progress, forKey: "progress")
        
        return dictionary
    }
    
}
public class ConversationErrors {
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [ConversationErrors]
    {
        var models:[ConversationErrors] = []
        for item in array
        {
            models.append(ConversationErrors(dictionary: item as! NSDictionary)!)
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
