//
//  VCUserInfoPOPUp.swift
//  CarInsurance
//
//  Created by Apple on 9/6/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class VCUserInfoPOPUp: UIViewController {

    @IBOutlet weak var lblbilladdress: UILabel!
    @IBOutlet weak var lbluseraddress: UILabel!
    @IBOutlet weak var mainview: UIView!
    @IBOutlet weak var lblBillingAddress: UILabel!
    @IBOutlet weak var lblbillingEmail: UILabel!
    @IBOutlet weak var lblbilingName: UILabel!
    @IBOutlet weak var lblbillingPhone: UILabel!
    
    @IBOutlet weak var lblshiping: UILabel!
    
    @IBOutlet weak var bntOk: UIButton!
    @IBOutlet weak var lblshippingname: UILabel!
    
    @IBOutlet weak var lblshippingAddress: UILabel!
    @IBOutlet weak var lblshippingEmail: UILabel!
    @IBOutlet weak var lblshippingphone: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.bntOk.setRoundbutton()
        self.mainview.setcornerUiview(Corner: 5)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.useraddress()
        lbluseraddress.text = "User Address".localized
        lblbilladdress.text = "Billing Address:".localized
        lblshiping.text = "Shipping Address:".localized
        bntOk.setTitle("OK".localized, for: .normal)
    }
    
    
    func useraddress(){
       
        let addresses = AppUserDefault.shared.UserInfoAddresses
        
        if addresses.count ==  1  {
            let billing = addresses[0]
            let fullname = billing.firstName ?? "" + billing.lastName!
            self.lblbilingName.text = fullname
            self.lblbillingEmail.text = billing.email
            self.lblbillingPhone.text = billing.phone
            self.lblBillingAddress.text = billing.address1
        
            
          
            self.lblshippingname.text = fullname
            self.lblshippingEmail.text = billing.email
            self.lblshippingphone.text = billing.phone
            self.lblshippingAddress.text = billing.address1
            return
        }
        
   
       if addresses.count == 2{
        
            let billing = addresses[0]
            let fullname = billing.firstName ?? "" + billing.lastName!
            self.lblbilingName.text = fullname
            self.lblbillingEmail.text = billing.email
            self.lblbillingPhone.text = billing.phone
            self.lblBillingAddress.text = billing.address1
        
             let shipping = addresses[1]
             let fullnameshipping = shipping.firstName ?? "" + shipping.lastName!
            self.lblshippingname.text = fullnameshipping
            self.lblshippingEmail.text = shipping.email
            self.lblshippingphone.text = shipping.phone
            self.lblshippingAddress.text = shipping.address1
        }
       
        
        
    }
    @IBAction func okAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dismisAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
