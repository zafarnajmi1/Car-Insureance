//
//  VCQuotSuccessFully.swift
//  CarInsurance
//
//  Created by Apple on 7/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol successprotocool {
    func mysuccess()
}
class VCQuotSuccessFully: UIViewController {
    @IBOutlet weak var lblsuccessFully: UILabel!
    
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var btnOk: UIButton!
    var delegate:successprotocool?
    var ordernumber = ""
    var createdAt = ""
    var status = ""
    var category = ""
    var user = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      btnOk.setRoundbutton()
        view.isOpaque = false
        //view.backgroundColor = .clear
        self.ChangeDate()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lblsuccessFully.text = "Your order has been successfully sent".localized
        btnOk.setTitle("OK".localized, for: .normal)
    }
    func ChangeDate(){
        
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: createdAt)!
        //MMM d, h:mm a
        dateFormatter.dateFormat = "E,  MMM yyyy 'at'"//"E,  MMM yyyy 'at' HH:mm a"//"d MMM yyyy"//"dd-MM-yyyy"//"MMM d, yyyy" ; //"dd-MM-yyyy HH:mm:ss"
        dateFormatter.locale = tempLocale // reset the locale --> but no need here
        let dateString = dateFormatter.string(from: date)
        
         let mydatestring = dateString + " " + self.getRequiredFormat(dateStrInTwentyFourHourFomat: createdAt)!
        print("EXACT_DATE : \(dateString)")
        lblTime.text = mydatestring
       
    }
    
    func getRequiredFormat(dateStrInTwentyFourHourFomat: String) -> String? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"//"yyyy-MM-dd HH:mm:ss"
        
        if let newDate = dateFormatter.date(from: dateStrInTwentyFourHourFomat) {
            
            let timeFormat = DateFormatter()
            timeFormat.timeZone = TimeZone.autoupdatingCurrent
            timeFormat.locale = Locale(identifier: "en_US_POSIX")
            timeFormat.dateFormat = "hh:mm a"
            
            let requiredStr = timeFormat.string(from: newDate)
            return requiredStr
        } else {
            return nil
        }
    }
    
    @IBAction func OkAction(_ sender: UIButton) {
        
        dismiss(animated: true, completion:nil)
        self.delegate?.mysuccess()

    }
    

}
