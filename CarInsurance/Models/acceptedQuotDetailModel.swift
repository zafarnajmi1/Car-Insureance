//
//  acceptedQuotDetailModel.swift
//  CarInsurance
//
//  Created by Apple on 8/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation


public class acceptedQuotDetail {
    public var success : Bool?
    public var message : String?
    public var data : acceptedQuotDetailData?
    public var errors : acceptedQuotDetailErrors?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [acceptedQuotDetail]
    {
        var models:[acceptedQuotDetail] = []
        for item in array
        {
            models.append(acceptedQuotDetail(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        message = dictionary["message"] as? String
        if (dictionary["data"] != nil) { data = acceptedQuotDetailData(dictionary: dictionary["data"] as! NSDictionary) }
        if (dictionary["errors"] != nil) { errors = acceptedQuotDetailErrors(dictionary: dictionary["errors"] as! NSDictionary) }
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


public class acceptedQuotDetailData {
    public var _id : String?
    public var quotes : Array<acceptedQuotDetailQuotes>?
    public var quotesCount : Int?
    public var status : String?
    public var chargesAED : Int?
    public var chargesUSD : Double?
    public var category : acceptedQuotDetailCategory?
    public var createdAt : String?
    public var orderNumber : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [acceptedQuotDetailData]
    {
        var models:[acceptedQuotDetailData] = []
        for item in array
        {
            models.append(acceptedQuotDetailData(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        if (dictionary["quotes"] != nil) { quotes = acceptedQuotDetailQuotes.modelsFromDictionaryArray(array: dictionary["quotes"] as! NSArray) }
        quotesCount = dictionary["quotesCount"] as? Int
        status = dictionary["status"] as? String
        chargesAED = dictionary["chargesAED"] as? Int
        chargesUSD = dictionary["chargesUSD"] as? Double
        if (dictionary["category"] != nil) { category = acceptedQuotDetailCategory(dictionary: dictionary["category"] as! NSDictionary) }
        createdAt = dictionary["createdAt"] as? String
        orderNumber = dictionary["orderNumber"] as? String
    }
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.quotesCount, forKey: "quotesCount")
        dictionary.setValue(self.status, forKey: "status")
        dictionary.setValue(self.chargesAED, forKey: "chargesAED")
        dictionary.setValue(self.chargesUSD, forKey: "chargesUSD")
        dictionary.setValue(self.category?.dictionaryRepresentation(), forKey: "category")
        dictionary.setValue(self.createdAt, forKey: "createdAt")
        dictionary.setValue(self.orderNumber, forKey: "orderNumber")
        
        return dictionary
    }
    
}

public class acceptedQuotDetailErrors {
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [acceptedQuotDetailErrors]
    {
        var models:[acceptedQuotDetailErrors] = []
        for item in array
        {
            models.append(acceptedQuotDetailErrors(dictionary: item as! NSDictionary)!)
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


public class acceptedQuotDetailQuotes {
    public var _id : String?
    public var quoteTotalAmount : acceptedQuotDetailQuoteTotalAmount?
    public var basicAmount : acceptedQuotDetailBasicAmount?
    public var company : acceptedQuotDetailCompany?
    public var basicService : acceptedQuotDetailBasicService?
    public var additionalServices : Array<acceptedQuotDetailAdditionalServices>?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [acceptedQuotDetailQuotes]
    {
        var models:[acceptedQuotDetailQuotes] = []
        for item in array
        {
            models.append(acceptedQuotDetailQuotes(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
   
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        if (dictionary["quoteTotalAmount"] != nil) { quoteTotalAmount = acceptedQuotDetailQuoteTotalAmount(dictionary: dictionary["quoteTotalAmount"] as! NSDictionary) }
        if (dictionary["basicAmount"] != nil) { basicAmount = acceptedQuotDetailBasicAmount(dictionary: dictionary["basicAmount"] as! NSDictionary) }
        if (dictionary["company"] != nil) { company = acceptedQuotDetailCompany(dictionary: dictionary["company"] as! NSDictionary) }
        if (dictionary["basicService"] != nil) { basicService = acceptedQuotDetailBasicService(dictionary: dictionary["basicService"] as! NSDictionary) }
        if (dictionary["additionalServices"] != nil) { additionalServices = acceptedQuotDetailAdditionalServices.modelsFromDictionaryArray(array: dictionary["additionalServices"] as! NSArray) }
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


public class acceptedQuotDetailQuestions {
    public var _id : String?
    public var title : String?
    public var placeholder : String?
    public var isRequired : Bool?
    public var questionType : String?
    public var options : Array<acceptedQuotDetailOptions>?
    public var titleEn : String?
    public var titleAr : String?
    public var placeholderEn : String?
    public var placeholderAr : String?
    public var answer : acceptedQuotDetailAnswer?
    public var answer1:String?
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [acceptedQuotDetailQuestions]
    {
        var models:[acceptedQuotDetailQuestions] = []
        for item in array
        {
            models.append(acceptedQuotDetailQuestions(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        placeholder = dictionary["placeholder"] as? String
        isRequired = dictionary["isRequired"] as? Bool
        questionType = dictionary["questionType"] as? String
        if (dictionary["options"] != nil) { options = acceptedQuotDetailOptions.modelsFromDictionaryArray(array: dictionary["options"] as! NSArray) }
        titleEn = dictionary["titleEn"] as? String
        titleAr = dictionary["titleAr"] as? String
        placeholderEn = dictionary["placeholderEn"] as? String
        placeholderAr = dictionary["placeholderAr"] as? String
        if (dictionary["answer"] != nil) { answer = acceptedQuotDetailAnswer(dictionary: dictionary["answer"] as? NSDictionary ?? [:] )}
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


public class acceptedQuotDetailOptions {
    public var _id : String?
    public var title : String?
    public var children : Array<Children>?
    public var titleEn : String?
    public var titleAr : String?
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [acceptedQuotDetailOptions]
    {
        var models:[acceptedQuotDetailOptions] = []
        for item in array
        {
            models.append(acceptedQuotDetailOptions(dictionary: item as! NSDictionary)!)
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


public class acceptedQuotDetailUsd {
    public var amount : Double?
    public var rate : Double?
    public var symbol : String?
    public var formattedAmount : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [acceptedQuotDetailUsd]
    {
        var models:[acceptedQuotDetailUsd] = []
        for item in array
        {
            models.append(acceptedQuotDetailUsd(dictionary: item as! NSDictionary)!)
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


public class acceptedQuotDetailService {
    public var _id : String?
    public var title : String?
    public var sortOrder : Int?
    public var titleEn : String?
    public var titleAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [acceptedQuotDetailService]
    {
        var models:[acceptedQuotDetailService] = []
        for item in array
        {
            models.append(acceptedQuotDetailService(dictionary: item as! NSDictionary)!)
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


public class acceptedQuotDetailQuoteTotalAmount {
    public var aed : acceptedQuotDetailAed?
    public var usd : acceptedQuotDetailUsd?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [acceptedQuotDetailQuoteTotalAmount]
    {
        var models:[acceptedQuotDetailQuoteTotalAmount] = []
        for item in array
        {
            models.append(acceptedQuotDetailQuoteTotalAmount(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        if (dictionary["aed"] != nil) { aed = acceptedQuotDetailAed(dictionary: dictionary["aed"] as! NSDictionary) }
        if (dictionary["usd"] != nil) { usd = acceptedQuotDetailUsd(dictionary: dictionary["usd"] as! NSDictionary) }
    }
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.aed?.dictionaryRepresentation(), forKey: "aed")
        dictionary.setValue(self.usd?.dictionaryRepresentation(), forKey: "usd")
        
        return dictionary
    }
    
}


public class acceptedQuotDetailCompany {
    public var _id : String?
    public var termsCondition : String?
    public var orgnizationTitle : String?
    public var image : String?
    public var orgnizationTitleEn : String?
    public var orgnizationTitleAr : String?
    public var termsConditionEn : String?
    public var termsConditionAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [acceptedQuotDetailCompany]
    {
        var models:[acceptedQuotDetailCompany] = []
        for item in array
        {
            models.append(acceptedQuotDetailCompany(dictionary: item as! NSDictionary)!)
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


public class acceptedQuotDetailAdditionalServices {
    public var charges : acceptedQuotDetailCharges?
    public var status : String?
    public var _id : String?
    public var service : acceptedQuotDetailService?
    public var totalValue = 0.0
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [acceptedQuotDetailAdditionalServices]
    {
        var models:[acceptedQuotDetailAdditionalServices] = []
        for item in array
        {
            models.append(acceptedQuotDetailAdditionalServices(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        if (dictionary["charges"] != nil) { charges = acceptedQuotDetailCharges(dictionary: dictionary["charges"] as! NSDictionary) }
        status = dictionary["status"] as? String
        _id = dictionary["_id"] as? String
        if (dictionary["service"] != nil) { service = acceptedQuotDetailService(dictionary: dictionary["service"] as! NSDictionary) }
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

public class acceptedQuotDetailAed {
    public var amount : Int?
    public var rate : Int?
    public var symbol : String?
    public var formattedAmount : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [acceptedQuotDetailAed]
    {
        var models:[acceptedQuotDetailAed] = []
        for item in array
        {
            models.append(acceptedQuotDetailAed(dictionary: item as! NSDictionary)!)
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


public class acceptedQuotDetailAnswer {
    public var _id : String?
    public var title : String?
    public var children : Array<Children>?
    public var titleEn : String?
    public var titleAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [acceptedQuotDetailAnswer]
    {
        var models:[acceptedQuotDetailAnswer] = []
        for item in array
        {
            models.append(acceptedQuotDetailAnswer(dictionary: item as! NSDictionary)!)
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


public class acceptedQuotDetailBasicAmount {
    public var aed : acceptedQuotDetailAed?
    public var usd : acceptedQuotDetailUsd?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [acceptedQuotDetailBasicAmount]
    {
        var models:[acceptedQuotDetailBasicAmount] = []
        for item in array
        {
            models.append(acceptedQuotDetailBasicAmount(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
   
    required public init?(dictionary: NSDictionary) {
        
        if (dictionary["aed"] != nil) { aed = acceptedQuotDetailAed(dictionary: dictionary["aed"] as! NSDictionary) }
        if (dictionary["usd"] != nil) { usd = acceptedQuotDetailUsd(dictionary: dictionary["usd"] as! NSDictionary) }
    }
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.aed?.dictionaryRepresentation(), forKey: "aed")
        dictionary.setValue(self.usd?.dictionaryRepresentation(), forKey: "usd")
        
        return dictionary
    }
    
}

public class acceptedQuotDetailBasicService {
    public var _id : String?
    public var title : String?
    public var isActive : Bool?
    public var sortOrder : Int?
    public var image : String?
    public var questions : Array<acceptedQuotDetailQuestions>?
    public var children : Array<Children>?
    public var depth : Int?
    public var createdAt : String?
    public var updatedAt : String?
    public var titleEn : String?
    public var titleAr : String?
    

    public class func modelsFromDictionaryArray(array:NSArray) -> [acceptedQuotDetailBasicService]
    {
        var models:[acceptedQuotDetailBasicService] = []
        for item in array
        {
            models.append(acceptedQuotDetailBasicService(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        isActive = dictionary["isActive"] as? Bool
        sortOrder = dictionary["sortOrder"] as? Int
        image = dictionary["image"] as? String
        if (dictionary["questions"] != nil) { questions = acceptedQuotDetailQuestions.modelsFromDictionaryArray(array: dictionary["questions"] as! NSArray) }
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


public class acceptedQuotDetailCategory {
    public var _id : String?
    public var title : String?
    public var titleEn : String?
    public var titleAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [acceptedQuotDetailCategory]
    {
        var models:[acceptedQuotDetailCategory] = []
        for item in array
        {
            models.append(acceptedQuotDetailCategory(dictionary: item as! NSDictionary)!)
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


public class acceptedQuotDetailCharges {
    public var aed : acceptedQuotDetailAed?
    public var usd : acceptedQuotDetailUsd?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [acceptedQuotDetailCharges]
    {
        var models:[acceptedQuotDetailCharges] = []
        for item in array
        {
            models.append(acceptedQuotDetailCharges(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
   
    required public init?(dictionary: NSDictionary) {
        
        if (dictionary["aed"] != nil) { aed = acceptedQuotDetailAed(dictionary: dictionary["aed"] as! NSDictionary) }
        if (dictionary["usd"] != nil) { usd = acceptedQuotDetailUsd(dictionary: dictionary["usd"] as! NSDictionary) }
    }
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.aed?.dictionaryRepresentation(), forKey: "aed")
        dictionary.setValue(self.usd?.dictionaryRepresentation(), forKey: "usd")
        
        return dictionary
    }
    
}
