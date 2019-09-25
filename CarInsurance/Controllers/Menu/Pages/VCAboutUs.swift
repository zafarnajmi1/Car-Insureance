//
//  VCAboutUs.swift
//  CarInsurance
//
//  Created by Apple on 7/8/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  WebKit
import  NVActivityIndicatorView
import SKActivityIndicatorView
class VCAboutUs: UIViewController, NVActivityIndicatorViewable {

    @IBOutlet weak var lblabout: UILabel!
    @IBOutlet weak var lblFolowwUs: UILabel!
    @IBOutlet weak var lblphoneNumber: UILabel!
    @IBOutlet weak var lblemail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //aboutUSWebkit.scrollView.isScrollEnabled = false
        self.title = "About Us".localized
          self.addBackButton()
        lblFolowwUs.text = "Follow Us".localized
        
        self.setNavigationBar()
        self.aboutUsApiCall()
        
        self.lblphoneNumber.text = AppUserDefault.shared.settingData?.settings?.contactNumber
        self.lblemail.text = AppUserDefault.shared.settingData?.settings?.contactEmail
    }
    
    
    
    func aboutUsApiCall(){
        
        
        
        SKActivityIndicator.show()
        let urlrequest = URL(string: "https://www.projects.mytechnology.ae/car-insurance/en/api/page-slug?slug=about-us-page-mobile")
        let task = URLSession.shared.dataTask(with: urlrequest!) { [weak self] data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                SKActivityIndicator.dismiss()

                if let contents = String(data: data, encoding: .ascii){
                    let attributedString = try! NSAttributedString(data: contents.data(using: .utf8
                        )!, options: [NSAttributedString.DocumentReadingOptionKey.documentType :NSAttributedString.DocumentType.html], documentAttributes: nil)
                    //                    self?.txt_tnc.attributedText = attributedString
                    self?.lblabout.attributedText = attributedString
                }
                //                let contents = String(data: data, encoding: .ascii)
                //                self?.wkw_termsAndCondition.loadHTMLString(contents!, baseURL: nil)
                //                self?.wkw_termsAndCondition.sizeToFit()
            }

        }
        task.resume()
        
        
//        SKActivityIndicator.show()
//        userhandler.aboutUs(slug: AppUserDefault.shared.settingData?.settings?.aboutUsMobile ?? "", Success: {(SuccessResponse)in
//            SKActivityIndicator.dismiss()
//            if(SuccessResponse.success!){
//
//                let htmlData = NSString(string: SuccessResponse.data!.detail!).data(using: String.Encoding.unicode.rawValue)
//                let options = [NSAttributedString.DocumentReadingOptionKey.documentType:
//                    NSAttributedString.DocumentType.html]
//                let attributedString = try? NSMutableAttributedString(data: htmlData ?? Data(),
//                                                                      options: options,
//                                                                      documentAttributes: nil)
//
//
//                self.lblabout.attributedText =  attributedString //SuccessResponse.data?.detail?.html2String
//
//
//                self.lblemail.text = SuccessResponse.data?.payerEmail
//                self.lblphoneNumber.text = SuccessResponse.data?.phone
//            }else{
//                 SKActivityIndicator.dismiss()
//                self.alertMessage(message: SuccessResponse.message!, completionHandler: nil)
//            }
//
//
//        }, Falioure: {(error)in
//             SKActivityIndicator.dismiss()
//            self.alertMessage(message: error.message, completionHandler: nil)
//
//        })
//
    }
    
    
    @IBAction func fbAction(_ sender: UIButton) {
        
        guard let url = URL(string: AppUserDefault.shared.settingData?.settings?.facebook ?? "") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func snapchatAction(_ sender: UIButton) {
        guard let url = URL(string: AppUserDefault.shared.settingData?.settings?.twitter ?? "") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func whatsAppAction(_ sender: UIButton) {
        guard let url = URL(string: AppUserDefault.shared.settingData?.settings?.instagram ?? "") else { return }
        UIApplication.shared.open(url)
    }
    
//    @IBAction func instaAction(_ sender: UIButton) {
//        guard let url = URL(string: AppUserDefault.shared.settingData?.settings?.google ?? "") else { return }
//        UIApplication.shared.open(url)
//    }
}
