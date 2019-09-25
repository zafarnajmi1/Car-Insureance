//
//  VcProfile.swift
//  CarInsurance
//
//  Created by Apple on 7/8/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  NVActivityIndicatorView
import SDWebImage
import SKActivityIndicatorView

protocol VCProfileDelegate: class {
    func userProfile(user: getProfileData?)
    func updateUserImage(image: UIImage?)
}


class VcProfile: UIViewController, NVActivityIndicatorViewable {

    @IBOutlet weak var btnEditProfile: UIButton!
    @IBOutlet weak var lbluseraddress: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblgendertype: UILabel!
    @IBOutlet weak var lblgender: UILabel!
    @IBOutlet weak var lblphone: UILabel!
    @IBOutlet weak var lblphonenumber: UILabel!
    @IBOutlet weak var usermainView: UIView!
    @IBOutlet weak var lblusremail: UILabel!
    @IBOutlet weak var lblusername: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    //var delegate: LeftMenuProtocol?
    var profileDelegate: VCProfileDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Profile".localized
        
        self.setNavigationBar()
        self.setProfileView()
         self.addBackButton()

        if AppUserDefault.shared.userData == nil{
            self.requestToFetchProfile()
         }
        else{
             self.updateProfileUI()
        }
        
        
        lblphonenumber.text = "Phone no:".localized
        lblgender.text = "Gender:".localized
        lblAddress.text = "Address:".localized
        btnEditProfile.setTitle("Edit Profile".localized, for: .normal)
    }

  
    
    func setProfileView(){
        self.usermainView.setcornerUiviewchangeColorshadow(Corner:5)//setcornerUiviewchangeColor(Corner: 5)
        self.userImage.setRoundimage()
        self.btnEditProfile.setcornerButton(Corner: 10)
        
    }
    
    func updateProfileUI(){
        let path = AppUserDefault.shared.userData?.image?.resizeImage(width: 200, height: 200)
        self.userImage.setPath(string: path, "UserImage")
   
        self.lblusername.text = AppUserDefault.shared.userData?.fullName
        self.lblusremail.text =  AppUserDefault.shared.userData?.email
        self.lblgendertype.text = AppUserDefault.shared.userData?.gender?.capitalized
        self.lblphone.text = AppUserDefault.shared.userData?.phone
        self.lbluseraddress.text = AppUserDefault.shared.userData?.address
        
        //update delegate
        profileDelegate?.userProfile(user: AppUserDefault.shared.userData)
        profileDelegate?.updateUserImage(image: userImage.image)
        
    }
    
    //MARK:GetProfile
    func requestToFetchProfile(){
        SKActivityIndicator.show()
        userhandler.getUserProfile(Success: {(rootProfile)in
            SKActivityIndicator.dismiss()
            if(rootProfile.success!){
                AppUserDefault.shared.userData = rootProfile.data

                //let path = rootProfile.data?.image?.resizeImage(width: 200, height: 200)
                self.userImage.setPath(string: rootProfile.data?.image, "UserImage")
                
                self.profileDelegate?.userProfile(user: AppUserDefault.shared.userData)
                self.profileDelegate?.updateUserImage(image: self.userImage.image)
                
                self.lblusername.text = rootProfile.data?.fullName
                self.lblusremail.text =  rootProfile.data?.email
                self.lblgendertype.text = rootProfile.data?.gender?.capitalized
                self.lblphone.text = rootProfile.data?.phone
                self.lbluseraddress.text = rootProfile.data?.address
            }else{
                SKActivityIndicator.dismiss()
                self.alertMessage(message: rootProfile.message!, completionHandler: nil)
            }
            
        }, Falioure: {(error)in
            SKActivityIndicator.dismiss()
            self.alertMessage(message: error.message, completionHandler: nil)
            
        })
        
        
    }
    
    
    
    @IBAction func editProfileAction(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VcEditProfile") as! VcEditProfile
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
