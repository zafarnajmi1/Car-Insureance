//
//  VCAddressForm.swift
//  CarInsurance
//
//  Created by Apple on 8/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  DLRadioButton

import SKActivityIndicatorView
class VCAddressForm: UIViewController {

    @IBOutlet weak var lblselectpaymethd: UILabel!
    @IBOutlet weak var btnPaypal: DLRadioButton!
    @IBOutlet weak var btncashonDelivery: DLRadioButton!
    @IBOutlet weak var Viewcontarint: NSLayoutConstraint!
    //MARK:PiCkUp Address
    var checkbox: Bool = true
    var totalAmoutn = ""
    var selctedAdditional : [String] = []
    var QuotId = ""
    var paypalID = ""
    @IBOutlet weak var lblpickupaddress: UILabel!
    @IBOutlet weak var pickupfirsrNameView: UIView!
    @IBOutlet weak var lbltotalamount: UILabel!
    
    @IBOutlet weak var pickuplbllastname: UILabel!
    @IBOutlet weak var pickuplblFirstname: UILabel!
    @IBOutlet weak var txtpickupfirstname: UITextField!
    
    @IBOutlet weak var pickupLastNameView: UIView!
    @IBOutlet weak var txtpickLastname: UITextField!
    
    @IBOutlet weak var pickupLblPhonumber: UILabel!
    
    @IBOutlet weak var pickupphonumberView: UIView!
    
    @IBOutlet weak var txtpickupphonumber: UITextField!
    
    @IBOutlet weak var pickuplblemail: UILabel!
    
    @IBOutlet weak var pickupemailView: UIView!
    
    @IBOutlet weak var txtpickupemail: UITextField!
    
    @IBOutlet weak var pickuplblAddress1: UILabel!
    
    @IBOutlet weak var pickupaddress1View: UIView!
    
    @IBOutlet weak var txtpickupaddress1: UITextField!
    
    @IBOutlet weak var pickuplblAddress2: UILabel!
    @IBOutlet weak var pickupaddress2View: UIView!
    
    @IBOutlet weak var pickuplblzipcode: UILabel!
    
    @IBOutlet weak var txtpickupaddress2: UITextField!
    @IBOutlet weak var pickupzipcodeView: UIView!
    @IBOutlet weak var txtpickupzipcode: UITextField!
    
    //MARK: Ship To Diiferent Address
    
    @IBOutlet weak var lblshiptoDifferent: UILabel!
    
    @IBOutlet weak var checkboxim: UIImageView!
    
    @IBOutlet weak var shiplblfirstname: UILabel!
    
    @IBOutlet weak var shiplbllastname: UILabel!
    
    @IBOutlet weak var shipfirstnameView: UIView!
    
    @IBOutlet weak var txtshipFirsname: UITextField!
    
    @IBOutlet weak var shiplatnameview: UIView!
    
    @IBOutlet weak var txtshiplastname: UITextField!
    
    @IBOutlet weak var shiplblphonumber: UILabel!
    
    @IBOutlet weak var shipphonnumberView: UIView!
    
    @IBOutlet weak var txtshipphonenumber: UITextField!
    @IBOutlet weak var shiplblemail: UILabel!
    @IBOutlet weak var shipemailView: UIView!
    
    
    @IBOutlet weak var txtshipemail: UITextField!
    
    @IBOutlet weak var shiplbladdress1: UILabel!
    
    @IBOutlet weak var shipaddress1View: UIView!
    
    @IBOutlet weak var txtshipaddress1: UITextField!
    
    @IBOutlet weak var shiplbladdress2: UILabel!
    @IBOutlet weak var shipaddress2View: UIView!
    
    
    @IBOutlet weak var txtshipAddress2: UITextField!
    
    @IBOutlet weak var shiplblzipcode: UILabel!
    
    
    @IBOutlet weak var shipzipcodeView: UIView!
    
    @IBOutlet weak var txtshipzipcode: UITextField!
    
    @IBOutlet weak var btnplaceorder: UIButton!
    
    
    
    
    
    
    
