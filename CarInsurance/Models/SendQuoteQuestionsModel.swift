//
//  SendQuoteQuestionsModel.swift
//  CarInsurance
//
//  Created by Apple on 8/6/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
public class sendquoteQuestions {
    public var success : Bool?
    public var message : String?
    public var data : sendquoteQuestionsData?
    public var errors : sendquoteQuestionsErrors?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [sendquoteQuestions]
    {
        var models:[sendquoteQuestions] = []
        for item in array
        {
            models.append(sendquoteQuestions(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        message = dictionary["message"] as? String
        if (dictionary["data"] != nil) { data = sendquoteQuestionsData(dictionary: dictionary["data"] as! NSDictionary) }
        if (dictionary["errors"] != nil) { errors = sendquoteQuestionsErrors(dictionary: dictionary["errors"] as! NSDictionary) }
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

public class sendquoteQuestionsData {
    public var addionalService : Array<sendquoteQuestionsAddionalService>?
    public var basicService : sendquoteQuestionsBasicService?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [sendquoteQuestionsData]
    {
        var models:[sendquoteQuestionsData] = []
        for item in array
        {
            models.append(sendquoteQuestionsData(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        if (dictionary["addionalService"] != nil) { addionalService = sendquoteQuestionsAddionalService.modelsFromDictionaryArray(array: dictionary["addionalService"] as! NSArray) }
        if (dictionary["basicService"] != nil) { basicService = sendquoteQuestionsBasicService(dictionary: dictionary["basicService"] as! NSDictionary) }
    }
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.basicService?.dictionaryRepresentation(), forKey: "basicService")
        
        return dictionary
    }
    
}
public class sendquoteQuestionsErrors {
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [sendquoteQuestionsErrors]
    {
        var models:[sendquoteQuestionsErrors] = []
        for item in array
        {
            models.append(sendquoteQuestionsErrors(dictionary: item as! NSDictionary)!)
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


public class sendquoteQuestionsBasicService {
    public var _id : String?
    public var title : String?
    public var sortOrder : Int?
    public var questions : Array<sendquoteQuestionsQuestions>?
    public var children : Array<Children>?
    public var titleEn : String?
    public var titleAr : String?
    

    public class func modelsFromDictionaryArray(array:NSArray) -> [sendquoteQuestionsBasicService]
    {
        var models:[sendquoteQuestionsBasicService] = []
        for item in array
        {
            models.append(sendquoteQuestionsBasicService(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        sortOrder = dictionary["sortOrder"] as? Int
        if (dictionary["questions"] != nil) { questions = sendquoteQuestionsQuestions.modelsFromDictionaryArray(array: dictionary["questions"] as! NSArray) }
        if (dictionary["children"] != nil) { children = Children.modelsFromDictionaryArray(array: dictionary["children"] as! NSArray) }
        titleEn = dictionary["titleEn"] as? String
        titleAr = dictionary["titleAr"] as? String
    }
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.sortOrder, forKey: "sortOrder")
        dictionary.setValue(self.titleEn, forKey: "titleEn")
        dictionary.setValue(self.titleAr, forKey: "titleAr")
        
        return dictionary
    }
    
}
public class sendquoteQuestionsAddionalService {
    public var _id : String?
    public var title : String?
    public var isActive : Bool?
    public var sortOrder : Int?
    public var createdAt : String?
    public var updatedAt : String?
    public var titleEn : String?
    public var titleAr : String?
    public var isSelected : Bool?
    public var value: String?
    public class func modelsFromDictionaryArray(array:NSArray) -> [sendquoteQuestionsAddionalService]
    {
        var models:[sendquoteQuestionsAddionalService] = []
        for item in array
        {
            models.append(sendquoteQuestionsAddionalService(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
   
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        isActive = dictionary["isActive"] as? Bool
        sortOrder = dictionary["sortOrder"] as? Int
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
        dictionary.setValue(self.createdAt, forKey: "createdAt")
        dictionary.setValue(self.updatedAt, forKey: "updatedAt")
        dictionary.setValue(self.titleEn, forKey: "titleEn")
        dictionary.setValue(self.titleAr, forKey: "titleAr")
        
        return dictionary
    }
    
}


public class sendquoteQuestionsOptions {
    public var _id : String?
    public var title : String?
    public var children : Array<Children>?
    public var titleEn : String?
    public var titleAr : String?
    

    public class func modelsFromDictionaryArray(array:NSArray) -> [sendquoteQuestionsOptions]
    {
        var models:[sendquoteQuestionsOptions] = []
        for item in array
        {
            models.append(sendquoteQuestionsOptions(dictionary: item as! NSDictionary)!)
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


public class sendquoteQuestionsQuestions {
    public var _id : String?
    public var title : String?
    public var placeholder : String?
    public var isRequired : Bool?
    public var questionType : String?
    public var options : Array<sendquoteQuestionsOptions>?
    public var titleEn : String?
    public var titleAr : String?
    public var placeholderEn : String?
    public var placeholderAr : String?
    
    public var selectans :Int?
    public var yes:String?
    public var no:String?
    public var answerValue:String?
    public var BasicPrice: String?
    public var isSelected : Bool?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [sendquoteQuestionsQuestions]
    {
        var models:[sendquoteQuestionsQuestions] = []
        for item in array
        {
            models.append(sendquoteQuestionsQuestions(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
   
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        placeholder = dictionary["placeholder"] as? String
        isRequired = dictionary["isRequired"] as? Bool
        questionType = dictionary["questionType"] as? String
        if (dictionary["options"] != nil) { options = sendquoteQuestionsOptions.modelsFromDictionaryArray(array: dictionary["options"] as! NSArray) }
        titleEn = dictionary["titleEn"] as? String
        titleAr = dictionary["titleAr"] as? String
        placeholderEn = dictionary["placeholderEn"] as? String
        placeholderAr = dictionary["placeholderAr"] as? String
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
        
        return dictionary
    }
    
}


class sendQuotParams {
    var basicparams : [String : Any] = [:]
    var addtionalparams : [String : Any] = [:]
    var basicprice: String?
    
    
}
