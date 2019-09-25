//
//  RootNotificationModel.swift
//  TailerOnline
//
//  Created by apple on 4/18/19.
//  Copyright © 2019 mytechnology. All rights reserved.
//

import Foundation
import ObjectMapper
class UnseenNotificationAPIResponse : NSObject, Mappable{
    
    var data : UnseenNotifications?
    var errors : Error?
    var message : String?
    var success : Bool?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return UnseenNotificationAPIResponse()
    }
    required init?(map: Map){}
    override init(){}
    
    func mapping(map: Map)
    {
        data <- map["data"]
        errors <- map["errors"]
        message <- map["message"]
        success <- map["success"]
        
    }
    
}
class UnseenNotifications : NSObject, Mappable{

    var total: Int?
    
    class func newInstance(map: Map) -> Mappable?{
        return UnseenNotifications()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        total <- map["total"]
    }
}
class NotificationAPIResponse : NSObject, Mappable{
    
    var data : NotificationData?
    var errors : Error?
    var message : String?
    var success : Bool?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return NotificationAPIResponse()
    }
    required init?(map: Map){}
    override init(){}
    
    func mapping(map: Map)
    {
        data <- map["data"]
        errors <- map["errors"]
        message <- map["message"]
        success <- map["success"]
        
    }

}

class NotificationData : NSObject, Mappable{
    
    var notifications : [NotificationModel]?
    var pagination : Pagination?
    var unseenNotificationsCount : Int?
    var total: Int?
    
    class func newInstance(map: Map) -> Mappable?{
        return NotificationData()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        notifications <- map["notifications"]
        pagination <- map["pagination"]
        unseenNotificationsCount <- map["unseenNotificationsCount"]
        total <- map["total"]
    }
}

class NotificationModel : NSObject, Mappable{
    
    var id : String?
    var action : String?
    var createdAt : String?
    var descriptionField : String?
    var extras : ExtraModel?
    var read : Bool?
    var receiver : String?
    var seen : Bool?
    var sender : Sender?
    var title : String?
    var updatedAt : String?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return NotificationModel()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        id <- map["_id"]
        action <- map["action"]
        createdAt <- map["createdAt"]
        descriptionField <- map["description"]
        extras <- map["extras"]
        read <- map["read"]
        receiver <- map["receiver"]
        seen <- map["seen"]
        sender <- map["sender"]
        title <- map["title"]
        updatedAt <- map["updatedAt"]
        
    }
    
}

//class Title : NSObject, Mappable{
//    
//    var ar : String?
//    var en : String?
//    
//    
//    class func newInstance(map: Map) -> Mappable?{
//        return Title()
//    }
//    required init?(map: Map){}
//    private override init(){}
//    
//    func mapping(map: Map)
//    {
//        ar <- map["ar"]
//        en <- map["en"]
//        
//    }
//}

class ExtraModel : NSObject, Mappable{
    
    var conversation : String?
    var product : String?
    var order : OrderModel?
    var orderDetail : String?
    
    class func newInstance(map: Map) -> Mappable?{
        return ExtraModel()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        conversation <- map["conversation"]
        product <- map["product"]
        order <- map["order"]
        orderDetail <- map["orderDetail"]
    }
    
}


class OrderModel : NSObject, Mappable{
    
    var status : String?
    var id : String?
  
    
    class func newInstance(map: Map) -> Mappable?{
        return OrderModel()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        status <- map["status"]
        id <- map["_id"]
       
    }
    
}
