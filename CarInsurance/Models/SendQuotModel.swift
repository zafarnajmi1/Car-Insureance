//
//  SendQuotModel.swift
//  CarInsurance
//
//  Created by Apple on 8/9/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

public class sendQuot {
    public var success : Bool?
    public var message : String?
    public var data : sendQuotData?
    public var errors : sendQuotErrors?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [sendQuot]
    {
        var models:[sendQuot] = []
        for item in array
        {
            models.append(sendQuot(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
   
    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        message = dictionary["message"] as? String
        if (dictionary["data"] != nil) { data = sendQuotData(dictionary: dictionary["data"] as! NSDictionary) }
        if (dictionary["errors"] != nil) { errors = sendQuotErrors(dictionary: dictionary["errors"] as! NSDictionary) }
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



public class sendQuotData {
    public var quoteTotalAmount : Int?
    public var basicAmount : Int?
    public var status : String?
    public var _id : String?
    public var order : String?
    public var company : String?
    public var basicService : sendQuotBasicService?
    public var additionalServices : Array<sendQuotAdditionalServices>?
    public var createdAt : String?
    public var updatedAt : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [sendQuotData]
    {
        var models:[sendQuotData] = []
        for item in array
        {
            models.append(sendQuotData(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    

    required public init?(dictionary: NSDictionary) {
        
        quoteTotalAmount = dictionary["quoteTotalAmount"] as? Int
        basicAmount = dictionary["basicAmount"] as? Int
        status = dictionary["status"] as? String
        _id = dictionary["_id"] as? String
        order = dictionary["order"] as? String
        company = dictionary["company"] as? String
        if (dictionary["basicService"] != nil) { basicService = sendQuotBasicService(dictionary: dictionary["basicService"] as! NSDictionary) }
        if (dictionary["additionalServices"] != nil) { additionalServices = sendQuotAdditionalServices.modelsFromDictionaryArray(array: dictionary["additionalServices"] as! NSArray) }
        createdAt = dictionary["createdAt"] as? String
        updatedAt = dictionary["updatedAt"] as? String
    }
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.quoteTotalAmount, forKey: "quoteTotalAmount")
        dictionary.setValue(self.basicAmount, forKey: "basicAmount")
        dictionary.setValue(self.status, forKey: "status")
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.order, forKey: "order")
        dictionary.setValue(self.company, forKey: "company")
        dictionary.setValue(self.basicService?.dictionaryRepresentation(), forKey: "basicService")
        dictionary.setValue(self.createdAt, forKey: "createdAt")
        dictionary.setValue(self.updatedAt, forKey: "updatedAt")
        
        return dictionary
    }
    
}



public class sendQuotErrors {
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [sendQuotErrors]
    {
        var models:[sendQuotErrors] = []
        for item in array
        {
            models.append(sendQuotErrors(dictionary: item as! NSDictionary)!)
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

public class sendQuotBasicService {
    public var _id : String?
    public var title : String?
    public var isActive : Bool?
    public var sortOrder : Int?
    public var image : String?
    public var questions : Array<sendQuotQuestions>?
    public var children : Array<Children>?
    public var depth : Int?
    public var createdAt : String?
    public var updatedAt : String?
    public var titleEn : String?
    public var titleAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [sendQuotBasicService]
    {
        var models:[sendQuotBasicService] = []
        for item in array
        {
            models.append(sendQuotBasicService(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    

    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        isActive = dictionary["isActive"] as? Bool
        sortOrder = dictionary["sortOrder"] as? Int
        image = dictionary["image"] as? String
        if (dictionary["questions"] != nil) { questions = sendQuotQuestions.modelsFromDictionaryArray(array: dictionary["questions"] as! NSArray) }
        if (dictionary["children"] != nil) { children = Children.modelsFromDictionaryArray(array: dictionary["children"] as! NSArray) }
        depth = dictionary["depth"] as? Int
        createdAt = dictionary["createdAt"] as? String
        updatedAt = dictionary["updatedAt"] as? String
        titleEn = dictionary["titleEn"] as? String
        titleAr = dictionary["titleAr"] as? String
    }
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.isActive, forKey: "isActive")
        dictionary.setValue(self.sortOrder, forKey: "sortOrder")
        dictionary.setValue(self.image, forKey: "image")
        dictionary.setValue(self.depth, forKey: "depth")
        dictionary.setValue(self.createdAt, forKey: "createdAt")
        dictionary.setValue(self.updatedAt, forKey: "updatedAt")
        dictionary.setValue(self.titleEn, forKey: "titleEn")
        dictionary.setValue(self.titleAr, forKey: "titleAr")
        
        return dictionary
    }
    
}




public class sendQuotQuestions {
    public var _id : String?
    public var title : String?
    public var placeholder : String?
    public var isRequired : Bool?
    public var questionType : String?
    public var options : Array<sendQuotOptions>?
    public var titleEn : String?
    public var titleAr : String?
    public var placeholderEn : String?
    public var placeholderAr : String?
    public var answer : sendQuotAnswer?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [sendQuotQuestions]
    {
        var models:[sendQuotQuestions] = []
        for item in array
        {
            models.append(sendQuotQuestions(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    

    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        placeholder = dictionary["placeholder"] as? String
        isRequired = dictionary["isRequired"] as? Bool
        questionType = dictionary["questionType"] as? String
        if (dictionary["options"] != nil) { options = sendQuotOptions.modelsFromDictionaryArray(array: dictionary["options"] as! NSArray) }
        titleEn = dictionary["titleEn"] as? String
        titleAr = dictionary["titleAr"] as? String
        placeholderEn = dictionary["placeholderEn"] as? String
        placeholderAr = dictionary["placeholderAr"] as? String
        if (dictionary["answer"] != nil) { answer = sendQuotAnswer(dictionary: (dictionary["answer"] as? NSDictionary) ?? [:]) }
    }
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.placeholder, forKey: "placeholder")
        dictionary.setValue(self.isRequired, forKey: "isRequired")
        dictionary.setValue(self.questionType, forKey: "questionType")
        dictionary.setValue(self.titleEn, forKey: "titleEn")
        dictionary.setValue(self.titleAr, forKey: "titleAr")
        dictionary.setValue(self.placeholderEn, forKey: "placeholderEn")
        dictionary.setValue(self.placeholderAr, forKey: "placeholderAr")
        dictionary.setValue(self.answer?.dictionaryRepresentation(), forKey: "answer")
        
        return dictionary
    }
    
}

public class sendQuotOptions {
    public var _id : String?
    public var title : String?
    public var children : Array<Children>?
    public var titleEn : String?
    public var titleAr : String?
    

    public class func modelsFromDictionaryArray(array:NSArray) -> [sendQuotOptions]
    {
        var models:[sendQuotOptions] = []
        for item in array
        {
            models.append(sendQuotOptions(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    

    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        if (dictionary["children"] != nil) { children = Children.modelsFromDictionaryArray(array: dictionary["children"] as! NSArray) }
        titleEn = dictionary["titleEn"] as? String
        titleAr = dictionary["titleAr"] as? String
    }
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.titleEn, forKey: "titleEn")
        dictionary.setValue(self.titleAr, forKey: "titleAr")
        
        return dictionary
    }
    
}
public class sendQuotAnswer {
    public var _id : String?
    public var title : String?
    public var children : Array<Children>?
    public var titleEn : String?
    public var titleAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [sendQuotAnswer]
    {
        var models:[sendQuotAnswer] = []
        for item in array
        {
            models.append(sendQuotAnswer(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        if (dictionary["children"] != nil) { children = Children.modelsFromDictionaryArray(array: dictionary["children"] as! NSArray) }
        titleEn = dictionary["titleEn"] as? String
        titleAr = dictionary["titleAr"] as? String
    }
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.titleEn, forKey: "titleEn")
        dictionary.setValue(self.titleAr, forKey: "titleAr")
        
        return dictionary
    }
    
}



public class sendQuotAdditionalServices {
    public var charges : Int?
    public var status : String?
    public var _id : String?
    public var service : String?
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [sendQuotAdditionalServices]
    {
        var models:[sendQuotAdditionalServices] = []
        for item in array
        {
            models.append(sendQuotAdditionalServices(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        charges = dictionary["charges"] as? Int
        status = dictionary["status"] as? String
        _id = dictionary["_id"] as? String
        service = dictionary["service"] as? String
    }
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.charges, forKey: "charges")
        dictionary.setValue(self.status, forKey: "status")
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.service, forKey: "service")
        
        return dictionary
    }
    
}
