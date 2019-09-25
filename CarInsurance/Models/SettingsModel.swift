//
//  SettingsModel.swift
//  CarInsurance
//
//  Created by Apple on 7/10/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
public class AppSettings {
    public var success : Bool?
    public var message : String?
    public var data : AppSettingsData?
    public var errors : AppSettingsErrors?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [AppSettings]
    {
        var models:[AppSettings] = []
        for item in array
        {
            models.append(AppSettings(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        message = dictionary["message"] as? String
        if (dictionary["data"] != nil) { data = AppSettingsData(dictionary: dictionary["data"] as! NSDictionary) }
        if (dictionary["errors"] != nil) { errors = AppSettingsErrors(dictionary: dictionary["errors"] as! NSDictionary) }
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


public class Settings {
    public var _id : String?
    public var projectTitle : String?
    public var emailSenderName : String?
    public var contactFeedbackSelectors : String?
    public var aboutShortDescription : String?
    public var contactAddress : String?
    public var paypalMode : String?
    public var paypalSandboxClientId : String?
    public var paypalSandboxClientSecret : String?
    public var paypalLiveClientId : String?
    public var paypalLiveClientSecret : String?
    public var contactEmail : String?
    public var emailFrom : String?
    public var facebook : String?
    public var twitter : String?
    public var google : String?
    public var pinterest : String?
    public var contactNumber : String?
    public var introPage : String?
    public var aboutUs : String?
    public var privacyPolicy : String?
    public var termsAndConditions : String?
    public var headerLogo : String?
    public var footerStartLogo : String?
    public var footerEndLogo : String?
    public var enableStats : Bool?
    public var enableSponsers : Bool?
    public var showRatingAndReviews : Bool?
    public var articlePublishPrice : Int?
    public var seminarPublishPrice : Int?
    public var conferencePublishPrice : Int?
    public var offerPublishPrice : Int?
    public var announcementPublishPrice : Int?
    public var location : Array<Double>?
    public var createdAt : String?
    public var updatedAt : String?
    public var aboutUsHome : String?
    public var companies : String?
    public var companiesDetail : String?
    public var easyFeatures : String?
    public var easyUse : String?
    public var easyUseDetail : String?
    public var insuranceGuides : String?
    public var reliable : String?
    public var reliableDetail : String?
    public var aboutUsMobile : String?
    public var privacyPolicyMobile : String?
    public var termsAndConditionsMobile : String?
    public var instagram : String?
    public var aboutShortDescriptionEn : String?
    public var aboutShortDescriptionAr : String?
    public var projectTitleEn : String?
    public var projectTitleAr : String?
    public var emailSenderNameEn : String?
    public var emailSenderNameAr : String?
    public var contactAddressEn : String?
    public var contactAddressAr : String?
    public var contactFeedbackSelectorsEn : String?
    public var contactFeedbackSelectorsAr : String?
    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let settings_list = Settings.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of Settings Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [Settings]
    {
        var models:[Settings] = []
        for item in array
        {
            models.append(Settings(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    /**
     Constructs the object based on the given dictionary.
     
     Sample usage:
     let settings = Settings(someDictionaryFromJSON)
     
     - parameter dictionary:  NSDictionary from JSON.
     
     - returns: Settings Instance.
     */
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        projectTitle = dictionary["projectTitle"] as? String
        emailSenderName = dictionary["emailSenderName"] as? String
        contactFeedbackSelectors = dictionary["contactFeedbackSelectors"] as? String
        aboutShortDescription = dictionary["aboutShortDescription"] as? String
        contactAddress = dictionary["contactAddress"] as? String
        paypalMode = dictionary["paypalMode"] as? String
        paypalSandboxClientId = dictionary["paypalSandboxClientId"] as? String
        paypalSandboxClientSecret = dictionary["paypalSandboxClientSecret"] as? String
        paypalLiveClientId = dictionary["paypalLiveClientId"] as? String
        paypalLiveClientSecret = dictionary["paypalLiveClientSecret"] as? String
        contactEmail = dictionary["contactEmail"] as? String
        emailFrom = dictionary["emailFrom"] as? String
        facebook = dictionary["facebook"] as? String
        twitter = dictionary["twitter"] as? String
        google = dictionary["google"] as? String
        pinterest = dictionary["pinterest"] as? String
        contactNumber = dictionary["contactNumber"] as? String
        introPage = dictionary["introPage"] as? String
        aboutUs = dictionary["aboutUs"] as? String
        privacyPolicy = dictionary["privacyPolicy"] as? String
        termsAndConditions = dictionary["termsAndConditions"] as? String
        headerLogo = dictionary["headerLogo"] as? String
        footerStartLogo = dictionary["footerStartLogo"] as? String
        footerEndLogo = dictionary["footerEndLogo"] as? String
        enableStats = dictionary["enableStats"] as? Bool
        enableSponsers = dictionary["enableSponsers"] as? Bool
        showRatingAndReviews = dictionary["showRatingAndReviews"] as? Bool
        articlePublishPrice = dictionary["articlePublishPrice"] as? Int
        seminarPublishPrice = dictionary["seminarPublishPrice"] as? Int
        conferencePublishPrice = dictionary["conferencePublishPrice"] as? Int
        offerPublishPrice = dictionary["offerPublishPrice"] as? Int
        announcementPublishPrice = dictionary["announcementPublishPrice"] as? Int
        location = dictionary["location"]  as? Array<Double>
        //if (dictionary["location"] != nil) { location = Location.modelsFromDictionaryArray(dictionary["location"] as! NSArray) }
        createdAt = dictionary["createdAt"] as? String
        updatedAt = dictionary["updatedAt"] as? String
        aboutUsHome = dictionary["aboutUsHome"] as? String
        companies = dictionary["companies"] as? String
        companiesDetail = dictionary["companiesDetail"] as? String
        easyFeatures = dictionary["easyFeatures"] as? String
        easyUse = dictionary["easyUse"] as? String
        easyUseDetail = dictionary["easyUseDetail"] as? String
        insuranceGuides = dictionary["insuranceGuides"] as? String
        reliable = dictionary["reliable"] as? String
        reliableDetail = dictionary["reliableDetail"] as? String
        aboutUsMobile = dictionary["aboutUsMobile"] as? String
        privacyPolicyMobile = dictionary["privacyPolicyMobile"] as? String
        termsAndConditionsMobile = dictionary["termsAndConditionsMobile"] as? String
        instagram = dictionary["instagram"] as? String
        aboutShortDescriptionEn = dictionary["aboutShortDescriptionEn"] as? String
        aboutShortDescriptionAr = dictionary["aboutShortDescriptionAr"] as? String
        projectTitleEn = dictionary["projectTitleEn"] as? String
        projectTitleAr = dictionary["projectTitleAr"] as? String
        emailSenderNameEn = dictionary["emailSenderNameEn"] as? String
        emailSenderNameAr = dictionary["emailSenderNameAr"] as? String
        contactAddressEn = dictionary["contactAddressEn"] as? String
        contactAddressAr = dictionary["contactAddressAr"] as? String
        contactFeedbackSelectorsEn = dictionary["contactFeedbackSelectorsEn"] as? String
        contactFeedbackSelectorsAr = dictionary["contactFeedbackSelectorsAr"] as? String
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.projectTitle, forKey: "projectTitle")
        dictionary.setValue(self.emailSenderName, forKey: "emailSenderName")
        dictionary.setValue(self.contactFeedbackSelectors, forKey: "contactFeedbackSelectors")
        dictionary.setValue(self.aboutShortDescription, forKey: "aboutShortDescription")
        dictionary.setValue(self.contactAddress, forKey: "contactAddress")
        dictionary.setValue(self.paypalMode, forKey: "paypalMode")
        dictionary.setValue(self.paypalSandboxClientId, forKey: "paypalSandboxClientId")
        dictionary.setValue(self.paypalSandboxClientSecret, forKey: "paypalSandboxClientSecret")
        dictionary.setValue(self.paypalLiveClientId, forKey: "paypalLiveClientId")
        dictionary.setValue(self.paypalLiveClientSecret, forKey: "paypalLiveClientSecret")
        dictionary.setValue(self.contactEmail, forKey: "contactEmail")
        dictionary.setValue(self.emailFrom, forKey: "emailFrom")
        dictionary.setValue(self.facebook, forKey: "facebook")
        dictionary.setValue(self.twitter, forKey: "twitter")
        dictionary.setValue(self.google, forKey: "google")
        dictionary.setValue(self.pinterest, forKey: "pinterest")
        dictionary.setValue(self.contactNumber, forKey: "contactNumber")
        dictionary.setValue(self.introPage, forKey: "introPage")
        dictionary.setValue(self.aboutUs, forKey: "aboutUs")
        dictionary.setValue(self.privacyPolicy, forKey: "privacyPolicy")
        dictionary.setValue(self.termsAndConditions, forKey: "termsAndConditions")
        dictionary.setValue(self.headerLogo, forKey: "headerLogo")
        dictionary.setValue(self.footerStartLogo, forKey: "footerStartLogo")
        dictionary.setValue(self.footerEndLogo, forKey: "footerEndLogo")
        dictionary.setValue(self.enableStats, forKey: "enableStats")
        dictionary.setValue(self.enableSponsers, forKey: "enableSponsers")
        dictionary.setValue(self.showRatingAndReviews, forKey: "showRatingAndReviews")
        dictionary.setValue(self.articlePublishPrice, forKey: "articlePublishPrice")
        dictionary.setValue(self.seminarPublishPrice, forKey: "seminarPublishPrice")
        dictionary.setValue(self.conferencePublishPrice, forKey: "conferencePublishPrice")
        dictionary.setValue(self.offerPublishPrice, forKey: "offerPublishPrice")
        dictionary.setValue(self.announcementPublishPrice, forKey: "announcementPublishPrice")
        dictionary.setValue(self.createdAt, forKey: "createdAt")
        dictionary.setValue(self.updatedAt, forKey: "updatedAt")
        dictionary.setValue(self.aboutUsHome, forKey: "aboutUsHome")
        dictionary.setValue(self.companies, forKey: "companies")
        dictionary.setValue(self.companiesDetail, forKey: "companiesDetail")
        dictionary.setValue(self.easyFeatures, forKey: "easyFeatures")
        dictionary.setValue(self.easyUse, forKey: "easyUse")
        dictionary.setValue(self.easyUseDetail, forKey: "easyUseDetail")
        dictionary.setValue(self.insuranceGuides, forKey: "insuranceGuides")
        dictionary.setValue(self.reliable, forKey: "reliable")
        dictionary.setValue(self.reliableDetail, forKey: "reliableDetail")
        dictionary.setValue(self.aboutUsMobile, forKey: "aboutUsMobile")
        dictionary.setValue(self.privacyPolicyMobile, forKey: "privacyPolicyMobile")
        dictionary.setValue(self.termsAndConditionsMobile, forKey: "termsAndConditionsMobile")
        dictionary.setValue(self.instagram, forKey: "instagram")
        dictionary.setValue(self.aboutShortDescriptionEn, forKey: "aboutShortDescriptionEn")
        dictionary.setValue(self.aboutShortDescriptionAr, forKey: "aboutShortDescriptionAr")
        dictionary.setValue(self.projectTitleEn, forKey: "projectTitleEn")
        dictionary.setValue(self.projectTitleAr, forKey: "projectTitleAr")
        dictionary.setValue(self.emailSenderNameEn, forKey: "emailSenderNameEn")
        dictionary.setValue(self.emailSenderNameAr, forKey: "emailSenderNameAr")
        dictionary.setValue(self.contactAddressEn, forKey: "contactAddressEn")
        dictionary.setValue(self.contactAddressAr, forKey: "contactAddressAr")
        dictionary.setValue(self.contactFeedbackSelectorsEn, forKey: "contactFeedbackSelectorsEn")
        dictionary.setValue(self.contactFeedbackSelectorsAr, forKey: "contactFeedbackSelectorsAr")
        
        return dictionary
    }
    
}



public class AppSettingsData {
    public var settings : Settings?
    public var cities : Array<String>?
    public var categories : Array<Categories>?
    public var sponsers : Array<Sponsers>?
    public var sliders : Array<Sliders>?
    public var steps : Array<Steps>?
    public var guides : Array<Guides>?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [AppSettingsData]
    {
        var models:[AppSettingsData] = []
        for item in array
        {
            models.append(AppSettingsData(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        if (dictionary["settings"] != nil) { settings = Settings(dictionary: dictionary["settings"] as! NSDictionary) }
        cities = dictionary["cities"] as? Array<String>
        //if (dictionary["cities"] != nil) { cities = Cities.modelsFromDictionaryArray(dictionary["cities"] as! NSArray) }
        if (dictionary["categories"] != nil) { categories = Categories.modelsFromDictionaryArray(array: dictionary["categories"] as! NSArray) }
        if (dictionary["sponsers"] != nil) { sponsers = Sponsers.modelsFromDictionaryArray(array: dictionary["sponsers"] as! NSArray) }
        if (dictionary["sliders"] != nil) { sliders = Sliders.modelsFromDictionaryArray(array: dictionary["sliders"] as! NSArray) }
        if (dictionary["steps"] != nil) { steps = Steps.modelsFromDictionaryArray(array: dictionary["steps"] as! NSArray) }
        if (dictionary["guides"] != nil) { guides = Guides.modelsFromDictionaryArray(array: dictionary["guides"] as! NSArray) }
    }
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.settings?.dictionaryRepresentation(), forKey: "settings")
        
        return dictionary
    }
    
}



public class AppSettingsErrors {
    

    public class func modelsFromDictionaryArray(array:NSArray) -> [AppSettingsErrors]
    {
        var models:[AppSettingsErrors] = []
        for item in array
        {
            models.append(AppSettingsErrors(dictionary: item as! NSDictionary)!)
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
public class Guides {
    public var _id : String?
    public var title : String?
    public var detail : String?
    public var sortOrder : Int?
    public var isActive : Bool?
    public var titleEn : String?
    public var titleAr : String?
    public var detailEn : String?
    public var detailAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [Guides]
    {
        var models:[Guides] = []
        for item in array
        {
            models.append(Guides(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        detail = dictionary["detail"] as? String
        sortOrder = dictionary["sortOrder"] as? Int
        isActive = dictionary["isActive"] as? Bool
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
        dictionary.setValue(self.sortOrder, forKey: "sortOrder")
        dictionary.setValue(self.isActive, forKey: "isActive")
        dictionary.setValue(self.titleEn, forKey: "titleEn")
        dictionary.setValue(self.titleAr, forKey: "titleAr")
        dictionary.setValue(self.detailEn, forKey: "detailEn")
        dictionary.setValue(self.detailAr, forKey: "detailAr")
        
        return dictionary
    }
    
}


public class Steps {
    public var _id : String?
    public var title : String?
    public var detail : String?
    public var image : String?
    public var isActive : Bool?
    public var sortOrder : Int?
    public var titleEn : String?
    public var titleAr : String?
    public var detailEn : String?
    public var detailAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [Steps]
    {
        var models:[Steps] = []
        for item in array
        {
            models.append(Steps(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        detail = dictionary["detail"] as? String
        image = dictionary["image"] as? String
        isActive = dictionary["isActive"] as? Bool
        sortOrder = dictionary["sortOrder"] as? Int
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
        dictionary.setValue(self.image, forKey: "image")
        dictionary.setValue(self.isActive, forKey: "isActive")
        dictionary.setValue(self.sortOrder, forKey: "sortOrder")
        dictionary.setValue(self.titleEn, forKey: "titleEn")
        dictionary.setValue(self.titleAr, forKey: "titleAr")
        dictionary.setValue(self.detailEn, forKey: "detailEn")
        dictionary.setValue(self.detailAr, forKey: "detailAr")
        
        return dictionary
    }
    
}


public class Sponsers {
    public var _id : String?
    public var title : String?
    public var image : String?
    public var link : String?
    public var createdAt : String?
    public var updatedAt : String?
    public var titleEn : String?
    public var titleAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [Sponsers]
    {
        var models:[Sponsers] = []
        for item in array
        {
            models.append(Sponsers(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        image = dictionary["image"] as? String
        link = dictionary["link"] as? String
        createdAt = dictionary["createdAt"] as? String
        updatedAt = dictionary["updatedAt"] as? String
        titleEn = dictionary["titleEn"] as? String
        titleAr = dictionary["titleAr"] as? String
    }
    
    
   
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.image, forKey: "image")
        dictionary.setValue(self.link, forKey: "link")
        dictionary.setValue(self.createdAt, forKey: "createdAt")
        dictionary.setValue(self.updatedAt, forKey: "updatedAt")
        dictionary.setValue(self.titleEn, forKey: "titleEn")
        dictionary.setValue(self.titleAr, forKey: "titleAr")
        
        return dictionary
    }
    
}

public class Sliders {
    public var _id : String?
    public var title : String?
    public var detail : String?
    public var image : String?
    public var createdAt : String?
    public var updatedAt : String?
   // public var detailMobile : DetailMobile?
    public var titleEn : String?
    public var titleAr : String?
    public var detailEn : String?
    public var detailAr : String?
    public var detailMobileEn : String?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [Sliders]
    {
        var models:[Sliders] = []
        for item in array
        {
            models.append(Sliders(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        detail = dictionary["detail"] as? String
        image = dictionary["image"] as? String
        createdAt = dictionary["createdAt"] as? String
        updatedAt = dictionary["updatedAt"] as? String
       // if (dictionary["detailMobile"] != nil) { detailMobile = DetailMobile(dictionary: dictionary["detailMobile"] as! NSDictionary) }
        titleEn = dictionary["titleEn"] as? String
        titleAr = dictionary["titleAr"] as? String
        detailEn = dictionary["detailEn"] as? String
        detailAr = dictionary["detailAr"] as? String
        detailMobileEn = dictionary["detailMobileEn"] as? String
    }
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.detail, forKey: "detail")
        dictionary.setValue(self.image, forKey: "image")
        dictionary.setValue(self.createdAt, forKey: "createdAt")
        dictionary.setValue(self.updatedAt, forKey: "updatedAt")
        //dictionary.setValue(self.detailMobile?.dictionaryRepresentation(), forKey: "detailMobile")
        dictionary.setValue(self.titleEn, forKey: "titleEn")
        dictionary.setValue(self.titleAr, forKey: "titleAr")
        dictionary.setValue(self.detailEn, forKey: "detailEn")
        dictionary.setValue(self.detailAr, forKey: "detailAr")
        dictionary.setValue(self.detailMobileEn, forKey: "detailMobileEn")
        
        return dictionary
    }
    
}

public class DetailMobile {
    public var en : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [DetailMobile]
    {
        var models:[DetailMobile] = []
        for item in array
        {
            models.append(DetailMobile(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    

    required public init?(dictionary: NSDictionary) {
        
        en = dictionary["en"] as? String
    }
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.en, forKey: "en")
        
        return dictionary
    }
    
}

public class Categories {
    public var _id : String?
    public var title : String?
    public var image : String?
    public var sortOrder : Int?
    public var detail : String?
    public var titleEn : String?
    public var titleAr : String?
    public var detailEn : String?
    public var detailAr : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [Categories]
    {
        var models:[Categories] = []
        for item in array
        {
            models.append(Categories(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    
    required public init?(dictionary: NSDictionary) {
        
        _id = dictionary["_id"] as? String
        title = dictionary["title"] as? String
        image = dictionary["image"] as? String
        sortOrder = dictionary["sortOrder"] as? Int
        detail = dictionary["detail"] as? String
        titleEn = dictionary["titleEn"] as? String
        titleAr = dictionary["titleAr"] as? String
        detailEn = dictionary["detailEn"] as? String
        detailAr = dictionary["detailAr"] as? String
    }
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.image, forKey: "image")
        dictionary.setValue(self.sortOrder, forKey: "sortOrder")
        dictionary.setValue(self.detail, forKey: "detail")
        dictionary.setValue(self.titleEn, forKey: "titleEn")
        dictionary.setValue(self.titleAr, forKey: "titleAr")
        dictionary.setValue(self.detailEn, forKey: "detailEn")
        dictionary.setValue(self.detailAr, forKey: "detailAr")
        
        return dictionary
    }
    
}
