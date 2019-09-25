//
//  AppLanguageConfig.swift
//  CarInsurance
//
//  Created by Apple on 8/29/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import Foundation

//MARK:- lanaguage handling
enum LanguageType:String {
    case en
    case ar
}
//selected default
var myDefaultLanguage = LanguageType.en


extension String {
    
    var localized: String {

        let path = Bundle.main.path(forResource: myDefaultLanguage.rawValue, ofType: "lproj")
        let bundle = Bundle(path: path!)

        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
    
}


class AppLanguage {
    
    static func updateUIScreenDirection()  {
        switch myDefaultLanguage.rawValue {
        case "ar":
            UIView.appearance().semanticContentAttribute = .forceRightToLeft //ar
            UITableViewCell.appearance().semanticContentAttribute = .forceRightToLeft
            UINavigationBar.appearance().semanticContentAttribute = .forceRightToLeft
            UITabBar.appearance().semanticContentAttribute = .forceRightToLeft
            //view?.semanticContentAttribute = .forceRightToLeft
        default: // .en
            UIView.appearance().semanticContentAttribute = .forceLeftToRight //en
            UITableViewCell.appearance().semanticContentAttribute = .forceLeftToRight
            UINavigationBar.appearance().semanticContentAttribute = .forceLeftToRight
            UITabBar.appearance().semanticContentAttribute = .forceLeftToRight
              //view?.semanticContentAttribute = .forceLeftToRight
        }
    }
    
    static func updateLabelsDirection(_ labels: [UILabel])  {
        
        switch myDefaultLanguage.rawValue {
        case "ar":
            for label in labels {
                label.textAlignment = .right
            }
        default: // .en
            for label in labels {
                label.textAlignment = .left
            }
        }
    }
    
    static func updateTextFieldsDirection(_ textFields: [UITextField])  {
        
        switch myDefaultLanguage.rawValue {
        case "ar":
            for tf in textFields {
                tf.textAlignment = .right
            }
        default: // .en
            for tf in textFields {
                tf.textAlignment = .left
            }
        }
    }
    
    static func updateTextViewsDirection(_ textViews: [UITextView])  {
        
        switch myDefaultLanguage.rawValue {
        case "ar":
            for tf in textViews {
                tf.textAlignment = .right
            }
        default: // .en
            for tf in textViews {
                tf.textAlignment = .left
            }
        }
    }
}



extension UIView {
    
    func localized() {
        switch myDefaultLanguage.rawValue {
        case "ar":
            self.semanticContentAttribute = .forceRightToLeft //ar
        default: // .en
           self.semanticContentAttribute = .forceLeftToRight //en
           
           
        }
    }
}

//extension UITextView {
//    func localized() {
//        switch myDefaultLanguage.rawValue {
//        case "ar":
//            self.semanticContentAttribute = .forceRightToLeft //ar
//        default: // .en
//            self.semanticContentAttribute = .forceLeftToRight //en
//            
//            
//        }
//    }
//}

