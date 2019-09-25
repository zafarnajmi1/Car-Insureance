//
//  VCTermsAndConditions.swift
//  CarInsurance
//
//  Created by Apple on 7/8/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  WebKit

import SKActivityIndicatorView
class VCTermsAndConditions: UIViewController {

    @IBOutlet weak var lblterms: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setTermView()
    }
    func setTermView(){
        self.title = "Terms And Conditions".localized
       self.addBackButton()
//        if (myDefaultLanguage == .en){
//           
//        }else{
//            addArabicBackButton()
//        }
        
        self.setNavigationBar()
        
    self.termsandcontionsApiCall()
    }
    //https://www.projects.mytechnology.ae/car-insurance/en/api/page?slug=terms-and-conditions-mobile&currency=aed
    
    //AppUserDefault.shared.settingData?.settings?.termsAndConditions
    func termsandcontionsApiCall(){
        
        
        SKActivityIndicator.show()
        let urlrequest = URL(string: "https://www.projects.mytechnology.ae/car-insurance/en/api/page-slug?slug=terms-and-conditions-mobile")
        let task = URLSession.shared.dataTask(with: urlrequest!) { [weak self] data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
               SKActivityIndicator.dismiss()

                if let contents = String(data: data, encoding: .ascii){
                    let attributedString = try! NSAttributedString(data: contents.data(using: .utf8
                        )!, options: [NSAttributedString.DocumentReadingOptionKey.documentType :NSAttributedString.DocumentType.html], documentAttributes: nil)
                    //                    self?.txt_tnc.attributedText = attributedString
                    self?.lblterms.attributedText = attributedString
                }
                //                let contents = String(data: data, encoding: .ascii)
                //                self?.wkw_termsAndCondition.loadHTMLString(contents!, baseURL: nil)
                //                self?.wkw_termsAndCondition.sizeToFit()
            }

        }
        task.resume()

        
//        
//        SKActivityIndicator.show()
//        userhandler.termsandContion(slug: AppUserDefault.shared.settingData?.settings?.termsAndConditionsMobile ?? "" , Success:{(SuccessResponse)in
//            SKActivityIndicator.dismiss()
//            if(SuccessResponse.success!){
//                let htmlData = NSString(string: SuccessResponse.data!.detail!).data(using: String.Encoding.unicode.rawValue)
//                let options = [NSAttributedString.DocumentReadingOptionKey.documentType:
//                    NSAttributedString.DocumentType.html]
//                let attributedString = try? NSMutableAttributedString(data: htmlData ?? Data(),
//                                                                      options: options,
//                                                                      documentAttributes: nil)
//
//
//                self.lblterms.attributedText =  attributedString //SuccessResponse.data?.detail?.html2String
//
//            }else{
//                 SKActivityIndicator.dismiss()
//                self.alertMessage(message: SuccessResponse.message!, completionHandler: nil)
//            }
//        }, Falioure: {(error)in
//             SKActivityIndicator.dismiss()
//            self.alertMessage(message: error.message, completionHandler: nil)
//        })
        
    }


}
