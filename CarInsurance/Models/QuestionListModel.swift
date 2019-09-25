//
//  QuestionListModel.swift
//  CarInsurance
//
//  Created by Apple on 7/22/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
public class QuestionList {
    public var success : Bool?
    public var message : String?
    public var data : Array<QuestionListData>?
    public var errors : QuestionListErrors?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [QuestionList]
    {
        var models:[QuestionList] = []
        for item in array
        {
            models.append(QuestionList(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    

    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        message = dictionary["message"] as? String
        if (dictionary["data"] != nil) { data = QuestionListData.modelsFromDictionaryArray(array: dictionary["data"] as! NSArray) }
        if (dictionary["errors"] != nil) { errors = QuestionListErrors(dictionary: dictionary["errors"] as! NSDictionary) }
    }
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.success, forKey: "success")
        dictionary.setValue(self.message, forKey: "message")
        dictionary.setValue(self.errors?.dictionaryRepresentation(), forKey: "errors")
        
        return dictionary
    }
    
}


public class QuestionListData {
//    public var _id : String?
//    public var title : String?
//    public var sortOrder : Int?
//    public var questions : Array<Questions>?
//    public var children : Array<Children>?
//    public var titleEn : String?
//    public var titleAr : String?
//
//
//    public class func modelsFromDictionaryArray(array:NSArray) -> [QuestionListData]
//    {
//        var models:[QuestionListData] = []
//        for item in array
//        {
//            models.append(QuestionListData(dictionary: item as! NSDictionary)!)
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
//        if (dictionary["question"] != nil) { questions = Questions.modelsFromDictionaryArray(array: dictionary["question"] as! NSArray) }
//        //children = dictionary["children"] as? Array<String>
//        if (dictionary["children"] != nil) { children = Children.modelsFromDictionaryArray(array: dictionary["children"] as! NSArray) }
//        //if (dictionary["children"] != nil) { children = Children.modelsFromDictionaryArray(dictionary["children"] as! NSArray) }
//        titleEn = dictionary["titleEn"] as? String
//        titleAr = dictionary["titleAr"] as? String
//    }
//
//
//    public func dictionaryRepresentation() -> NSDictionary {
//
//        let dictionary = NSMutableDictionary()
//
//        dictionary.setValue(self._id, forKey: "_id")
//        dictionary.setValue(self.sortOrder, forKey: "sortOrder")
//        dictionary.setValue(self.title, forKey: "title")
//        dictionary.setValue(self.titleEn, forKey: "titleEn")
//        dictionary.setValue(self.titleAr, forKey: "titleAr")
//
//        return dictionary
//    }
    
    
    public var _id : String?
    public var title : String?
    public var sortOrder : Int?
    public var questions : Array<Questions>?
    public var children : Array<Children>?
    public var titleEn : String?
    public var titleAr : String?
    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let data_list = Data.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of Data Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [QuestionListData]
    {
        var models:[QuestionListData] = []
        for item in array
        {
            models.append(QuestionListData(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    /**
     Constructs the object based on the given dictionary.
     
     Sample usage:
     let data = Data(someDictionaryFromJSON)
     
     - parameter dictionary:  NSDictionary from JSON.
     
     - returns: Data Instance.
     */
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        sortOrder = dictionary["sortOrder"] as? Int
        if (dictionary["questions"] != nil) { questions = Questions.modelsFromDictionaryArray(array: dictionary["questions"] as! NSArray) }
        if (dictionary["children"] != nil) { children = Children.modelsFromDictionaryArray(array: dictionary["children"] as! NSArray) }
        titleEn = dictionary["titleEn"] as? String
        titleAr = dictionary["titleAr"] as? String
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
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

public class QuestionListErrors {
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [QuestionListErrors]
    {
        var models:[QuestionListErrors] = []
        for item in array
        {
            models.append(QuestionListErrors(dictionary: item as! NSDictionary)!)
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


public class Children {
    public var _id : String?
    public var title : String?
    public var children : Array<Children>?
    public var depth : Int?
    public var titleEn : String?
    public var titleAr : String?
   public var questions : Array<Questions>?
    var selectedAns : Int?
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let children_list = Children.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of Children Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [Children]
    {
        var models:[Children] = []
        for item in array
        {
            models.append(Children(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    /**
     Constructs the object based on the given dictionary.
     
     Sample usage:
     let children = Children(someDictionaryFromJSON)
     
     - parameter dictionary:  NSDictionary from JSON.
     
     - returns: Children Instance.
     */
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        if (dictionary["children"] != nil) { children = Children.modelsFromDictionaryArray(array: dictionary["children"] as! NSArray) }
        if (dictionary["questions"] != nil) { questions = Questions.modelsFromDictionaryArray(array: dictionary["questions"] as! NSArray) }
        depth = dictionary["depth"] as? Int
        titleEn = dictionary["titleEn"] as? String
        titleAr = dictionary["titleAr"] as? String
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.depth, forKey: "depth")
        dictionary.setValue(self.titleEn, forKey: "titleEn")
        dictionary.setValue(self.titleAr, forKey: "titleAr")
        
        return dictionary
    }
    
}

//public class Children {
//    public var _id : String?
//    public var title : String?
//   // public var title : Title?
//     public var children : Array<Children>?
//    //public var children : Array<String>?
//    public var depth : Int?
//
//
//    public class func modelsFromDictionaryArray(array:NSArray) -> [Children]
//    {
//        var models:[Children] = []
//        for item in array
//        {
//            models.append(Children(dictionary: item as! NSDictionary)!)
//        }
//        return models
//    }
//
//
//    required public init?(dictionary: NSDictionary) {
//
//        _id = dictionary["_id"] as? String
//        title = dictionary["title"] as? String
//       // if (dictionary["title"] != nil) { title = Title(dictionary: dictionary["title"] as! NSDictionary) }
//        //children = dictionary["children"] as? Array<String>
//        if (dictionary["children"] != nil) { children = Children.modelsFromDictionaryArray(array: dictionary["children"] as! NSArray) }
//        depth = dictionary["depth"] as? Int
//    }
//
//    public func dictionaryRepresentation() -> NSDictionary {
//
//        let dictionary = NSMutableDictionary()
//
//        dictionary.setValue(self._id, forKey: "_id")
//        dictionary.setValue(self.title, forKey: "title")
//        //dictionary.setValue(self.title?.dictionaryRepresentation(), forKey: "title")
//        dictionary.setValue(self.depth, forKey: "depth")
//
//        return dictionary
//    }
//
//}



public class Options {
    public var _id : String?
    public var title : String?
    public var children : Array<Children>?
    public var titleEn : String?
    public var titleAr : String?
    var selectedAns : Int?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [Options]
    {
        var models:[Options] = []
        for item in array
        {
            models.append(Options(dictionary: item as! NSDictionary)!)
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



//public class Questions {
//    public var _id : String?
//    public var title : String?
//    public var placeholder : String?
//    public var isRequired : Bool?
//    public var questionType : String?
//    public var options : Array<Options>?
//    public var titleEn : String?
//    public var titleAr : String?
//    public var placeholderEn : String?
//    public var placeholderAr : String?
//
//
//    public class func modelsFromDictionaryArray(array:NSArray) -> [Questions]
//    {
//        var models:[Questions] = []
//        for item in array
//        {
//            models.append(Questions(dictionary: item as! NSDictionary)!)
//        }
//        return models
//    }
//
//
//    required public init?(dictionary: NSDictionary) {
//
//        _id = dictionary["_id"] as? String
//        title = dictionary["title"] as? String
//        placeholder = dictionary["placeholder"] as? String
//        isRequired = dictionary["isRequired"] as? Bool
//        questionType = dictionary["questionType"] as? String
//        if (dictionary["options"] != nil) { options = Options.modelsFromDictionaryArray(array: dictionary["options"] as! NSArray) }
//        titleEn = dictionary["titleEn"] as? String
//        titleAr = dictionary["titleAr"] as? String
//        placeholderEn = dictionary["placeholderEn"] as? String
//        placeholderAr = dictionary["placeholderAr"] as? String
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
//        dictionary.setValue(self.placeholder, forKey: "placeholder")
//        dictionary.setValue(self.isRequired, forKey: "isRequired")
//        dictionary.setValue(self.questionType, forKey: "questionType")
//        dictionary.setValue(self.titleEn, forKey: "titleEn")
//        dictionary.setValue(self.titleAr, forKey: "titleAr")
//        dictionary.setValue(self.placeholderEn, forKey: "placeholderEn")
//        dictionary.setValue(self.placeholderAr, forKey: "placeholderAr")
//
//        return dictionary
//    }
//
//}


public class Questions {
    public var _id : String?
    public var title : String?
    public var placeholder : String?
    public var isRequired : Bool?
    public var questionType : String?
    public var options : Array<Options>?
    public var titleEn : String?
    public var titleAr : String?
    public var placeholderEn : String?
    public var placeholderAr : String?
    public var answer: UserOrderDeatilAnswer?
    public var isFutureDate : Bool?
    public var isPreviousDate : Bool?
    var selectedAns: Int?
    var answerText : String?
    var imageURL : String?
    var yesNo : Bool?
    
//    var yes:String?
//    var no:String?

    public class func modelsFromDictionaryArray(array:NSArray) -> [Questions]
    {
        var models:[Questions] = []
        for item in array
        {
            models.append(Questions(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        placeholder = dictionary["placeholder"] as? String
        isRequired = dictionary["isRequired"] as? Bool
        questionType = dictionary["questionType"] as? String
        if (dictionary["options"] != nil) { options = Options.modelsFromDictionaryArray(array: dictionary["options"] as! NSArray) }
        if (dictionary["answer"] != nil) { answer = UserOrderDeatilAnswer(dictionary: dictionary["answer"] as? NSDictionary ?? [:]) }
        titleEn = dictionary["titleEn"] as? String
        titleAr = dictionary["titleAr"] as? String
        placeholderEn = dictionary["placeholderEn"] as? String
        placeholderAr = dictionary["placeholderAr"] as? String
        isFutureDate =  dictionary["isFutureDate"] as? Bool
        isPreviousDate = dictionary["isPreviousDate"] as? Bool
       
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
        dictionary.setValue(self.isFutureDate, forKey: "isFutureDate")
         dictionary.setValue(self.isPreviousDate, forKey: "isPreviousDate")
        return dictionary
    }
    
}




public class Title {
    public var en : String?
    public var ar : String?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [Title]
    {
        var models:[Title] = []
        for item in array
        {
            models.append(Title(dictionary: item as! NSDictionary)!)
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


class PostParams {
    var params : [String : Any] = [:]
    var id: String?
    var isSecondFormCompleted : Bool?
    
}
