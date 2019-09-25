//
//  VCQuotationLinks.swift
//  CarInsurance
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

import  SKActivityIndicatorView
class VCQuotationLinks: UIViewController {

    @IBOutlet weak var lblinsurancelink: UILabel!
    
    @IBOutlet weak var insuranceArrowImage: UIImageView!
    @IBOutlet weak var QuotArrowImage: UIImageView!
    @IBOutlet weak var orderArrowimage: UIImageView!
    @IBOutlet weak var btnuserinfo: UIButton!
    @IBOutlet weak var insuranceLinkView: UIView!
    @IBOutlet weak var lblquotationlink: UILabel!
    @IBOutlet weak var quotationlinkView: UIView!
    @IBOutlet weak var lblorderlink: UILabel!
    @IBOutlet weak var oderlinkView: UIView!
    @IBOutlet weak var lbldate: UILabel!
    
    var cemeraimg = UIImagePickerController()
    var galleryimage = UIImagePickerController()
    
    @IBOutlet weak var btnuploadpolicypath: UIButton!
    @IBOutlet weak var lblusername: UILabel!
    var fromCompanyAccepted: Bool?
    var orderid = ""
    var ordernumber = ""
    var orderDate: String?
    
    var policypath = ""
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        if ( AppUserDefault.shared.accountType == "5d08c0d814068021482f9d2d"){
            self.addBackButton()

            self.btnuploadpolicypath.isHidden  =  true
        }else{
            self.addBackButton()
            self.btnuploadpolicypath.isHidden  =  false
        }
        
        self.btnuserinfo.setcornerButton(Corner: 10)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setQuotationLinkView()
        userorderdetailAPiCall()
        self.title = "Quotation #".localized + " \(ordernumber)"
        btnuserinfo.setTitle("User's Info".localized, for: .normal)
        lblorderlink.text = "Order Link".localized
        lblquotationlink.text = "Quotation Link".localized
        lblinsurancelink.text = "Insurance Policy Link".localized
        
