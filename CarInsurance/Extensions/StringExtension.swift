//
//  StringExtension.swift
//  Baqala
//
//  Created by apple on 12/17/18.
//  Copyright © 2018 My Technology. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    var numaric : String {
        get { return self.filter("01234567890.".contains) }
    }
    
    var trim: String {
        get { return self.trimmingCharacters(in: NSCharacterSet.whitespaces) }
    }
    
   
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
   
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: Data(utf8),
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

extension String {
    
    //---- ReGular Expressions ----//
    //    "^[a-z]{1,10}$" :  First name
    //    "^[a-z]$" :  Middle Initial
    //    "^[a-z']{2,10}$" : Last Name
    //    "^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\\d\\d$" : Date of Birth
    //    "[a-z]([a-z0-9]*[-_][a-z0-9][a-z0-9]*)$" : username ( must start with a letter, can include letters, numbers _ or -)
    
    
    
    func isValidInputEmail() -> (Bool){
        
        
        let emailRexExp = "^[A-Z0-9a-z._%+-]{3,}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let pred = NSPredicate(format:"SELF MATCHES %@", emailRexExp)
        return pred.evaluate(with: self)
    }
    
    func isValidInputName () -> Bool {
        
        let regEx = "^[A-Za-z]{3,25}$"
        let test = NSPredicate(format:"SELF MATCHES %@", regEx)
        return test.evaluate(with: self)
    }
    
    
    func isValidInputUsername() -> Bool{
        
        let regex =  "^[a-z]([a-z0-9]*[-_][a-z0-9][a-z0-9]*)$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return passwordTest.evaluate(with: self)
        
    }
    
    
}



extension String {
    
    func resizeImage(width: Int = 300, height: Int = 300) -> String? {

        let url = "https://www.projects.mytechnology.ae/car-insurance/resize-image?source=\(self)&width=\(width)&height=\(height)"
        return url
    }
}



extension Int {
    var string : String? {
        get { return "\(self)" }
    }
}

extension Bool {
    var string : String {
        get { return self.description }
    }
}



 //MARK:-  double formatting
extension Int {
    func format(f: String) -> String {
        return String(format: "%\(f)d", self)
    }
    
//    let someInt = 4, someIntFormat = "03"
//    println("The integer number \(someInt) formatted with \"\(someIntFormat)\" looks like \(someInt.format(someIntFormat))")
    // The integer number 4 formatted with "03" looks like 004
}

extension Double{
    //usefull
    var format1 : String {
       get {
            let f = ".1"
        return String(format: "%\(f)f", self )
         }
    }
    
    //    let someDouble = 3.14159265359, someDoubleFormat = ".3"
    //    println("The floating point number \(someDouble) formatted with \"\(someDoubleFormat)\" looks like \(someDouble.format(someDoubleFormat))")
    //    // The floating point number 3.14159265359 formatted with ".3" looks like 3.142
    func format(f: String = ".1") -> String {
        return String(format: "%\(f)f", self ?? 0)
    }

}