    @IBOutlet weak var shippingView: UIView!
    var shippingflag: Bool = false
    
    
    //MARK:- PayPal
    var environment:String = PayPalEnvironmentSandbox {
        willSet(newEnvironment) {
            if (newEnvironment != environment) {
                PayPalMobile.preconnect(withEnvironment: newEnvironment)
            }
        }
    }
    var payPalConfig = PayPalConfiguration()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lbltotalamount.text = "$ \(totalAmoutn)"
       self.setViewAddressForm()
        print(self.selctedAdditional)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Addresses".localized
        self.setNavigationBar()
        self.addBackButton()
        self.billingAddress()
        btnPaypal.isSelected = true
        btncashonDelivery.isSelected = false
        PayPalMobile.preconnect(withEnvironment: environment)
        
        let tfs = [txtpickupemail,txtpickLastname,txtpickupzipcode,txtpickupaddress1,txtpickupaddress2,txtpickupfirstname,txtpickupphonumber,txtshipzipcode,txtshipemail,txtshipaddress1,txtshipAddress2,txtshipFirsname,txtshiplastname,txtshipphonenumber] as! [UITextField]
        AppLanguage.updateTextFieldsDirection(tfs)
        
        
        lblselectpaymethd.text = "Select Payment Option".localized
        btnPaypal.setTitle("Continue With Paypal".localized, for: .normal)
        btncashonDelivery.setTitle("Cash On Delivery".localized, for: .normal)
        lblpickupaddress.text = "Pickup Address".localized
        lblshiptoDifferent.text = "Ship To A Different Address?".localized
        
        pickuplblFirstname.text = "First Name".localized
        pickuplblemail.text = "Email".localized
        pickuplbllastname.text = "Last Name".localized
        pickupLblPhonumber.text = "Phone Number".localized
        pickuplblAddress1.text = "Address 1".localized
        pickuplblAddress2.text = "Address2".localized
        pickuplblzipcode.text = "Postcode / Zip".localized
        