        if myDefaultLanguage == .ar{
            orderArrowimage.image = UIImage.init(named: "OrangeWriteArrow-1")
            QuotArrowImage.image = UIImage.init(named: "OrangeWriteArrow-1")
            insuranceArrowImage.image = UIImage.init(named: "OrangeWriteArrow-1")
        }
        else
        {
            orderArrowimage.image = UIImage.init(named: "OrangeWriteArrow")
            QuotArrowImage.image = UIImage.init(named: "OrangeWriteArrow")
            insuranceArrowImage.image = UIImage.init(named: "OrangeWriteArrow")
            
        }
    }
    func setQuotationLinkView(){
        
        self.oderlinkView.cardViewUiview()
        self.quotationlinkView.cardViewUiview()
        self.insuranceLinkView.cardViewUiview()
        
        
    }
    func userorderdetailAPiCall(){
        print(self.orderid)
        let dic : [String:Any] = ["order": self.orderid]
       
        userhandler.userorderdetailget(parameter: dic as NSDictionary , Success: {(SuccessResponse)in
            if(SuccessResponse.success!){
                
                
                
                if ( AppUserDefault.shared.accountType == "5d08c0d814068021482f9d2d"){
                    
                     self.title = "Quotation #".localized + " \(SuccessResponse.data?.orderNumber ?? "")"
                    self.lblusername.text = SuccessResponse.data?.company?.orgnizationTitle
                    AppUserDefault.shared.UserInfoAddresses = SuccessResponse.data?.addresses ?? []
                    let string = SuccessResponse.data?.paymentDate
                    self.policypath = SuccessResponse.data!.policyPath ?? ""
                    let dateFormatter = DateFormatter()
                    let tempLocale = dateFormatter.locale // save locale temporarily
                    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                    let date = dateFormatter.date(from: string!)!
                    dateFormatter.dateFormat = "d MMM yyyy"//"dd-MM-yyyy"//"MMM d, yyyy" ; //"dd-MM-yyyy HH:mm:ss"
                    dateFormatter.locale = tempLocale // reset the locale --> but no need here
                    let dateString = dateFormatter.string(from: date)
                    self.orderDate = dateString
                    
                    self.lbldate.text = "Payment Date :".localized + " \(dateString)"
                    print("EXACT_DATE : \(dateString)")
                }else{
                    self.title = "Quotation #".localized + " \(SuccessResponse.data?.orderNumber ?? "")"
                    self.lblusername.text = SuccessResponse.data?.user?.fullName
                    AppUserDefault.shared.UserInfoAddresses = SuccessResponse.data?.addresses ?? []
                    let string = SuccessResponse.data?.createdAt                  
                    self.policypath = SuccessResponse.data!.policyPath ?? ""
                    let dateFormatter = DateFormatter()
                    let tempLocale = dateFormatter.locale // save locale temporarily
                    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                    let date = dateFormatter.date(from: string!)!
                    dateFormatter.dateFormat = "d MMM yyyy"//"dd-MM-yyyy"//"MMM d, yyyy" ; //"dd-MM-yyyy HH:mm:ss"
                    dateFormatter.locale = tempLocale // reset the locale --> but no need here
                    let dateString = dateFormatter.string(from: date)
                     self.orderDate = dateString
                    self.lbldate.text = "Data :".localized + " \(dateString)"
                    print("EXACT_DATE : \(dateString)")
                    
                }
                
                
                
            
                
                
            }else{
            
            }
        }, Falioure: {(errror)in
            
            
        })
        
    }
    
    
    @IBAction func orderlinkAction(_ sender: UIButton) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCUserQoutationDetail") as? VCUserQoutationDetail
        vc?.orderid = orderid
        vc?.orderNumber = "Order # \(ordernumber)"
        vc?.orderDate = self.orderDate
        if ( AppUserDefault.shared.accountType == "5d08c0d814068021482f9d2d"){
            
        }else{
            vc?.isfromcompanySent =   fromCompanyAccepted
            }
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func quotationlinkAction(_ sender: UIButton) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCAcceptedQuotDetail") as? VCAcceptedQuotDetail
        vc?.orderId = orderid
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func insuranceLinkAction(_ sender: UIButton) {
        if(self.policypath == ""){
            
            self.alertMessage(message: "No File Uploaded Yet".localized, completionHandler:nil)
            
        }else{
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VCInsurancePolicyImage") as! VCInsurancePolicyImage
            vc.policyPath = self.policypath
        vc.modalPresentationStyle = .currentContext
        vc.providesPresentationContextTransitionStyle = true
        vc.definesPresentationContext = true
        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
        vc.view.backgroundColor = UIColor.init(white: 1.0, alpha: 1.0)
        self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    
    @IBAction func usrinforAction(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VCUserInfoPOPUp") as! VCUserInfoPOPUp
        vc.modalPresentationStyle = .currentContext
        vc.providesPresentationContextTransitionStyle = true
        vc.definesPresentationContext = true
        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
        vc.view.backgroundColor = UIColor.init(white: 0.7, alpha: 0.8)
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    func PickImag()
    {
        let alert = UIAlertController(title: "Please Select an Option".localized, message: "", preferredStyle: .actionSheet)
        
        let Gallry = UIAlertAction(title: "Photo Library", style: .default){ (Picimg) in self.GalleryPic()
        }
        let camraimg = UIAlertAction(title: "Camera", style: .default){ (ac) in self.cemeraPic()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel){(action) in self.cancel()
            
        }
        
        alert.addAction(Gallry)
        alert.addAction(camraimg)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }
    func cancel()
    {
        self.galleryimage.dismiss(animated: true, completion: nil)
    }
    
    func cemeraPic()
    {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            cemeraimg.sourceType = .camera
            cemeraimg.delegate = self
            cemeraimg.allowsEditing = false
            present(cemeraimg, animated: true, completion: nil)
        }
        else {
            
            let alert = UIAlertController(title: "Camera".localized, message: "Camera is not available".localized, preferredStyle: .actionSheet)
            let alertaction = UIAlertAction(title: "Cancel".localized, style: .cancel)
            alert.addAction(alertaction)
            present(alert, animated: true, completion: nil)
            
        }
    }
    func GalleryPic()
    {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary))
        {
            galleryimage.delegate = self
            galleryimage.allowsEditing = false
            galleryimage.sourceType = UIImagePickerController.SourceType.photoLibrary
            present(galleryimage, animated: true, completion: nil)
            
        }else{
            
            print("Image is not Available")
            
        }
        
    }
    
    
    
    @IBAction func uploadPolicyPathAction(_ sender: UIButton) {
        
        self.PickImag()
        
    }
    
    
    //MARK: UploadPolicyPath
    func policyPathApiCall(Imgpath: String){
        let dic : [String: Any] = ["image": Imgpath, "order": orderid]
        userhandler.uploadPolicyPath(parameter: dic as NSDictionary , Success: {(SuccessResponce)in
            if(SuccessResponce.success!){
                self.userorderdetailAPiCall()
            }else{
                
            }
            
            
        }, Falioure: {(Error)in
            
            
            
        })
        
    }
    
    
}
extension VCQuotationLinks : UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let img =  (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
        
        
        
        
        SocketEventManager.shared.uploadImage(image: img) { [weak self] (result) in
            SKActivityIndicator.show()
            switch result {
                
            case .progress(let value):
                print(value)
            //self.progressLabel.text = "\(Int(value))%"
            case .path(let fileName):
                SKActivityIndicator.dismiss()
                print(fileName)
                self!.policyPathApiCall(Imgpath: fileName)
//                self!.socketImageUrl = fileName
            case .failure(let errorMsg):
                SKActivityIndicator.dismiss()
                self?.alertMessage(message: errorMsg, completionHandler: {
                    
                })
                
                
                
            }
            
        }
        
        
        dismiss(animated: true, completion: nil)
    }
    
    
}
