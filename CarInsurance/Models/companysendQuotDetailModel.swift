//
//  companysendQuotDetail.swift
//  CarInsurance
//
//  Created by Apple on 8/27/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

public class companysendQuotDetail {
    public var success : Bool?
    public var message : String?
    public var data : companysendQuotDetailData?
    public var errors : companysendQuotDetailErrors?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [companysendQuotDetail]
    {
        var models:[companysendQuotDetail] = []
        for item in array
        {
            models.append(companysendQuotDetail(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    

    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        message = dictionary["message"] as? String
        if (dictionary["data"] != nil) { data = companysendQuotDetailData(dictionary: dictionary["data"] as! NSDictionary) }
        if (dictionary["errors"] != nil) { errors = companysendQuotDetailErrors(dictionary: dictionary["errors"] as! NSDictionary) }
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


public class companysendQuotDetailData {
    public var _id : String?
    public var quotes : Array<companysendQuotDetailQuotes>?
    public var quotesCount : Int?
    public var status : String?
    public var category : companysendQuotDetailCategory?
    public var createdAt : String?
    public var orderNumber : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [companysendQuotDetailData]
    {
        var models:[companysendQuotDetailData] = []
        for item in array
        {
            models.append(companysendQuotDetailData(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
   
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        if (dictionary["quotes"] != nil) { quotes = companysendQuotDetailQuotes.modelsFromDictionaryArray(array: dictionary["quotes"] as! NSArray) }
        quotesCount = dictionary["quotesCount"] as? Int
        status = dictionary["status"] as? String
        if (dictionary["category"] != nil) { category = companysendQuotDetailCategory(dictionary: dictionary["category"] as! NSDictionary) }
        createdAt = dictionary["createdAt"] as? String
        orderNumber = dictionary["orderNumber"] as? String
    }
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.quotesCount, forKey: "quotesCount")
        dictionary.setValue(self.status, forKey: "status")
        dictionary.setValue(self.category?.dictionaryRepresentation(), forKey: "category")
        dictionary.setValue(self.createdAt, forKey: "createdAt")
        dictionary.setValue(self.orderNumber, forKey: "orderNumber")
        
        return dictionary
    }
    
}


public class companysendQuotDetailErrors {
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [companysendQuotDetailErrors]
    {
        var models:[companysendQuotDetailErrors] = []
        for item in array
        {
            models.append(companysendQuotDetailErrors(dictionary: item as! NSDictionary)!)
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


public class companysendQuotDetailOptions {
    public var _id : String?
    public var title : String?
    public var children : Array<Children>?
    public var titleEn : String?
    public var titleAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [companysendQuotDetailOptions]
    {
        var models:[companysendQuotDetailOptions] = []
        for item in array
        {
            models.append(companysendQuotDetailOptions(dictionary: item as! NSDictionary)!)
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


public class companysendQuotDetailQuestions {
    public var _id : String?
    public var title : String?
    public var placeholder : String?
    public var isRequired : Bool?
    public var questionType : String?
    public var options : Array<companysendQuotDetailOptions>?
    public var titleEn : String?
    public var titleAr : String?
    public var placeholderEn : String?
    public var placeholderAr : String?
    public var answer : companysendQuotDetailAnswer?
    public var answer1: String?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [companysendQuotDetailQuestions]
    {
        var models:[companysendQuotDetailQuestions] = []
        for item in array
        {
            models.append(companysendQuotDetailQuestions(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    

    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        placeholder = dictionary["placeholder"] as? String
        isRequired = dictionary["isRequired"] as? Bool
        questionType = dictionary["questionType"] as? String
        if (dictionary["options"] != nil) { options = companysendQuotDetailOptions.modelsFromDictionaryArray(array: dictionary["options"] as! NSArray) }
        titleEn = dictionary["titleEn"] as? String
        titleAr = dictionary["titleAr"] as? String
        placeholderEn = dictionary["placeholderEn"] as? String
        placeholderAr = dictionary["placeholderAr"] as? String
        if (dictionary["answer"] != nil) { answer = companysendQuotDetailAnswer(dictionary: dictionary["answer"] as? NSDictionary ?? [:]) }
         answer1 = dictionary["answer"] as? String
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
        dictionary.setValue(self.answer1, forKey: "answer")
        
        return dictionary
    }
    
}


public class companysendQuotDetailQuotes {
    public var _id : String?
    public var quoteTotalAmount : companysendQuotDetailQuoteTotalAmount?
    public var basicAmount : companysendQuotDetailBasicAmount?
    public var company : companysendQuotDetailCompany?
    public var basicService : companysendQuotDetailBasicService?
    public var additionalServices : Array<companysendQuotDetailAdditionalServices>?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [companysendQuotDetailQuotes]
    {
        var models:[companysendQuotDetailQuotes] = []
        for item in array
        {
            models.append(companysendQuotDetailQuotes(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        if (dictionary["quoteTotalAmount"] != nil) { quoteTotalAmount = companysendQuotDetailQuoteTotalAmount(dictionary: dictionary["quoteTotalAmount"] as! NSDictionary) }
        if (dictionary["basicAmount"] != nil) { basicAmount = companysendQuotDetailBasicAmount(dictionary: dictionary["basicAmount"] as! NSDictionary) }
        if (dictionary["company"] != nil) { company = companysendQuotDetailCompany(dictionary: dictionary["company"] as! NSDictionary) }
        if (dictionary["basicService"] != nil) { basicService = companysendQuotDetailBasicService(dictionary: dictionary["basicService"] as! NSDictionary) }
        if (dictionary["additionalServices"] != nil) { additionalServices = companysendQuotDetailAdditionalServices.modelsFromDictionaryArray(array: dictionary["additionalServices"] as! NSArray) }
    }
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.quoteTotalAmount?.dictionaryRepresentation(), forKey: "quoteTotalAmount")
        dictionary.setValue(self.basicAmount?.dictionaryRepresentation(), forKey: "basicAmount")
        dictionary.setValue(self.company?.dictionaryRepresentation(), forKey: "company")
        dictionary.setValue(self.basicService?.dictionaryRepresentation(), forKey: "basicService")
        
        return dictionary
    }
    
}

public class companysendQuotDetailUsd {
    public var amount : Double?
    public var rate : Double?
    public var symbol : String?
    public var formattedAmount : String?
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [companysendQuotDetailUsd]
    {
        var models:[companysendQuotDetailUsd] = []
        for item in array
        {
            models.append(companysendQuotDetailUsd(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        amount = dictionary["amount"] as? Double
        rate = dictionary["rate"] as? Double
        symbol = dictionary["symbol"] as? String
        formattedAmount = dictionary["formattedAmount"] as? String
    }
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.amount, forKey: "amount")
        dictionary.setValue(self.rate, forKey: "rate")
        dictionary.setValue(self.symbol, forKey: "symbol")
        dictionary.setValue(self.formattedAmount, forKey: "formattedAmount")
        
        return dictionary
    }
    
}

public class companysendQuotDetailService {
    public var _id : String?
    public var title : String?
    public var sortOrder : Int?
    public var titleEn : String?
    public var titleAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [companysendQuotDetailService]
    {
        var models:[companysendQuotDetailService] = []
        for item in array
        {
            models.append(companysendQuotDetailService(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        sortOrder = dictionary["sortOrder"] as? Int
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

public class companysendQuotDetailQuoteTotalAmount {
    public var aed : companysendQuotDetailAed?
    public var usd : companysendQuotDetailUsd?
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [companysendQuotDetailQuoteTotalAmount]
    {
        var models:[companysendQuotDetailQuoteTotalAmount] = []
        for item in array
        {
            models.append(companysendQuotDetailQuoteTotalAmount(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        if (dictionary["aed"] != nil) { aed = companysendQuotDetailAed(dictionary: dictionary["aed"] as! NSDictionary) }
        if (dictionary["usd"] != nil) { usd = companysendQuotDetailUsd(dictionary: dictionary["usd"] as! NSDictionary) }
    }
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.aed?.dictionaryRepresentation(), forKey: "aed")
        dictionary.setValue(self.usd?.dictionaryRepresentation(), forKey: "usd")
        
        return dictionary
    }
    
}

public class companysendQuotDetailCompany {
    public var _id : String?
    public var termsCondition : String?
    public var orgnizationTitle : String?
    public var image : String?
    public var orgnizationTitleEn : String?
    public var orgnizationTitleAr : String?
    public var termsConditionEn : String?
    public var termsConditionAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [companysendQuotDetailCompany]
    {
        var models:[companysendQuotDetailCompany] = []
        for item in array
        {
            models.append(companysendQuotDetailCompany(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        termsCondition = dictionary["termsCondition"] as? String
        orgnizationTitle = dictionary["orgnizationTitle"] as? String
        image = dictionary["image"] as? String
        orgnizationTitleEn = dictionary["orgnizationTitleEn"] as? String
        orgnizationTitleAr = dictionary["orgnizationTitleAr"] as? String
        termsConditionEn = dictionary["termsConditionEn"] as? String
        termsConditionAr = dictionary["termsConditionAr"] as? String
    }
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.termsCondition, forKey: "termsCondition")
        dictionary.setValue(self.orgnizationTitle, forKey: "orgnizationTitle")
        dictionary.setValue(self.image, forKey: "image")
        dictionary.setValue(self.orgnizationTitleEn, forKey: "orgnizationTitleEn")
        dictionary.setValue(self.orgnizationTitleAr, forKey: "orgnizationTitleAr")
        dictionary.setValue(self.termsConditionEn, forKey: "termsConditionEn")
        dictionary.setValue(self.termsConditionAr, forKey: "termsConditionAr")
        
        return dictionary
    }
    
}


public class companysendQuotDetailCharges {
    public var aed : companysendQuotDetailAed?
    public var usd : companysendQuotDetailUsd?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [companysendQuotDetailCharges]
    {
        var models:[companysendQuotDetailCharges] = []
        for item in array
        {
            models.append(companysendQuotDetailCharges(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    

    required public init?(dictionary: NSDictionary) {
        
        if (dictionary["aed"] != nil) { aed = companysendQuotDetailAed(dictionary: dictionary["aed"] as! NSDictionary) }
        if (dictionary["usd"] != nil) { usd = companysendQuotDetailUsd(dictionary: dictionary["usd"] as! NSDictionary) }
    }
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.aed?.dictionaryRepresentation(), forKey: "aed")
        dictionary.setValue(self.usd?.dictionaryRepresentation(), forKey: "usd")
        
        return dictionary
    }
    
}

public class companysendQuotDetailCategory {
    public var _id : String?
    public var title : String?
    public var titleEn : String?
    public var titleAr : String?
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [companysendQuotDetailCategory]
    {
        var models:[companysendQuotDetailCategory] = []
        for item in array
        {
            models.append(companysendQuotDetailCategory(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
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


public class companysendQuotDetailBasicService {
    public var _id : String?
    public var title : String?
    public var isActive : Bool?
    public var sortOrder : Int?
    public var image : String?
    public var questions : Array<companysendQuotDetailQuestions>?
    public var children : Array<Children>?
    public var depth : Int?
    public var createdAt : String?
    public var updatedAt : String?
    public var titleEn : String?
    public var titleAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [companysendQuotDetailBasicService]
    {
        var models:[companysendQuotDetailBasicService] = []
        for item in array
        {
            models.append(companysendQuotDetailBasicService(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
   
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        isActive = dictionary["isActive"] as? Bool
        sortOrder = dictionary["sortOrder"] as? Int
        image = dictionary["image"] as? String
        if (dictionary["questions"] != nil) { questions = companysendQuotDetailQuestions.modelsFromDictionaryArray(array: dictionary["questions"] as! NSArray) }
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


public class companysendQuotDetailBasicAmount {
    public var aed : companysendQuotDetailAed?
    public var usd : companysendQuotDetailUsd?
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [companysendQuotDetailBasicAmount]
    {
        var models:[companysendQuotDetailBasicAmount] = []
        for item in array
        {
            models.append(companysendQuotDetailBasicAmount(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
   
    required public init?(dictionary: NSDictionary) {
        
        if (dictionary["aed"] != nil) { aed = companysendQuotDetailAed(dictionary: dictionary["aed"] as! NSDictionary) }
        if (dictionary["usd"] != nil) { usd = companysendQuotDetailUsd(dictionary: dictionary["usd"] as! NSDictionary) }
    }
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.aed?.dictionaryRepresentation(), forKey: "aed")
        dictionary.setValue(self.usd?.dictionaryRepresentation(), forKey: "usd")
        
        return dictionary
    }
    
}


public class companysendQuotDetailAnswer {
    public var _id : String?
    public var title : String?
    public var children : Array<Children>?
    public var titleEn : String?
    public var titleAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [companysendQuotDetailAnswer]
    {
        var models:[companysendQuotDetailAnswer] = []
        for item in array
        {
            models.append(companysendQuotDetailAnswer(dictionary: item as! NSDictionary)!)
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



public class companysendQuotDetailAed {
    public var amount : Int?
    public var rate : Int?
    public var symbol : String?
    public var formattedAmount : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [companysendQuotDetailAed]
    {
        var models:[companysendQuotDetailAed] = []
        for item in array
        {
            models.append(companysendQuotDetailAed(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
   
    required public init?(dictionary: NSDictionary) {
        
        amount = dictionary["amount"] as? Int
        rate = dictionary["rate"] as? Int
        symbol = dictionary["symbol"] as? String
        formattedAmount = dictionary["formattedAmount"] as? String
    }
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.amount, forKey: "amount")
        dictionary.setValue(self.rate, forKey: "rate")
        dictionary.setValue(self.symbol, forKey: "symbol")
        dictionary.setValue(self.formattedAmount, forKey: "formattedAmount")
        
        return dictionary
    }
    
}

public class companysendQuotDetailAdditionalServices {
    public var charges : companysendQuotDetailCharges?
    public var status : String?
    public var _id : String?
    public var service : companysendQuotDetailService?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [companysendQuotDetailAdditionalServices]
    {
        var models:[companysendQuotDetailAdditionalServices] = []
        for item in array
        {
            models.append(companysendQuotDetailAdditionalServices(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        if (dictionary["charges"] != nil) { charges = companysendQuotDetailCharges(dictionary: dictionary["charges"] as! NSDictionary) }
        status = dictionary["status"] as? String
        _id = dictionary["_id"] as? String
        if (dictionary["service"] != nil) { service = companysendQuotDetailService(dictionary: dictionary["service"] as! NSDictionary) }
    }
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.charges?.dictionaryRepresentation(), forKey: "charges")
        dictionary.setValue(self.status, forKey: "status")
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.service?.dictionaryRepresentation(), forKey: "service")
        
        return dictionary
    }
    
}