        shiplblfirstname.text = "First Name".localized
        shiplblemail.text = "Email".localized
        shiplbllastname.text = "Last Name".localized
        shiplblphonumber.text = "Phone Number".localized
        shiplbladdress1.text = "Address 1".localized
        shiplbladdress2.text = "Address2".localized
        shiplblzipcode.text = "Postcode / Zip".localized
        btnplaceorder.setTitle("Place Order".localized, for: .normal)
        btnplaceorder.setTitle("Place Order".localized, for: .normal)
    }
    
    func paypalConfig(){
        
        payPalConfig.acceptCreditCards = false
        payPalConfig.merchantName = "Cars Insurance"
        payPalConfig.merchantPrivacyPolicyURL = URL(string: "https://www.paypal.com/webapps/mpp/ua/privacy-full")
        payPalConfig.merchantUserAgreementURL = URL(string: "https://www.paypal.com/webapps/mpp/ua/useragreement-full")
        payPalConfig.languageOrLocale = Locale.preferredLanguages[0]
        payPalConfig.payPalShippingAddressOption = .payPal
        
        print("PayPal iOS SDK Version: \(PayPalMobile.libraryVersion())")
        
    }
    
    
    
    
    func setViewAddressForm(){
        
        self.Viewcontarint.priority = UILayoutPriority(rawValue: 750)
        self.shippingView.isHidden = true
        self.btnplaceorder.setcornerButton(Corner: 10)
        self.pickupemailView.setcornerUiview(Corner: 10)
        self.pickupzipcodeView.setcornerUiview(Corner: 10)
        self.pickupaddress1View.setcornerUiview(Corner: 10)
        self.pickupaddress2View.setcornerUiview(Corner: 10)
        self.pickupLastNameView.setcornerUiview(Corner: 10)
        self.pickupfirsrNameView.setcornerUiview(Corner: 10)
        self.pickupphonumberView.setcornerUiview(Corner: 10)
        
        
        
        self.shipzipcodeView.setcornerUiview(Corner: 10)
        self.shiplatnameview.setcornerUiview(Corner: 10)
        self.shipaddress1View.setcornerUiview(Corner: 10)
        self.shipemailView.setcornerUiview(Corner: 10)
        self.shipaddress2View.setcornerUiview(Corner: 10)
        self.shipfirstnameView.setcornerUiview(Corner: 10)
        self.shipphonnumberView.setcornerUiview(Corner: 10)
    }
    
    
    
    func billingAddress(){
       if AppUserDefault.shared.addressList.count == 0 {
            print("user address not found")
            return
        }
       let addresses  = AppUserDefault.shared.addressList
        self.txtpickupemail.text = addresses[0].email
        self.txtpickLastname.text = addresses[0].lastName
        self.txtpickupfirstname.text = addresses[0].firstName
        self.txtpickupzipcode.text = addresses[0].postCode
        self.txtpickupphonumber.text = addresses[0].phone
        self.txtpickupaddress1.text = addresses[0].address1
        self.txtpickupaddress2.text = addresses[0].address2
        
        
    }
    
    
    

    @IBAction func shipAddressAction(_ sender: UIButton) {
        
        if (self.checkbox ==  true){
            
            self.checkbox = false
            self.shippingflag = true
            self.Viewcontarint.priority = UILayoutPriority(rawValue: 250)
            self.shippingView.isHidden = false
             self.checkboxim.image = UIImage.init(named: "GreenCheckBox")
            
            var addresses = AppUserDefault.shared.addressList
            if(addresses.count == 2){
               
                self.txtshipemail.text = addresses[1].email
                self.txtshiplastname.text = addresses[1].lastName
                self.txtshipFirsname.text = addresses[1].firstName
                self.txtshipzipcode.text = addresses[1].postCode
                self.txtshipphonenumber.text = addresses[1].phone
                self.txtshipaddress1.text = addresses[1].address1
                self.txtshipAddress2.text = addresses[1].address2
            }else{
                self.txtshipemail.text = ""
                self.txtshiplastname.text = ""
                self.txtshipFirsname.text = ""
                self.txtshipzipcode.text = ""
                self.txtshipphonenumber.text = ""
                self.txtshipaddress1.text = ""
                self.txtshipAddress2.text = ""
            }
            
            
            
        }else{
            
            self.checkbox = true
            self.shippingflag = false
            self.Viewcontarint.priority = UILayoutPriority(rawValue: 750)
            self.shippingView.isHidden = true
           self.checkboxim.image = UIImage.init(named: "Square")
            
            self.txtshipemail.text = ""
            self.txtshiplastname.text = ""
            self.txtshipFirsname.text = ""
            self.txtshipzipcode.text = ""
            self.txtshipphonenumber.text = ""
            self.txtshipaddress1.text = ""
            self.txtshipAddress2.text = ""
            
        }
        
    }
    
    
    func ischeck() -> Bool{
        
        if(self.txtpickupfirstname.text == ""){
            self.alertMessage(message: "Please Enter First Name".localized, completionHandler: nil)
            return false
        }else if((txtpickupfirstname.text!.count < 3) || (txtpickupfirstname.text!.count > 30) ){
            self.alertMessage(message: "Please Enter First Name 3 to 30 Characters".localized, completionHandler: nil)
            return false
        }else if(self.txtpickLastname.text == ""){
            self.alertMessage(message: "Please Enter Last Name".localized, completionHandler: nil)
            return false
        }else if((txtpickLastname.text!.count < 3) || (txtpickLastname.text!.count > 30) ){
            self.alertMessage(message: "Please Enter Last Name 3 to 30 Characters".localized, completionHandler: nil)
            return false
        }else if(self.txtpickupemail.text == ""){
            self.alertMessage(message: "Please Enter Email".localized, completionHandler: nil)
            return false
        }else if(self.txtpickupphonumber.text == ""){
            self.alertMessage(message: "Please Enter Phone Number".localized, completionHandler: nil)
            return false
        }else if(self.txtpickupaddress1.text == ""){
            self.alertMessage(message: "Please Enter Address 1".localized, completionHandler: nil)
            return false
        }else if(self.txtpickupaddress2.text == ""){
            self.alertMessage(message: "Please Enter Address 2".localized, completionHandler: nil)
            return false
        }else if(self.txtpickupzipcode.text == ""){
            self.alertMessage(message: "Please Enter Postal Code /Zip".localized, completionHandler: nil)
            return false
        }
        
        if shippingflag == true{
            
            
            if(self.txtshipFirsname.text == ""){
                self.alertMessage(message: "Please Enter First Name".localized, completionHandler: nil)
                return false
            }else if((txtshipFirsname.text!.count < 3) || (txtshipFirsname.text!.count > 30) ){
                self.alertMessage(message: "Please Enter First Name 3 to 30 Characters".localized, completionHandler: nil)
                return false
            }else if(self.txtshiplastname.text == ""){
                self.alertMessage(message: "Please Enter Last Name".localized, completionHandler: nil)
                return false
            }else if((txtshiplastname.text!.count < 3) || (txtshiplastname.text!.count > 30) ){
                self.alertMessage(message: "Please Enter Last Name 3 to 30 Characters".localized, completionHandler: nil)
                return false
            }else if(self.txtshipemail.text == ""){
                self.alertMessage(message: "Please Enter Email".localized, completionHandler: nil)
                return false
            }else if(self.txtshipphonenumber.text == ""){
                self.alertMessage(message: "Please Enter Phone Number".localized, completionHandler: nil)
                return false
            }else if(self.txtshipaddress1.text == ""){
                self.alertMessage(message: "Please Enter Address 1".localized, completionHandler: nil)
                return false
            }else if(self.txtshipAddress2.text == ""){
                self.alertMessage(message: "Please Enter Address 2".localized, completionHandler: nil)
                return false
            }else if(self.txtshipzipcode.text == ""){
                self.alertMessage(message: "Please Enter Postal Code /Zip".localized, completionHandler: nil)
                return false
            }
            
            
        }
        
        return true
        
    }
    
    func updateAddress(){
        
       
        var addressParms : [String: Any] = [:]
        
        
        let billing :[String: Any] = ["firstName": self.txtpickupfirstname.text!,
                                      "lastName":self.txtpickLastname.text!,
                                      "email":self.txtpickupemail.text!,
                                      "phone":self.txtpickupphonumber.text!,
                                      "address1":self.txtpickupaddress1.text!,
                                      "address2": self.txtpickupaddress2.text!,
                                      "postCode":self.txtpickupzipcode.text!,
                                      "addressType":"billing"]
        
        let shipping :[String:Any] = ["firstName": self.txtshipFirsname.text!,
                                      "lastName":self.txtshiplastname.text!,
                                      "email":self.txtshipemail.text!,
                                      "phone":self.txtshipphonenumber.text!,
                                      "address1":self.txtshipaddress1.text!,
                                      "address2": self.txtshipAddress2.text!,
                                      "postCode":self.txtshipzipcode.text!,
                                      "addressType":"shipping"]
        
        
        if(self.shippingflag ==  true){
            let dic : [String : Any] = ["addresses" : [billing, shipping]]
            addressParms = dic
        }else{
            let dic : [String : Any] = ["addresses" : [billing]]
             addressParms = dic
        }
        print(addressParms)
       
    
        //SKActivityIndicator.show()
        userhandler.usersaveaddress(parameter: addressParms as NSDictionary , Success: {(successrespnse)in
            //SKActivityIndicator.dismiss()
            if(successrespnse.success!){
                self.paymentMethod()
                //self.alertMessage(message: successrespnse.message!, completionHandler: nil)
            }else{
                 //SKActivityIndicator.dismiss()
                self.alertMessage(message: successrespnse.message!, completionHandler: nil)

            }
            
            
        }, Falioure: {(error)in
             //SKActivityIndicator.dismiss()
            self.alertMessage(message: error.message, completionHandler: nil)

            
        })
    }
    
    
    
    
    var checkDic :[String:Any] = [:]
    
    
    func paymentMethod(){
        
        if(btnPaypal.isSelected ==  true){
            self.paypal()
            
        }else{
            self.paypalID = ""
            self.checkout()
            
        }
        
        
        
    }
    
    func checkout(){
        
        
        if(self.paypalID != ""){
           let dic :[String : Any] = ["paymentId": paypalID, "quote":QuotId, "paymentMethod": "paypal", "selectedAdditionalServices": self.selctedAdditional]
            self.checkDic = dic
        }else{
            
            let dic :[String : Any] = ["quote":QuotId, "paymentMethod": "cash", "selectedAdditionalServices": self.selctedAdditional]
            self.checkDic = dic
        }
        SKActivityIndicator.show()
        userhandler.acceptedQuot(parameter: self.checkDic as NSDictionary, Success: {(successResponse)in
            SKActivityIndicator.dismiss()
            if(successResponse.success!){
                
                self.alertMessage(message: successResponse.message!, completionHandler: {
                     self.navigationController?.popViewController(animated: true)
//                    let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//                    let vc = storyboard.instantiateViewController(withIdentifier: "VCQuotation") as? VCQuotation
//                    vc?.isfromorder = true
//                    self.navigationController?.pushViewController(vc!, animated: true)
                })
            }else{
                SKActivityIndicator.dismiss()
                self.alertMessage(message: successResponse.message!, completionHandler: {
                    self.navigationController?.popViewController(animated: true)
                })
                
            }
            
        }, Falioure: {(error)in
             SKActivityIndicator.dismiss()
            self.alertMessage(message: error.message, completionHandler: {
                self.navigationController?.popViewController(animated: true)
            })
            
        })
        
        
        
    }
    
    
    
    
    
    
    
    
    func paypal(){
        
        var paypalItems = [PayPalItem]()
        //let quantity = cartList.compactMap({$0.quantity}).reduce(0, +)
        let totalProducts = selctedAdditional.count
        let name = "Toal Products: \(totalProducts)"
        let amount = self.totalAmoutn //String(format:"%.2f",self.totalAmoutn)
      
        
        let obj = PayPalItem(name: name,
                             withQuantity: 1,
                             withPrice:  NSDecimalNumber(string: amount),
                             withCurrency: "USD",
                             withSku: "Hip-0037")
        paypalItems.append(obj)
        
        
        
        
        let subtotal = PayPalItem.totalPrice(forItems: paypalItems)
        let payment = PayPalPayment(amount: subtotal, currencyCode: "USD", shortDescription: "Total Amount", intent: .sale)
        payment.items = paypalItems
       
        if payment.processable {
            let paymentViewController = PayPalPaymentViewController(payment: payment, configuration: payPalConfig, delegate: self)
            present(paymentViewController!, animated: true, completion: nil)
        }
        else {
            self.alertMessage(message: "Payment not processalbe", completionHandler: nil)
            
        }
        
        
    }
    
    
    
    @IBAction func placeorderAction(_ sender: UIButton) {
        if ischeck(){
            
            self.updateAddress()
        }
        
    }
    
    
}
extension VCAddressForm :PayPalPaymentDelegate, PayPalProfileSharingDelegate{
    
    
    func payPalPaymentDidCancel(_ paymentViewController: PayPalPaymentViewController) {
        
        paymentViewController.dismiss(animated: true, completion: nil)
        
        self.alertMessage(message: "PayPal Payment Cancelled".localized, completionHandler: nil)
        
    }
    
