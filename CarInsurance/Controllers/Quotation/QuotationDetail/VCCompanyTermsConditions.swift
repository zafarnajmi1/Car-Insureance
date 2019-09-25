//
//  VCCompanyTermsConditions.swift
//  CarInsurance
//
//  Created by Apple on 8/28/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class VCCompanyTermsConditions: UIViewController {
     var terms = ""
    @IBOutlet weak var txtviewterms: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

       self.txtviewterms.text = terms
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Terms & Conditions".localized
        self.addBackButton()
//        if (myDefaultLanguage == .en){
//            
//        }else{
//            addArabicBackButton()
//        }
        self.setNavigationBar()
    }

   

}
