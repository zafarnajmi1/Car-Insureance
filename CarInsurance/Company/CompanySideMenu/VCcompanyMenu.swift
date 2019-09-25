//
//  VCMenu.swift
//  CarInsurance
//
//  Created by Apple on 8/5/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  SlideMenuControllerSwift
import GoogleSignIn
import  FBSDKLoginKit
import  InstagramLogin
import  AlamofireImage
import SDWebImage

protocol LeftMenuProtocol : class {
    func changeViewController(_ menu: LeftMenu)
}
enum LeftMenu: Int {
    
    case profile
    case quotation
    case notifications
    case conversation
    case changepassword
    case logOut
}





class VCcompanyMenu: UIViewController,LeftMenuProtocol {
let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var menutableview: UITableView!
    @IBOutlet weak var userimag: UIImageView!
    
    @IBOutlet weak var lbluseremail: UILabel!
    @IBOutlet weak var lblusername: UILabel!
    
    var profileVC: UIViewController!
    var quotationVC: UIViewController!
    var notificationsVC: UIViewController!
    var conversationVC: UIViewController!
    var changepasswordVC: UIViewController!
    
    var imgArr = [UIImage(named: "profile-1"), UIImage(named: "quote"),UIImage(named: "notifi-1"),UIImage(named: "chat-2"),UIImage(named: "Settings-1"),UIImage(named: "logout-1")]
    
    var nameArr = ["Profile".localized, "Quotations".localized, "Notifications".localized,"Live Chat".localized, "Settings".localized,"Logout".localized]
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.userimag.setRoundimage()
        self.initializeVC()
    }
    override func viewWillAppear(_ animated: Bool) {
        
        
        if AppUserDefault.shared.userData != nil {
            updateMenuUI()
        }
        else{
            self.requestToFetchProfile()
        }
    }

    func updateMenuUI(){
        
      
        
        let compay = AppUserDefault.shared.userData
        let path = compay?.image?.resizeImage(width: 200, height: 200)
        self.userimag.setPath(string: path, "UserImage")
        self.lblusername.text = compay?.orgnizationTitle
        self.lbluseremail.text = compay?.email
        
        
    }
    //MARK:GetProfile
    func requestToFetchProfile(){
       
        userhandler.getUserProfile(Success: {(rootProfile)in
           
            if rootProfile.success ?? false {
                
                AppUserDefault.shared.userData = rootProfile.data
                self.updateMenuUI()
                
            }
            
        }, Falioure: {(error)in
           
           
            
        })
        
        
    }
    
    

    func initializeVC() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let prof = storyBoard.instantiateViewController(withIdentifier: "VCcompanyProfile") as! VCcompanyProfile
          AppUserDefault.shared.isUpdatedCompany = false
       
        self.profileVC = UINavigationController(rootViewController: prof)
        
        
        let book = storyBoard.instantiateViewController(withIdentifier: "VCCompanyHome") as! VCCompanyHome
        self.quotationVC = UINavigationController(rootViewController: book)
        let storyBoard2 = UIStoryboard(name: "Chat", bundle: nil)
        let security = storyBoard2.instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
        security.isComeFromCompanyMenu = true
        self.notificationsVC = UINavigationController(rootViewController: security)
        
        let conversation = storyBoard2.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
        conversation.isComeFromCompanyMenu = true
        self.conversationVC = UINavigationController(rootViewController: conversation)
        
        let favourite = storyBoard.instantiateViewController(withIdentifier: "VCSettings") as! VCSettings //VCChangePassword
        self.changepasswordVC = UINavigationController(rootViewController: favourite)
        
    }
    
    
    
    func changeViewController(_ menu: LeftMenu) {
        
        switch menu {
        case .profile:
            
           self.slideMenuController()?.changeMainViewController(self.profileVC, close: true)
            
        case .quotation:
            
            self.slideMenuController()?.changeMainViewController(self.quotationVC, close: true)
            
        case .notifications:
            
            self.slideMenuController()?.changeMainViewController(self.notificationsVC, close: true)
            
        case .conversation:
            
            self.slideMenuController()?.changeMainViewController(self.conversationVC, close: true)
            
        case .changepassword:
            
            self.slideMenuController()?.changeMainViewController(self.changepasswordVC, close: true)
            
        case .logOut:
            self.GoToLogout()
        default:
            break
        }
    }
    
    
    func GoToLogout()
    {
        
        
        let alert = UIAlertController(title: "Logout?".localized, message: "Do you want to Logout?".localized, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Cancel".localized, style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        alert.addAction(UIAlertAction(title: "Logout".localized,
                                      style: UIAlertAction.Style.destructive,
                                      handler: {(_: UIAlertAction!) in
                                        self.RequestToLogout()
                                        
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func RequestToLogout() {
        Spinner.start()
        userhandler.logout(response: { (response) in
            Spinner.stop()
            if response.success == true {
                self.LogOut()
            }
            else {
                self.alertMessage(message: response.message ?? "Something went wrong", completionHandler: nil)
            }
        }) { (error) in
            self.alertMessage(message: error.message, completionHandler: nil)
        }
    }
    
    
    
    func LogOut(){
        
        AppUserDefault.shared.removeAllObjects()
        
        let Googlelogin = GIDSignIn.sharedInstance()
        Googlelogin?.signOut()
        let loginmanger = LoginManager()
        loginmanger.logOut()
        appDelegate.moveTologInSignUp()
        
    }
    

}

extension VCcompanyMenu:UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellCompanyMenu") as? CellCompanyMenu
        cell?.selectionStyle  = .none
        cell?.lblmenuname.text = nameArr[indexPath.row]
        cell?.menuimag.image = imgArr[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         self.changeViewController(LeftMenu(rawValue: indexPath.row)!)
    }
    
    
    
}