    func payPalPaymentViewController(_ paymentViewController: PayPalPaymentViewController, didComplete completedPayment: PayPalPayment) {
        
        paymentViewController.dismiss(animated: true, completion: { () -> Void in
            
            // send completed confirmaion to your server
            print("Here is your proof of payment:\n\n\(completedPayment.confirmation)\n\nSend this to your server for confirmation and fulfillment.")
            
            let paymentResultDic = completedPayment.confirmation as NSDictionary
            
            let dicResponse: AnyObject? = paymentResultDic.object(forKey: "response") as AnyObject?
            let payauid:String = dicResponse!["id"] as! String
            let paystate:String = dicResponse!["state"] as! String
            self.paypalID = payauid
            self.checkout()
            print("id is  --->%@",payauid)
            print("paystate is ----->%@",paystate)
            
           
        })
        
    }
    
    func userDidCancel(_ profileSharingViewController: PayPalProfileSharingViewController) {
        
        self.alertMessage(message: "PayPal Profile Sharing Authorization Canceled", completionHandler: nil)
    }
    
    func payPalProfileSharingViewController(_ profileSharingViewController: PayPalProfileSharingViewController, userDidLogInWithAuthorization profileSharingAuthorization: [AnyHashable : Any]) {
        print("PayPal Profile Sharing Authorization Canceled")
    }
    
    
    
    
    
    
}
