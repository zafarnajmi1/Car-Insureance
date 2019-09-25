//
//  ChatModel.swift
//  HelloStream
//
//  Created by iOSDev on 6/22/18.
//  Copyright © 2018 iOSDev. All rights reserved.
//


import Foundation
import ObjectMapper

//public class ChatModel {
//    public var success : Bool?
//    public var message : String?
//    public var data : ChatData?
//    public var errors : ChatErrors?
//
//
//    public class func modelsFromDictionaryArray(array:NSArray) -> [ChatModel]
//    {
//        var models:[ChatModel] = []
//        for item in array
//        {
//            models.append(ChatModel(dictionary: item as! NSDictionary)!)
//        }
//        return models
//    }
//
//
//    required public init?(dictionary: NSDictionary) {
//
//        success = dictionary["success"] as? Bool
//        message = dictionary["message"] as? String
//        if (dictionary["data"] != nil) { data = ChatData(dictionary: dictionary["data"] as! NSDictionary) }
//        if (dictionary["errors"] != nil) { errors = ChatErrors(dictionary: dictionary["errors"] as! NSDictionary) }
//    }
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
//public class MessageModel {
//    public var _id : String?
//    public var mimeType : String?
//    public var conversation : String?
//    public var sender : String?
//    public var createdAt : String?
//    public var updatedAt : String?
//    public var content : String?
//
//    var seen : Bool?
//    //var sender : Sender?
//
//
//    public class func modelsFromDictionaryArray(array:NSArray) -> [MessageModel]
//    {
//        var models:[MessageModel] = []
//        for item in array
//        {
//            models.append(MessageModel(dictionary: item as! NSDictionary)!)
//        }
//        return models
//    }
//
//    required public init?(dictionary: NSDictionary) {
//
//        _id = dictionary["_id"] as? String
//        mimeType = dictionary["mimeType"] as? String
//        conversation = dictionary["conversation"] as? String
//        sender = dictionary["sender"] as? String
//        createdAt = dictionary["createdAt"] as? String
//        updatedAt = dictionary["updatedAt"] as? String
//        content = dictionary["content"] as? String
//    }
//
//    public func dictionaryRepresentation() -> NSDictionary {
//
//        let dictionary = NSMutableDictionary()
//
//        dictionary.setValue(self._id, forKey: "_id")
//        dictionary.setValue(self.mimeType, forKey: "mimeType")
//        dictionary.setValue(self.conversation, forKey: "conversation")
//        dictionary.setValue(self.sender, forKey: "sender")
//        dictionary.setValue(self.createdAt, forKey: "createdAt")
//        dictionary.setValue(self.updatedAt, forKey: "updatedAt")
//        dictionary.setValue(self.content, forKey: "content")
//
//        return dictionary
//    }
//
//}
//
//public class ChatPagination {
//    public var total : Int?
//    public var pages : Int?
//    public var per_page : Int?
//    public var page : Int?
//    public var previous : Int?
//    public var next : Int?
//
//
//    public class func modelsFromDictionaryArray(array:NSArray) -> [ChatPagination]
//    {
//        var models:[ChatPagination] = []
//        for item in array
//        {
//            models.append(ChatPagination(dictionary: item as! NSDictionary)!)
//        }
//        return models
//    }
//
//
//    required public init?(dictionary: NSDictionary) {
//
//        total = dictionary["total"] as? Int
//        pages = dictionary["pages"] as? Int
//        per_page = dictionary["per_page"] as? Int
//        page = dictionary["page"] as? Int
//        previous = dictionary["previous"] as? Int
//        next = dictionary["next"] as? Int
//    }
//
//
//    public func dictionaryRepresentation() -> NSDictionary {
//
//        let dictionary = NSMutableDictionary()
//
//        dictionary.setValue(self.total, forKey: "total")
//        dictionary.setValue(self.pages, forKey: "pages")
//        dictionary.setValue(self.per_page, forKey: "per_page")
//        dictionary.setValue(self.page, forKey: "page")
//        dictionary.setValue(self.previous, forKey: "previous")
//        dictionary.setValue(self.next, forKey: "next")
//
//        return dictionary
//    }
//
//}
//
//public class ChatErrors {
//
//
//    public class func modelsFromDictionaryArray(array:NSArray) -> [ChatErrors]
//    {
//        var models:[ChatErrors] = []
//        for item in array
//        {
//            models.append(ChatErrors(dictionary: item as! NSDictionary)!)
//        }
//        return models
//    }
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
//
//public class ChatData {
//    public var messages : Array<MessageModel>?
//    public var pagination : ChatPagination?
//
//
//    public class func modelsFromDictionaryArray(array:NSArray) -> [ChatData]
//    {
//        var models:[ChatData] = []
//        for item in array
//        {
//            models.append(ChatData(dictionary: item as! NSDictionary)!)
//        }
//        return models
//    }
//
//    required public init?(dictionary: NSDictionary) {
//
//        if (dictionary["messages"] != nil) { messages = MessageModel.modelsFromDictionaryArray(array: dictionary["messages"] as! NSArray) }
//        if (dictionary["pagination"] != nil) { pagination = ChatPagination(dictionary: dictionary["pagination"] as! NSDictionary) }
//    }
//    public func dictionaryRepresentation() -> NSDictionary {
//
//        let dictionary = NSMutableDictionary()
//
//        dictionary.setValue(self.pagination?.dictionaryRepresentation(), forKey: "pagination")
//
//        return dictionary
//    }
//
//}
//

class ChatModel : NSObject, Mappable{
    
    var data : MessageData?
    var errors : [String:String]?
    var message : String?
    var success : Bool?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return ChatModel()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        data <- map["data"]
        errors <- map["errors"]
        message <- map["message"]
        success <- map["success"]
    }
}

class MessageData : NSObject,  Mappable{
    
    var messages : [MessageModel]?
    var pagination : Pagination?
    var message: MessageModel?
    
    class func newInstance(map: Map) -> Mappable?{
        return MessageData()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        messages <- map["messages"]
        pagination <- map["pagination"]
        message <- map["message"]
    }
}

class Pagination : NSObject, Mappable{
    
    var next : Int?
    var page : Int?
    var pages : Int?
    var perPage : Int?
    var previous : Int?
    var total : Int?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return Pagination()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        next <- map["next"]
        page <- map["page"]
        pages <- map["pages"]
        perPage <- map["per_page"]
        previous <- map["previous"]
        total <- map["total"]
        
    }
}

class MessageModel : NSObject, Mappable{
    
    var id : String?
    var content : String?
    var conversation : String?
    var createdAt : String?
    var mimeType : String?
    var seen : Bool?
    var sender : Sender?
    var updatedAt : String?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return MessageModel()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        id <- map["_id"]
        content <- map["content"]
        conversation <- map["conversation"]
        createdAt <- map["createdAt"]
        mimeType <- map["mimeType"]
        seen <- map["seen"]
        sender <- map["sender"]
        updatedAt <- map["updatedAt"]
        
    }

}

class Sender : NSObject, Mappable{
    
    var id : String?
    var fullName : String?
    var image : String?
    var orgnizationTitle : String?
    var orgnizationTitleAr : String?
    var orgnizationTitleEn : String?
    var role : String?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return Sender()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        id <- map["_id"]
        fullName <- map["fullName"]
        image <- map["image"]
        orgnizationTitle <- map["orgnizationTitle"]
        orgnizationTitleAr <- map["orgnizationTitleAr"]
        orgnizationTitleEn <- map["orgnizationTitleEn"]
        role <- map["role"]
    }
}
