//
//  MoreData.swift
//  Baqala
//
//  Created by Apple on 12/31/18.
//  Copyright © 2018 My Technology. All rights reserved.
//

import Foundation
import UIKit

public class MoreData {
    public var success : Bool?
    public var data : DataComplete?
    public var message : String?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [MoreData]
    {
        var models:[MoreData] = []
        for item in array
        {
            models.append(MoreData(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        if (dictionary["data"] != nil) { data = DataComplete(dictionary: dictionary["data"] as! NSDictionary) }
        message = dictionary["message"] as? String
    }
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.success, forKey: "success")
        dictionary.setValue(self.data?.dictionaryRepresentation(), forKey: "data")
        dictionary.setValue(self.message, forKey: "message")
        
        return dictionary
    }
    
}


public class DataComplete {
    public var percent : Double?
    public var place : Int?
    public var pointer : String?

    public class func modelsFromDictionaryArray(array:NSArray) -> [DataComplete]
    {
        var models:[DataComplete] = []
        for item in array
        {
            models.append(DataComplete(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    required public init?(dictionary: NSDictionary) {
        
        percent = dictionary["percent"] as? Double
        place = dictionary["place"] as? Int
        pointer = dictionary["pointer"] as? String
    }
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.percent, forKey: "percent")
        dictionary.setValue(self.place, forKey: "place")
        dictionary.setValue(self.pointer, forKey: "pointer")
        
        return dictionary
    }
    
}

