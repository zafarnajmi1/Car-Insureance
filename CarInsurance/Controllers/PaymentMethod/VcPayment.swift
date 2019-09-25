//
//  VcPayment.swift
//  CarInsurance
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class VcPayment: UIViewController {

    @IBOutlet weak var lbltoBuy: UILabel!
    @IBOutlet weak var lblpaymethod: UILabel!
    @IBOutlet weak var btncash: UIButton!
    @IBOutlet weak var btncreditCard: UIButton!
    @IBOutlet weak var btnpaypal: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.viewWillAppear(animated)
        self.title = "Payment".localized
        self.setNavigationBar()
        self.addBackButton()
//        if (myDefaultLanguage == .en){
//            
//          }
//         else{
//            addArabicBackButton()
//         }
        
        self.setViewOfPayment()
    }
    func setViewOfPayment(){
        
        self.btncash.setcornerButton(Corner: 10)
        self.btnpaypal.setcornerButton(Corner: 10)
        self.btncreditCard.setcornerButton(Corner: 10)
        
    }

    

}
