//
//  QuotListModel.swift
//  CarInsurance
//
//  Created by Apple on 8/19/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation


public class QuotList {
    public var success : Bool?
    public var message : String?
    public var data : QuotListData?
    public var errors : QuotListErrors?
    

    public class func modelsFromDictionaryArray(array:NSArray) -> [QuotList]
    {
        var models:[QuotList] = []
        for item in array
        {
            models.append(QuotList(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
  
    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        message = dictionary["message"] as? String
        if (dictionary["data"] != nil) { data = QuotListData(dictionary: dictionary["data"] as! NSDictionary) }
        if (dictionary["errors"] != nil) { errors = QuotListErrors(dictionary: dictionary["errors"] as! NSDictionary) }
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


public class QuotListErrors {
    

    public class func modelsFromDictionaryArray(array:NSArray) -> [QuotListErrors]
    {
        var models:[QuotListErrors] = []
        for item in array
        {
            models.append(QuotListErrors(dictionary: item as! NSDictionary)!)
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


public class QuotListData {
    public var collection : Array<QuotListCollection>?
    public var pagination : QuotListPagination?
    public var order : QuotListOrder?
    

    public class func modelsFromDictionaryArray(array:NSArray) -> [QuotListData]
    {
        var models:[QuotListData] = []
        for item in array
        {
            models.append(QuotListData(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    

    required public init?(dictionary: NSDictionary) {
        
        if (dictionary["collection"] != nil) { collection = QuotListCollection.modelsFromDictionaryArray(array: dictionary["collection"] as! NSArray) }
        if (dictionary["pagination"] != nil) { pagination = QuotListPagination(dictionary: dictionary["pagination"] as! NSDictionary) }
        if (dictionary["order"] != nil) { order = QuotListOrder(dictionary: dictionary["order"] as! NSDictionary) }
    }
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.pagination?.dictionaryRepresentation(), forKey: "pagination")
        dictionary.setValue(self.order?.dictionaryRepresentation(), forKey: "order")
        
        return dictionary
    }
    
}


public class Usd {
    public var amount : Double?
    public var rate : Double?
    public var symbol : String?
    public var formattedAmount : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [Usd]
    {
        var models:[Usd] = []
        for item in array
        {
            models.append(Usd(dictionary: item as! NSDictionary)!)
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




public class QuotListOptions {
    public var _id : String?
    public var title : String?
    public var children : Array<Children>?
    public var titleEn : String?
    public var titleAr : String?
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [QuotListOptions]
    {
        var models:[QuotListOptions] = []
        for item in array
        {
            models.append(QuotListOptions(dictionary: item as! NSDictionary)!)
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


public class QuotListService {
    public var _id : String?
    public var title : String?
    public var sortOrder : Int?
    public var titleEn : String?
    public var titleAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [QuotListService]
    {
        var models:[QuotListService] = []
        for item in array
        {
            models.append(QuotListService(dictionary: item as! NSDictionary)!)
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

public class QuoteTotalAmount {
    public var aed : Aed?
    public var usd : Usd?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [QuoteTotalAmount]
    {
        var models:[QuoteTotalAmount] = []
        for item in array
        {
            models.append(QuoteTotalAmount(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        if (dictionary["aed"] != nil) { aed = Aed(dictionary: dictionary["aed"] as! NSDictionary) }
        if (dictionary["usd"] != nil) { usd = Usd(dictionary: dictionary["usd"] as! NSDictionary) }
    }
    
    
   
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.aed?.dictionaryRepresentation(), forKey: "aed")
        dictionary.setValue(self.usd?.dictionaryRepresentation(), forKey: "usd")
        
        return dictionary
    }
    
}
public class Aed {
    public var amount : Int?
    public var rate : Int?
    public var symbol : String?
    public var formattedAmount : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [Aed]
    {
        var models:[Aed] = []
        for item in array
        {
            models.append(Aed(dictionary: item as! NSDictionary)!)
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



public class QuotListQuestions {
    public var _id : String?
    public var title : String?
    public var placeholder : String?
    public var isRequired : Bool?
    public var questionType : String?
    public var options : Array<QuotListOptions>?
    public var titleEn : String?
    public var titleAr : String?
    public var placeholderEn : String?
    public var placeholderAr : String?
    public var answer : QuotListAnswer?
    public var answer1 : String?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [QuotListQuestions]
    {
        var models:[QuotListQuestions] = []
        for item in array
        {
            models.append(QuotListQuestions(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        placeholder = dictionary["placeholder"] as? String
        isRequired = dictionary["isRequired"] as? Bool
        questionType = dictionary["questionType"] as? String
        if (dictionary["options"] != nil) { options = QuotListOptions.modelsFromDictionaryArray(array: dictionary["options"] as! NSArray) }
        titleEn = dictionary["titleEn"] as? String
        titleAr = dictionary["titleAr"] as? String
        placeholderEn = dictionary["placeholderEn"] as? String
        placeholderAr = dictionary["placeholderAr"] as? String
        if (dictionary["answer"] != nil) { answer = QuotListAnswer(dictionary: dictionary["answer"] as? NSDictionary ?? [:]) }
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


public class QuotListOrder {
    public var _id : String?
    public var quotesCount : Int?
    public var status : String?
    public var createdAt : String?
    public var orderNumber : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [QuotListOrder]
    {
        var models:[QuotListOrder] = []
        for item in array
        {
            models.append(QuotListOrder(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        quotesCount = dictionary["quotesCount"] as? Int
        status = dictionary["status"] as? String
        createdAt = dictionary["createdAt"] as? String
        orderNumber = dictionary["orderNumber"] as? String
    }
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.quotesCount, forKey: "quotesCount")
        dictionary.setValue(self.status, forKey: "status")
        dictionary.setValue(self.createdAt, forKey: "createdAt")
        dictionary.setValue(self.orderNumber, forKey: "orderNumber")
        
        return dictionary
    }
    
}



public class QuotListCompany {
    
    public var _id : String?
    public var termsCondition : String?
    public var orgnizationTitle : String?
    public var image : String?
    public var orgnizationTitleEn : String?
    public var orgnizationTitleAr : String?
    public var termsConditionEn : String?
    public var termsConditionAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [QuotListCompany]
    {
        var models:[QuotListCompany] = []
        for item in array
        {
            models.append(QuotListCompany(dictionary: item as! NSDictionary)!)
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


public class QuotListAdditionalServices {
    public var charges : QuotListCharges?
    public var status : String?
    public var _id : String?
    public var service : QuotListService?
    public var isSelect = false
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [QuotListAdditionalServices]
    {
        var models:[QuotListAdditionalServices] = []
        for item in array
        {
            models.append(QuotListAdditionalServices(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        if (dictionary["charges"] != nil) { charges = QuotListCharges(dictionary: dictionary["charges"] as! NSDictionary) }
        status = dictionary["status"] as? String
        _id = dictionary["_id"] as? String
        if (dictionary["service"] != nil) { service = QuotListService(dictionary: dictionary["service"] as? NSDictionary ?? [:]) }
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



public class QuotListAnswer {
    public var _id : String?
    public var title : String?
    public var children : Array<Children>?
    public var titleEn : String?
    public var titleAr : String?
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [QuotListAnswer]
    {
        var models:[QuotListAnswer] = []
        for item in array
        {
            models.append(QuotListAnswer(dictionary: item as! NSDictionary)!)
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


public class QuotListBasicAmount {
    public var aed : Aed?
    public var usd : Usd?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [QuotListBasicAmount]
    {
        var models:[QuotListBasicAmount] = []
        for item in array
        {
            models.append(QuotListBasicAmount(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        if (dictionary["aed"] != nil) { aed = Aed(dictionary: dictionary["aed"] as! NSDictionary) }
        if (dictionary["usd"] != nil) { usd = Usd(dictionary: dictionary["usd"] as! NSDictionary) }
    }
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.aed?.dictionaryRepresentation(), forKey: "aed")
        dictionary.setValue(self.usd?.dictionaryRepresentation(), forKey: "usd")
        
        return dictionary
    }
    
}


public class QuotListBasicService {
    public var _id : String?
    public var title : String?
    public var isActive : Bool?
    public var sortOrder : Int?
    public var image : String?
    public var questions : Array<QuotListQuestions>?
    public var children : Array<Children>?
    public var depth : Int?
    public var createdAt : String?
    public var updatedAt : String?
    public var titleEn : String?
    public var titleAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [QuotListBasicService]
    {
        var models:[QuotListBasicService] = []
        for item in array
        {
            models.append(QuotListBasicService(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
   
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        isActive = dictionary["isActive"] as? Bool
        sortOrder = dictionary["sortOrder"] as? Int
        image = dictionary["image"] as? String
        if (dictionary["questions"] != nil) { questions = QuotListQuestions.modelsFromDictionaryArray(array: dictionary["questions"] as! NSArray) }
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


public class QuotListCharges {
    public var aed : Aed?
    public var usd : Usd?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [QuotListCharges]
    {
        var models:[QuotListCharges] = []
        for item in array
        {
            models.append(QuotListCharges(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        if (dictionary["aed"] != nil) { aed = Aed(dictionary: dictionary["aed"] as! NSDictionary) }
        if (dictionary["usd"] != nil) { usd = Usd(dictionary: dictionary["usd"] as! NSDictionary) }
    }
    
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.aed?.dictionaryRepresentation(), forKey: "aed")
        dictionary.setValue(self.usd?.dictionaryRepresentation(), forKey: "usd")
        
        return dictionary
    }
    
}


public class QuotListCollection {
    public var _id : String?
    public var quoteTotalAmount : QuoteTotalAmount?
    public var basicAmount : QuotListBasicAmount?
    public var company : QuotListCompany?
    public var basicService : QuotListBasicService?
    public var additionalServices : Array<QuotListAdditionalServices>?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [QuotListCollection]
    {
        var models:[QuotListCollection] = []
        for item in array
        {
            models.append(QuotListCollection(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        if (dictionary["quoteTotalAmount"] != nil) { quoteTotalAmount = QuoteTotalAmount(dictionary: dictionary["quoteTotalAmount"] as! NSDictionary) }
        if (dictionary["basicAmount"] != nil) { basicAmount = QuotListBasicAmount(dictionary: dictionary["basicAmount"] as! NSDictionary) }
        if (dictionary["company"] != nil) { company = QuotListCompany(dictionary: dictionary["company"] as! NSDictionary) }
        if (dictionary["basicService"] != nil) { basicService = QuotListBasicService(dictionary: dictionary["basicService"] as! NSDictionary) }
        if (dictionary["additionalServices"] != nil) { additionalServices = QuotListAdditionalServices.modelsFromDictionaryArray(array: dictionary["additionalServices"] as! NSArray) }
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


public class QuotListPagination {
    public var total : Int?
    public var pages : Int?
    public var perPage : Int?
    public var page : Int?
    public var previous : Int?
    public var next : Int?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [QuotListPagination]
    {
        var models:[QuotListPagination] = []
        for item in array
        {
            models.append(QuotListPagination(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        total = dictionary["total"] as? Int
        pages = dictionary["pages"] as? Int
        perPage = dictionary["perPage"] as? Int
        page = dictionary["page"] as? Int
        previous = dictionary["previous"] as? Int
        next = dictionary["next"] as? Int
    }
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.total, forKey: "total")
        dictionary.setValue(self.pages, forKey: "pages")
        dictionary.setValue(self.perPage, forKey: "perPage")
        dictionary.setValue(self.page, forKey: "page")
        dictionary.setValue(self.previous, forKey: "previous")
        dictionary.setValue(self.next, forKey: "next")
        
        return dictionary
    }
    
}
