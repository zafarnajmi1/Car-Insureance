//
//  OrdersFilterModels.swift
//  CarInsurance
//
//  Created by Apple on 7/30/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
public class OrderFilters {
    public var success : Bool?
    public var message : String?
    public var data : OrderFiltersData?
    public var errors : OrderFiltersErrors?
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [OrderFilters]
    {
        var models:[OrderFilters] = []
        for item in array
        {
            models.append(OrderFilters(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        message = dictionary["message"] as? String
        if (dictionary["data"] != nil) { data = OrderFiltersData(dictionary: dictionary["data"] as! NSDictionary) }
        if (dictionary["errors"] != nil) { errors = OrderFiltersErrors(dictionary: dictionary["errors"] as! NSDictionary) }
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


public class OrderFiltersData {
    public var collection : Array<OrderFiltersCollection>?
    public var pagination : OrderFiltersPagination?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [OrderFiltersData]
    {
        var models:[OrderFiltersData] = []
        for item in array
        {
            models.append(OrderFiltersData(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        if (dictionary["collection"] != nil) { collection = OrderFiltersCollection.modelsFromDictionaryArray(array: dictionary["collection"] as! NSArray) }
        if (dictionary["pagination"] != nil) { pagination = OrderFiltersPagination(dictionary: dictionary["pagination"] as! NSDictionary) }
    }
    
    
   
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.pagination?.dictionaryRepresentation(), forKey: "pagination")
        
        return dictionary
    }
    
}
public class OrderFiltersErrors {
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [OrderFiltersErrors]
    {
        var models:[OrderFiltersErrors] = []
        for item in array
        {
            models.append(OrderFiltersErrors(dictionary: item as! NSDictionary)!)
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


public class OrderFiltersCollection {
    
    
    public var _id : String?
    public var companiesResponse : Array<String>?
    public var quotesCount : Int?
    public var policyPath : String?
    public var status : String?
    public var category : OrderFiltersCategory?
    public var createdAt : String?
    public var orderNumber : String?
    public var paymentDate: String?
    public class func modelsFromDictionaryArray(array:NSArray) -> [OrderFiltersCollection]
    {
        var models:[OrderFiltersCollection] = []
        for item in array
        {
            models.append(OrderFiltersCollection(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        //if (dictionary["companiesResponse"] != nil) { companiesResponse = CompaniesResponse.modelsFromDictionaryArray(dictionary["companiesResponse"] as! NSArray) }
        companiesResponse = dictionary["companiesResponse"] as? Array<String>
        quotesCount = dictionary["quotesCount"] as? Int
        policyPath = dictionary["policyPath"] as? String
        status = dictionary["status"] as? String
        if (dictionary["category"] != nil) { category = OrderFiltersCategory(dictionary: dictionary["category"] as! NSDictionary) }
        createdAt = dictionary["createdAt"] as? String
        orderNumber = dictionary["orderNumber"] as? String
        paymentDate = dictionary["paymentDate"] as? String
    }
    
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.quotesCount, forKey: "quotesCount")
        dictionary.setValue(self.policyPath, forKey: "policyPath")
        dictionary.setValue(self.status, forKey: "status")
        dictionary.setValue(self.category?.dictionaryRepresentation(), forKey: "category")
        dictionary.setValue(self.createdAt, forKey: "createdAt")
        dictionary.setValue(self.orderNumber, forKey: "orderNumber")
         dictionary.setValue(self.paymentDate, forKey: "paymentDate")
        
        return dictionary
    }
    
    
//    public var _id : String?
//    public var quotesCount : Int?
//    public var status : String?
//    public var category : OrderFiltersCategory?
//    public var createdAt : String?
//    public var orderNumber : String?
//
//
//    public class func modelsFromDictionaryArray(array:NSArray) -> [OrderFiltersCollection]
//    {
//        var models:[OrderFiltersCollection] = []
//        for item in array
//        {
//            models.append(OrderFiltersCollection(dictionary: item as! NSDictionary)!)
//        }
//        return models
//    }
//
//
//    required public init?(dictionary: NSDictionary) {
//
//        _id = dictionary["_id"] as? String
//        quotesCount = dictionary["quotesCount"] as? Int
//        status = dictionary["status"] as? String
//        if (dictionary["category"] != nil) { category = OrderFiltersCategory(dictionary: dictionary["category"] as! NSDictionary) }
//        createdAt = dictionary["createdAt"] as? String
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
//        dictionary.setValue(self.category?.dictionaryRepresentation(), forKey: "category")
//        dictionary.setValue(self.createdAt, forKey: "createdAt")
//        dictionary.setValue(self.orderNumber, forKey: "orderNumber")
//
//        return dictionary
//    }
    
}
public class OrderFiltersPagination {
    public var total : Int?
    public var pages : Int?
    public var perPage : Int?
    public var page : Int?
    public var previous : Int?
    public var next : Int?
    
   
    public class func modelsFromDictionaryArray(array:NSArray) -> [OrderFiltersPagination]
    {
        var models:[OrderFiltersPagination] = []
        for item in array
        {
            models.append(OrderFiltersPagination(dictionary: item as! NSDictionary)!)
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


public class OrderFiltersCategory {
    public var _id : String?
    public var title : String?
    public var titleEn : String?
    public var titleAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [OrderFiltersCategory]
    {
        var models:[OrderFiltersCategory] = []
        for item in array
        {
            models.append(OrderFiltersCategory(dictionary: item as! NSDictionary)!)
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
