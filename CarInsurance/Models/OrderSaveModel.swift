//
//  OrderSaveModel.swift
//  CarInsurance
//
//  Created by Apple on 8/1/19.
//  Copyright © 2019 Apple. All rights reserved.
//
//OrderSave
import Foundation





public class OrderSave {
    public var success : Bool?
    public var message : String?
    public var data : OrderSaveData?
    public var errors : OrderSaveErrors?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [OrderSave]
    {
        var models:[OrderSave] = []
        for item in array
        {
            models.append(OrderSave(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        message = dictionary["message"] as? String
        if (dictionary["data"] != nil) { data = OrderSaveData(dictionary: dictionary["data"] as! NSDictionary) }
        if (dictionary["errors"] != nil) { errors = OrderSaveErrors(dictionary: dictionary["errors"] as! NSDictionary) }
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



public class OrderSaveData {
    public var _id : String?
    public var companies : Array<String>?
    public var orderInfo : Array<OrderInfo>?
    public var quotes : Array<String>?
    public var quotesCount : Int?
    public var status : String?
    public var category : String?
    public var user : String?
    public var createdAt : String?
    public var updatedAt : String?
    public var orderNumber : String?
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [OrderSaveData]
    {
        var models:[OrderSaveData] = []
        for item in array
        {
            models.append(OrderSaveData(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        //if (dictionary["companies"] != nil) { companies = Companies.modelsFromDictionaryArray(dictionary["companies"] as! NSArray) }
        if (dictionary["orderInfo"] != nil) { orderInfo = OrderInfo.modelsFromDictionaryArray(array: dictionary["orderInfo"] as! NSArray) }
        //if (dictionary["quotes"] != nil) { quotes = Quotes.modelsFromDictionaryArray(dictionary["quotes"] as! NSArray) }
        
        quotes = dictionary["quotes"] as? Array<String>
        companies = dictionary["companies"] as? Array<String>
        
        quotesCount = dictionary["quotesCount"] as? Int
        status = dictionary["status"] as? String
        category = dictionary["category"] as? String
        user = dictionary["user"] as? String
        createdAt = dictionary["createdAt"] as? String
        updatedAt = dictionary["updatedAt"] as? String
        orderNumber = dictionary["orderNumber"] as? String
    }
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.quotesCount, forKey: "quotesCount")
        dictionary.setValue(self.status, forKey: "status")
        dictionary.setValue(self.category, forKey: "category")
        dictionary.setValue(self.user, forKey: "user")
        dictionary.setValue(self.createdAt, forKey: "createdAt")
        dictionary.setValue(self.updatedAt, forKey: "updatedAt")
        dictionary.setValue(self.orderNumber, forKey: "orderNumber")
        
        return dictionary
    }
    
}


public class OrderSaveErrors {
    

    public class func modelsFromDictionaryArray(array:NSArray) -> [OrderSaveErrors]
    {
        var models:[OrderSaveErrors] = []
        for item in array
        {
            models.append(OrderSaveErrors(dictionary: item as! NSDictionary)!)
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




public class OrderSaveQuestions {
    public var _id : String?
    public var title : String?
    public var placeholder : String?
    public var isRequired : Bool?
    public var questionType : String?
    public var options : Array<OrderSaveOptions>?
    public var titleEn : String?
    public var titleAr : String?
    public var placeholderEn : String?
    public var placeholderAr : String?
    public var answer : Answer?
    

    public class func modelsFromDictionaryArray(array:NSArray) -> [OrderSaveQuestions]
    {
        var models:[OrderSaveQuestions] = []
        for item in array
        {
            models.append(OrderSaveQuestions(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
   
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        placeholder = dictionary["placeholder"] as? String
        isRequired = dictionary["isRequired"] as? Bool
        questionType = dictionary["questionType"] as? String
        if (dictionary["options"] != nil) { options = OrderSaveOptions.modelsFromDictionaryArray(array: dictionary["options"] as! NSArray) }
        titleEn = dictionary["titleEn"] as? String
        titleAr = dictionary["titleAr"] as? String
        placeholderEn = dictionary["placeholderEn"] as? String
        placeholderAr = dictionary["placeholderAr"] as? String
        if (dictionary["answer"] != nil) { answer = Answer(dictionary: dictionary["answer"] as? NSDictionary ?? [:]) }
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



public class OrderInfo {
    public var _id : String?
    public var title : String?
    public var sortOrder : Int?
    public var questions : Array<OrderSaveQuestions>?
    public var children : Array<Children>?
    public var titleEn : String?
    public var titleAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [OrderInfo]
    {
        var models:[OrderInfo] = []
        for item in array
        {
            models.append(OrderInfo(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
   
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        sortOrder = dictionary["sortOrder"] as? Int
        if (dictionary["questions"] != nil) { questions = OrderSaveQuestions.modelsFromDictionaryArray(array: dictionary["questions"] as! NSArray) }
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



public class OrderSaveOptions {
    public var _id : String?
    public var title : String?
    public var children : Array<Children>?
    public var titleEn : String?
    public var titleAr : String?
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [OrderSaveOptions]
    {
        var models:[OrderSaveOptions] = []
        for item in array
        {
            models.append(OrderSaveOptions(dictionary: item as! NSDictionary)!)
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


public class Answer {
    public var _id : String?
    public var title : String?
    public var children : Array<Children>?
    public var titleEn : String?
    public var titleAr : String?
    

    public class func modelsFromDictionaryArray(array:NSArray) -> [Answer]
    {
        var models:[Answer] = []
        for item in array
        {
            models.append(Answer(dictionary: item as! NSDictionary)!)
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




















//public class OrderSave {
//    public var success : Bool?
//    public var message : String?
//    public var data : OrderSaveData?
//    public var errors : OrderSaveErrors?
//
//
//    public class func modelsFromDictionaryArray(array:NSArray) -> [OrderSave]
//    {
//        var models:[OrderSave] = []
//        for item in array
//        {
//            models.append(OrderSave(dictionary: item as! NSDictionary)!)
//        }
//        return models
//    }
//
//
//    required public init?(dictionary: NSDictionary) {
//
//        success = dictionary["success"] as? Bool
//        message = dictionary["message"] as? String
//        if (dictionary["data"] != nil) { data = OrderSaveData(dictionary: dictionary["data"] as! NSDictionary) }
//        if (dictionary["errors"] != nil) { errors = OrderSaveErrors(dictionary: dictionary["errors"] as! NSDictionary) }
//    }
//
//
//    public func dictionaryRepresentation() -> NSDictionary {
//
//        let dictionary = NSMutableDictionary()
//
//        dictionary.setValue(self.success, forKey: "success")
//        dictionary.setValue(self.message, forKey: "message")
//        dictionary.setValue(self.data?.dictionaryRepresentation(), forKey: "data")
//        dictionary.setValue(self.errors?.dictionaryRepresentation(), forKey: "errors")
//
//        return dictionary
//    }
//
//}
//
//
//public class OrderSaveQuestions {
//    public var _id : String?
//    public var title : String?
//    public var placeholder : String?
//    public var isRequired : Bool?
//    public var questionType : String?
//    public var options : Array<OrderSaveOptions>?
//    public var titleEn : String?
//    public var titleAr : String?
//    public var placeholderEn : String?
//    public var placeholderAr : String?
//    public var answer : Answer?
//
//
//    public class func modelsFromDictionaryArray(array:NSArray) -> [OrderSaveQuestions]
//    {
//        var models:[OrderSaveQuestions] = []
//        for item in array
//        {
//            models.append(OrderSaveQuestions(dictionary: item as! NSDictionary)!)
//        }
//        return models
//    }
//
//    required public init?(dictionary: NSDictionary) {
//
//        _id = dictionary["_id"] as? String
//        title = dictionary["title"] as? String
//        placeholder = dictionary["placeholder"] as? String
//        isRequired = dictionary["isRequired"] as? Bool
//        questionType = dictionary["questionType"] as? String
//        if (dictionary["options"] != nil) { options = OrderSaveOptions.modelsFromDictionaryArray(array: dictionary["options"] as! NSArray) }
//        titleEn = dictionary["titleEn"] as? String
//        titleAr = dictionary["titleAr"] as? String
//        placeholderEn = dictionary["placeholderEn"] as? String
//        placeholderAr = dictionary["placeholderAr"] as? String
//        if (dictionary["answer"] != nil) { answer = Answer(dictionary: dictionary["answer"] as! NSDictionary) }
//    }
//
//
//    public func dictionaryRepresentation() -> NSDictionary {
//
//        let dictionary = NSMutableDictionary()
//
//        dictionary.setValue(self._id, forKey: "_id")
//        dictionary.setValue(self.title, forKey: "title")
//        dictionary.setValue(self.placeholder, forKey: "placeholder")
//        dictionary.setValue(self.isRequired, forKey: "isRequired")
//        dictionary.setValue(self.questionType, forKey: "questionType")
//        dictionary.setValue(self.titleEn, forKey: "titleEn")
//        dictionary.setValue(self.titleAr, forKey: "titleAr")
//        dictionary.setValue(self.placeholderEn, forKey: "placeholderEn")
//        dictionary.setValue(self.placeholderAr, forKey: "placeholderAr")
//        dictionary.setValue(self.answer?.dictionaryRepresentation(), forKey: "answer")
//
//        return dictionary
//    }
//
//}
//
//public class OrderInfo {
//    public var _id : String?
//    public var title : String?
//    public var sortOrder : Int?
//    public var questions : Array<OrderSaveQuestions>?
//    public var children : Array<String>?
//    public var titleEn : String?
//    public var titleAr : String?
//
//
//    public class func modelsFromDictionaryArray(array:NSArray) -> [OrderInfo]
//    {
//        var models:[OrderInfo] = []
//        for item in array
//        {
//            models.append(OrderInfo(dictionary: item as! NSDictionary)!)
//        }
//        return models
//    }
//
//
//    required public init?(dictionary: NSDictionary) {
//
//        _id = dictionary["_id"] as? String
//        title = dictionary["title"] as? String
//        sortOrder = dictionary["sortOrder"] as? Int
//        if (dictionary["questions"] != nil) { questions = OrderSaveQuestions.modelsFromDictionaryArray(array: dictionary["questions"] as! NSArray) }
//        //if (dictionary["children"] != nil) { children = OrderSaveChildren.modelsFromDictionaryArray(dictionary["children"] as! NSArray) }
//        children = dictionary["children"] as? Array<String>
//        titleEn = dictionary["titleEn"] as? String
//        titleAr = dictionary["titleAr"] as? String
//    }
//
//
//
//    public func dictionaryRepresentation() -> NSDictionary {
//
//        let dictionary = NSMutableDictionary()
//
//        dictionary.setValue(self._id, forKey: "_id")
//        dictionary.setValue(self.title, forKey: "title")
//        dictionary.setValue(self.sortOrder, forKey: "sortOrder")
//        dictionary.setValue(self.titleEn, forKey: "titleEn")
//        dictionary.setValue(self.titleAr, forKey: "titleAr")
//
//        return dictionary
//    }
//
//}
//
//public class OrderSaveOptions {
//    public var _id : String?
//    public var title : String?
//    public var children : Array<String>?
//    public var titleEn : String?
//    public var titleAr : String?
//
//
//    public class func modelsFromDictionaryArray(array:NSArray) -> [OrderSaveOptions]
//    {
//        var models:[OrderSaveOptions] = []
//        for item in array
//        {
//            models.append(OrderSaveOptions(dictionary: item as! NSDictionary)!)
//        }
//        return models
//    }
//
//
//    required public init?(dictionary: NSDictionary) {
//
//        _id = dictionary["_id"] as? String
//        title = dictionary["title"] as? String
//        children = dictionary["children"] as? Array<String>
//        //if (dictionary["children"] != nil) { children = Children.modelsFromDictionaryArray(dictionary["children"] as! NSArray) }
//        titleEn = dictionary["titleEn"] as? String
//        titleAr = dictionary["titleAr"] as? String
//    }
//
//
//    /**
//     Returns the dictionary representation for the current instance.
//
//     - returns: NSDictionary.
//     */
//    public func dictionaryRepresentation() -> NSDictionary {
//
//        let dictionary = NSMutableDictionary()
//
//        dictionary.setValue(self._id, forKey: "_id")
//        dictionary.setValue(self.title, forKey: "title")
//        dictionary.setValue(self.titleEn, forKey: "titleEn")
//        dictionary.setValue(self.titleAr, forKey: "titleAr")
//
//        return dictionary
//    }
//
//}
//public class OrderSaveData {
//    public var _id : String?
//    public var companies : Array<String>?
//    public var orderInfo : Array<OrderInfo>?
//    public var quotes : Array<String>?
//    public var quotesCount : Int?
//    public var status : String?
//    public var category : String?
//    public var user : String?
//    public var createdAt : String?
//    public var updatedAt : String?
//    public var orderNumber : String?
//
//
//    public class func modelsFromDictionaryArray(array:NSArray) -> [OrderSaveData]
//    {
//        var models:[OrderSaveData] = []
//        for item in array
//        {
//            models.append(OrderSaveData(dictionary: item as! NSDictionary)!)
//        }
//        return models
//    }
//
//
//    required public init?(dictionary: NSDictionary) {
//
//        _id = dictionary["_id"] as? String
//        companies = dictionary["companies"] as? Array<String>
//        //if (dictionary["companies"] != nil) { companies = Companies.modelsFromDictionaryArray(dictionary["companies"] as! NSArray) }
//        if (dictionary["orderInfo"] != nil) { orderInfo = OrderInfo.modelsFromDictionaryArray(array: dictionary["orderInfo"] as! NSArray) }
//        quotes = dictionary["quotes"] as? Array<String>
//        //if (dictionary["quotes"] != nil) { quotes = Quotes.modelsFromDictionaryArray(dictionary["quotes"] as! NSArray) }
//        quotesCount = dictionary["quotesCount"] as? Int
//        status = dictionary["status"] as? String
//        category = dictionary["category"] as? String
//        user = dictionary["user"] as? String
//        createdAt = dictionary["createdAt"] as? String
//        updatedAt = dictionary["updatedAt"] as? String
//        orderNumber = dictionary["orderNumber"] as? String
//    }
//
//
//    public func dictionaryRepresentation() -> NSDictionary {
//
//        let dictionary = NSMutableDictionary()
//
//        dictionary.setValue(self._id, forKey: "_id")
//        dictionary.setValue(self.quotesCount, forKey: "quotesCount")
//        dictionary.setValue(self.status, forKey: "status")
//        dictionary.setValue(self.category, forKey: "category")
//        dictionary.setValue(self.user, forKey: "user")
//        dictionary.setValue(self.createdAt, forKey: "createdAt")
//        dictionary.setValue(self.updatedAt, forKey: "updatedAt")
//        dictionary.setValue(self.orderNumber, forKey: "orderNumber")
//
//        return dictionary
//    }
//
//}
//
//public class Answer {
//    public var _id : String?
//    public var title : String?
//    public var children : Array<Children>?
//    public var titleEn : String?
//    public var titleAr : String?
//
//    /**
//     Returns an array of models based on given dictionary.
//
//     Sample usage:
//     let answer_list = Answer.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
//
//     - parameter array:  NSArray from JSON dictionary.
//
//     - returns: Array of Answer Instances.
//     */
//    public class func modelsFromDictionaryArray(array:NSArray) -> [Answer]
//    {
//        var models:[Answer] = []
//        for item in array
//        {
//            models.append(Answer(dictionary: item as! NSDictionary)!)
//        }
//        return models
//    }
//
//    /**
//     Constructs the object based on the given dictionary.
//
//     Sample usage:
//     let answer = Answer(someDictionaryFromJSON)
//
//     - parameter dictionary:  NSDictionary from JSON.
//
//     - returns: Answer Instance.
//     */
//    required public init?(dictionary: NSDictionary) {
//
//        _id = dictionary["_id"] as? String
//        title = dictionary["title"] as? String
//        //children = dictionary["children"] as? Array<String>
//        if (dictionary["children"] != nil) { children = Children.modelsFromDictionaryArray(array: dictionary["children"] as! NSArray) }
//        titleEn = dictionary["titleEn"] as? String
//        titleAr = dictionary["titleAr"] as? String
//    }
//
//
//    /**
//     Returns the dictionary representation for the current instance.
//
//     - returns: NSDictionary.
//     */
//    public func dictionaryRepresentation() -> NSDictionary {
//
//        let dictionary = NSMutableDictionary()
//
//        dictionary.setValue(self._id, forKey: "_id")
//        dictionary.setValue(self.title, forKey: "title")
//        dictionary.setValue(self.titleEn, forKey: "titleEn")
//        dictionary.setValue(self.titleAr, forKey: "titleAr")
//
//        return dictionary
//    }
//
//}
//
//
//public class OrderSaveErrors {
//
//
//    public class func modelsFromDictionaryArray(array:NSArray) -> [OrderSaveErrors]
//    {
//        var models:[OrderSaveErrors] = []
//        for item in array
//        {
//            models.append(OrderSaveErrors(dictionary: item as! NSDictionary)!)
//        }
//        return models
//    }
//
//
//    required public init?(dictionary: NSDictionary) {
//
//    }
//
//    public func dictionaryRepresentation() -> NSDictionary {
//
//        let dictionary = NSMutableDictionary()
//
//
//        return dictionary
//    }
//
//}
