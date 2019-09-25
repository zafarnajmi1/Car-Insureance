//
//  VcPrivacyPolicy.swift
//  CarInsurance
//
//  Created by Apple on 7/8/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  WebKit

import SKActivityIndicatorView
class VcPrivacyPolicy: UIViewController {

    @IBOutlet weak var lblprivacy: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Privacy Policy".localized
       
        self.addBackButton()
//        if (myDefaultLanguage == .en){
//            
//        }else{
//            addArabicBackButton()
//        }
        
        
        self.setNavigationBar()
        self.privacyPolicyApiCall()
    }
    
    
    func privacyPolicyApiCall(){
        
        
        SKActivityIndicator.show()
        let urlrequest = URL(string: "https://www.projects.mytechnology.ae/car-insurance/en/api/page-slug?slug=privacy-policy-mobile")
        let task = URLSession.shared.dataTask(with: urlrequest!) { [weak self] data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
               SKActivityIndicator.dismiss()

                if let contents = String(data: data, encoding: .ascii){
                    let attributedString = try! NSAttributedString(data: contents.data(using: .utf8
                        )!, options: [NSAttributedString.DocumentReadingOptionKey.documentType :NSAttributedString.DocumentType.html], documentAttributes: nil)
                    //                    self?.txt_tnc.attributedText = attributedString
                    self?.lblprivacy.attributedText = attributedString
                }
                //                let contents = String(data: data, encoding: .ascii)
                //                self?.wkw_termsAndCondition.loadHTMLString(contents!, baseURL: nil)
                //                self?.wkw_termsAndCondition.sizeToFit()
            }

        }
        task.resume()
        
//        SKActivityIndicator.show()
//        userhandler.privacyPolicys(slug: AppUserDefault.shared.settingData?.settings?.privacyPolicyMobile ?? "", Success: {(SuccessResponse)in
//            SKActivityIndicator.dismiss()
//            if(SuccessResponse.success!){
//
//
//                let htmlData = NSString(string: SuccessResponse.data!.detail!).data(using: String.Encoding.unicode.rawValue)
//                let options = [NSAttributedString.DocumentReadingOptionKey.documentType:
//                    NSAttributedString.DocumentType.html]
//                let attributedString = try? NSMutableAttributedString(data: htmlData ?? Data(),
//                                                                      options: options,
//                                                                      documentAttributes: nil)
//
//
//                self.lblprivacy.attributedText =  attributedString //SuccessResponse.data?.detail?.html2String
//
//            }else{
//                SKActivityIndicator.dismiss()
//                self.alertMessage(message: SuccessResponse.message!, completionHandler: nil)
//            }
//        }, Falioure: {(error)in
//            SKActivityIndicator.dismiss()
//            self.alertMessage(message: error.message, completionHandler: nil)
//        })
        
    }
}
