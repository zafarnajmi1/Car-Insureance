//
//  VCcompanyProfile.swift
//  CarInsurance
//
//  Created by Apple on 8/30/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  NVActivityIndicatorView
import SDWebImage
import SKActivityIndicatorView
class VCcompanyProfile: UIViewController, NVActivityIndicatorViewable {

    //MARK: Outlets
    var checkupdate: Bool = false
    @IBOutlet weak var companyimg: UIImageView!
    
    @IBOutlet weak var lblcompnayName: UILabel!
    @IBOutlet weak var lblcompanyemail: UILabel!
    @IBOutlet weak var lblphonenumber: UILabel!
    @IBOutlet weak var lblphone: UILabel!
    @IBOutlet weak var lblcompanyaddress: UILabel!
    @IBOutlet weak var lbladdress: UILabel!
    @IBOutlet weak var lblterms: UILabel!
    @IBOutlet weak var lbltermsAndConditons: UILabel!
    
    @IBOutlet weak var lbldetail: UILabel!
    @IBOutlet weak var lblcompanyDeatil: UILabel!
    
    @IBOutlet weak var mainUiview: UIView!
    
    @IBOutlet weak var btnedit: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile".localized
        
        
        addMenuBackButton()

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBar()
        setProfileView()
        
        if AppUserDefault.shared.userData != nil {
             updatedValue()
        }else{
            self.getcompanyProfileApiCall()
        }
        
        
        lblphone.text = "Phone no:".localized
        lbladdress.text = "Address:".localized
        lblterms.text = "Terms & Conditions".localized
        lbldetail.text = "Detail".localized
        btnedit.setTitle("Edit Profile".localized, for: .normal)
        
    }

    
    func setProfileView(){
        self.mainUiview.setcornerUiviewchangeColorshadow(Corner:5)//setcornerUiviewchangeColor(Corner: 5)
        self.companyimg.setRoundimage()
        self.btnedit.setcornerButton(Corner: 10)
        
    }
    
    
    func updatedValue(){
        
        let compay = AppUserDefault.shared.userData
        let path = compay?.image?.resizeImage(width: 200, height: 200)
        self.companyimg.setPath(string: path, "UserImage")
        
        
        self.lblcompnayName.text = AppUserDefault.shared.userData?.orgnizationTitle
        self.lblcompanyemail.text = AppUserDefault.shared.userData?.email
        self.lblcompanyaddress.text = AppUserDefault.shared.userData?.address
        self.lblphonenumber.text = AppUserDefault.shared.userData?.phone
        self.lblcompanyDeatil.text = AppUserDefault.shared.userData?.detail
        self.lbltermsAndConditons.text = AppUserDefault.shared.userData?.termsCondition
        
    }
    
    
    //MARK:GetProfile
    func getcompanyProfileApiCall(){
        SKActivityIndicator.show()
        userhandler.getUserProfile(Success: {(rootProfile)in
            SKActivityIndicator.dismiss()
            if(rootProfile.success!){
               
                AppUserDefault.shared.userData = rootProfile.data
               
                let compay = AppUserDefault.shared.userData
                let path = compay?.image?.resizeImage(width: 200, height: 200)
                self.companyimg.setPath(string: path, "UserImage")
                
                self.lblcompnayName.text = rootProfile.data?.orgnizationTitle
                self.lblcompanyemail.text = rootProfile.data?.email
                self.lblcompanyaddress.text = rootProfile.data?.address
                self.lblphonenumber.text = rootProfile.data?.phone
                self.lblcompanyDeatil.text = rootProfile.data?.detail
                self.lbltermsAndConditons.text = rootProfile.data?.termsCondition
            }else{
                SKActivityIndicator.dismiss()
                self.alertMessage(message: rootProfile.message!, completionHandler: nil)
            }
            
        }, Falioure: {(error)in
            SKActivityIndicator.dismiss()
            self.alertMessage(message: error.message, completionHandler: nil)
            
        })
        
        
    }
    
    
    @IBAction func editAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCEditCompanyProfile") as! VCEditCompanyProfile
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
