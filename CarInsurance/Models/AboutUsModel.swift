//
//  AboutUsModel.swift
//  CarInsurance
//
//  Created by Apple on 7/10/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
public class aboutUS {
    public var success : Bool?
    public var message : String?
    public var data : aboutUSData?
    public var errors : aboutUSErrors?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [aboutUS]
    {
        var models:[aboutUS] = []
        for item in array
        {
            models.append(aboutUS(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        message = dictionary["message"] as? String
        if (dictionary["data"] != nil) { data = aboutUSData(dictionary: dictionary["data"] as! NSDictionary) }
        if (dictionary["errors"] != nil) { errors = aboutUSErrors(dictionary: dictionary["errors"] as! NSDictionary) }
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

public class aboutUSData {
    public var _id : String?
    public var title : String?
    public var detail : String?
    public var workPlace : WorkPlace?
    public var pageType : String?
    public var slug : String?
    public var reviews : Array<String>?
    public var image : String?
    public var icon : String?
    public var phone : String?
    public var professionalCard : String?
    public var workPermit : String?
    public var commentCount : Int?
    public var isActive : Bool?
    public var published : Bool?
    public var firstName : String?
    public var lastName : String?
    public var payerStatus : String?
    public var orderStatus : String?
    public var payerId : String?
    public var payerEmail : String?
    public var paymentId : String?
    public var state : String?
    public var paymentMethod : String?
    public var transactionDetails : String?
    public var paypalResponse : String?
    public var ip : String?
    public var createdAt : String?
    public var updatedAt : String?
    public var titleEn : String?
    public var titleAr : String?
    public var detailEn : String?
    public var detailAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [aboutUSData]
    {
        var models:[aboutUSData] = []
        for item in array
        {
            models.append(aboutUSData(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
   
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        detail = dictionary["detail"] as? String
        if (dictionary["workPlace"] != nil) { workPlace = WorkPlace(dictionary: dictionary["workPlace"] as! NSDictionary) }
        pageType = dictionary["pageType"] as? String
        slug = dictionary["slug"] as? String
        reviews = dictionary["reviews"] as? Array<String>
       // if (dictionary["reviews"] != nil) { reviews = Reviews.modelsFromDictionaryArray(dictionary["reviews"] as! NSArray) }
        image = dictionary["image"] as? String
        icon = dictionary["icon"] as? String
        phone = dictionary["phone"] as? String
        professionalCard = dictionary["professionalCard"] as? String
        workPermit = dictionary["workPermit"] as? String
        commentCount = dictionary["commentCount"] as? Int
        isActive = dictionary["isActive"] as? Bool
        published = dictionary["published"] as? Bool
        firstName = dictionary["firstName"] as? String
        lastName = dictionary["lastName"] as? String
        payerStatus = dictionary["payerStatus"] as? String
        orderStatus = dictionary["orderStatus"] as? String
        payerId = dictionary["payerId"] as? String
        payerEmail = dictionary["payerEmail"] as? String
        paymentId = dictionary["paymentId"] as? String
        state = dictionary["state"] as? String
        paymentMethod = dictionary["paymentMethod"] as? String
        transactionDetails = dictionary["transactionDetails"] as? String
        paypalResponse = dictionary["paypalResponse"] as? String
        ip = dictionary["ip"] as? String
        createdAt = dictionary["createdAt"] as? String
        updatedAt = dictionary["updatedAt"] as? String
        titleEn = dictionary["titleEn"] as? String
        titleAr = dictionary["titleAr"] as? String
        detailEn = dictionary["detailEn"] as? String
        detailAr = dictionary["detailAr"] as? String
    }
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.detail, forKey: "detail")
        dictionary.setValue(self.workPlace?.dictionaryRepresentation(), forKey: "workPlace")
        dictionary.setValue(self.pageType, forKey: "pageType")
        dictionary.setValue(self.slug, forKey: "slug")
        dictionary.setValue(self.image, forKey: "image")
        dictionary.setValue(self.icon, forKey: "icon")
        dictionary.setValue(self.phone, forKey: "phone")
        dictionary.setValue(self.professionalCard, forKey: "professionalCard")
        dictionary.setValue(self.workPermit, forKey: "workPermit")
        dictionary.setValue(self.commentCount, forKey: "commentCount")
        dictionary.setValue(self.isActive, forKey: "isActive")
        dictionary.setValue(self.published, forKey: "published")
        dictionary.setValue(self.firstName, forKey: "firstName")
        dictionary.setValue(self.lastName, forKey: "lastName")
        dictionary.setValue(self.payerStatus, forKey: "payerStatus")
        dictionary.setValue(self.orderStatus, forKey: "orderStatus")
        dictionary.setValue(self.payerId, forKey: "payerId")
        dictionary.setValue(self.payerEmail, forKey: "payerEmail")
        dictionary.setValue(self.paymentId, forKey: "paymentId")
        dictionary.setValue(self.state, forKey: "state")
        dictionary.setValue(self.paymentMethod, forKey: "paymentMethod")
        dictionary.setValue(self.transactionDetails, forKey: "transactionDetails")
        dictionary.setValue(self.paypalResponse, forKey: "paypalResponse")
        dictionary.setValue(self.ip, forKey: "ip")
        dictionary.setValue(self.createdAt, forKey: "createdAt")
        dictionary.setValue(self.updatedAt, forKey: "updatedAt")
        dictionary.setValue(self.titleEn, forKey: "titleEn")
        dictionary.setValue(self.titleAr, forKey: "titleAr")
        dictionary.setValue(self.detailEn, forKey: "detailEn")
        dictionary.setValue(self.detailAr, forKey: "detailAr")
        
        return dictionary
    }
    
}




public class aboutUSErrors {
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [aboutUSErrors]
    {
        var models:[aboutUSErrors] = []
        for item in array
        {
            models.append(aboutUSErrors(dictionary: item as! NSDictionary)!)
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
public class WorkPlace {
    public var en : String?
    public var ar : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [WorkPlace]
    {
        var models:[WorkPlace] = []
        for item in array
        {
            models.append(WorkPlace(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        en = dictionary["en"] as? String
        ar = dictionary["ar"] as? String
    }
    
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.en, forKey: "en")
        dictionary.setValue(self.ar, forKey: "ar")
        
        return dictionary
    }
    
}
