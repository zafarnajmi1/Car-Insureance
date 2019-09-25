//
//  VCMenu.swift
//  CarInsurance
//
//  Created by Apple on 7/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import GoogleSignIn
import  FBSDKLoginKit
import  InstagramLogin
import  AlamofireImage
 import SDWebImage
class VCMenu: BaseViewController {

    @IBOutlet weak var btngestLogin: UIButton!
    @IBOutlet weak var menuTable: UITableView!
    @IBOutlet weak var lbluseremail: UILabel!
    @IBOutlet weak var lblusername: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    struct MenuModel {
        var title:  String
        var menuimage:  UIImage
    }
    
    var menuArray = [MenuModel]()
    var guestArray = [MenuModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.setNavigationBar()
        addNavigationButton()
    }
    func addNavigationButton()
    {
        let btn1 = UIButton(frame: CGRect(x: 0, y: 0, width: 15, height: 16))
        btn1.setBackgroundImage(UIImage(named: "chat"), for: .normal)
        
        //        let btn1 = UIButton(type: .custom)
        //        btn1.setImage(UIImage(named: "chat"), for: .normal)
        //btn1.frame = CGRect(x: 10, y: 0, width: 40, height: 40)
        btn1.addTarget(self, action: #selector(btnmsgClick(_:)), for: .touchUpInside)
        let btnmsg = UIBarButtonItem(customView: btn1)
        
        //        let btn2 = UIButton(type: .custom)
        //        btn2.setImage(UIImage(named: "notifi"), for: .normal)
        //        btn2.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        //        let btn2 = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        //        btn2.setBackgroundImage(UIImage(named: "notifi"), for: .normal)
        //        btn2.addTarget(self, action: #selector(btnnotificationhClick(_:)), for: .touchUpInside)
        //        let btnnotification = UIBarButtonItem(customView: btn2)
        
        
        self.navigationItem.setRightBarButtonItems([notificationButton(),btnmsg], animated: true)
        
    }
    @objc func btnmsgClick (_ sender: Any){
        
        let guest = UserDefaults.standard.value(forKey: "Guest")
        
        if guest != nil {
            
            self.guestAlert()
            
        }else{
            
            let storyboard = UIStoryboard(name: "Chat", bundle: nil)
            let vc =  storyboard.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
             vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
        //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //        let vc =  storyboard.instantiateViewController(withIdentifier: "VCAddtoCart") as! VCAddtoCart
        //        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(true)
        
        //tabBarController?.tabBar.items![2].title = "Menu".localized
        
       self.navigationItem.title = "Car Insurance".localized
        self.userImage.setRoundimage()
        self.setupMenuHeader()
        if myDefaultLanguage == .ar{
             menuTable.semanticContentAttribute = .forceRightToLeft
        UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }else{
            menuTable.semanticContentAttribute = .forceLeftToRight
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
        AppLanguage.updateUIScreenDirection()
        self.view.localized()
        btngestLogin.setTitle("Login".localized, for: .normal)
        menuTable.reloadData()
    }

    
    
    func setupMenuHeader(){
        
        let guest = UserDefaults.standard.value(forKey: "Guest")
        if guest != nil {
            self.btngestLogin.isHidden  = false
            self.btngestLogin.setcornerButton(Corner: 10)
            self.lblusername.isHidden = true
            self.lbluseremail.isHidden = true
           self.setupGuestMenuList()
        }else{
            self.btngestLogin.isHidden  = true
            self.lblusername.isHidden = false
            self.lbluseremail.isHidden = false
            
            self.updateMenuUI()
            //self.requestToFetchProfile()
            self.setupCustomerMenuList()
            
        }
    }
    
    func setupCustomerMenuList(){
        
        self.menuArray.removeAll()
        
        self.menuArray.append(MenuModel(title: "Profile".localized, menuimage: UIImage(named: "Profile")!))
        self.menuArray.append(MenuModel(title: "Settings", menuimage: UIImage(named: "Settings")!))
        self.menuArray.append(MenuModel(title: "Terms And Conditions".localized, menuimage: UIImage(named: "TermsAndConditions")!))
        self.menuArray.append(MenuModel(title: "Privacy Policy".localized, menuimage: UIImage(named: "PrivacyPol8icy")!))
        self.menuArray.append(MenuModel(title: "About Us".localized, menuimage: UIImage(named: "AboutUs")!))
        
        
        if myDefaultLanguage == .ar {
            self.menuArray.append(MenuModel(title: "Contact Us".localized, menuimage: UIImage(named: "ContactUs-1")!))
            self.menuArray.append(MenuModel(title: "Logout".localized, menuimage: UIImage(named: "Logout")!))
        }else{
            self.menuArray.append(MenuModel(title: "Contact Us".localized, menuimage: UIImage(named: "ContactUs")!))
            self.menuArray.append(MenuModel(title: "Logout".localized, menuimage: UIImage(named: "Logout-3")!))
            
        }
        
    }
    
    func setupGuestMenuList(){
        
        self.guestArray.removeAll()
        
        
        self.guestArray.append(MenuModel(title: "Settings", menuimage: UIImage(named: "Settings")!))
        self.guestArray.append(MenuModel(title: "Terms And Conditions", menuimage: UIImage(named: "TermsAndConditions")!))
        self.guestArray.append(MenuModel(title: "Privacy Policy", menuimage: UIImage(named: "PrivacyPol8icy")!))
        self.guestArray.append(MenuModel(title: "About Us", menuimage: UIImage(named: "AboutUs")!))
        if myDefaultLanguage == .ar {
            self.guestArray.append(MenuModel(title: "Contact Us", menuimage: UIImage(named: "ContactUs-1")!))
        }else {
        self.guestArray.append(MenuModel(title: "Contact Us", menuimage: UIImage(named: "ContactUs")!))
        }
        
        
    }
    
    
    @IBAction func gestLoginAction(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCLoginORCreateAccount") as! VCLoginORCreateAccount
        vc.isComeFromHome = true
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    func updateMenuUI() {
        let user = AppUserDefault.shared.userData
        let path = user?.image?.resizeImage(width: 200, height: 200)
        self.userImage.setPath(string: path, "UserImage")
        
        
        self.lblusername.text = user?.fullName
        self.lbluseremail.text =  user?.email
    }
    
    
    
    func requestToFetchProfile(){

        userhandler.getUserProfile(Success: {(rootProfile)in
            if(rootProfile.success!){
              
                let path = rootProfile.data?.image?.resizeImage(width: 200, height: 200)
                self.userImage.setPath(string: path, "UserImage")
              
                
                self.lblusername.text = rootProfile.data?.fullName
                self.lbluseremail.text =  rootProfile.data?.email
                
            }else{
                self.alertMessage(message: rootProfile.message!, completionHandler: nil)
            }

        }, Falioure: {(error)in

            self.alertMessage(message: error.message, completionHandler: nil)

        })


    }
    
    
    
    
    
    
    

}

extension VCMenu: VCProfileDelegate {
    func updateUserImage(image: UIImage?) {
       // self.userImage.image = image
    }
    
    func userProfile(user: getProfileData?) {
        print("Dhillo Padhillo")
        let path = user?.image?.resizeImage(width: 200, height: 200)
        self.userImage.setPath(string: path, "UserImage")
        self.lblusername.text = user?.fullName ?? "Unkown"
        self.lbluseremail.text = user?.email ?? "---"
    }
    
    
}



extension  VCMenu: UITableViewDataSource, UITableViewDelegate{
    
    
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: .zero)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let guest = UserDefaults.standard.value(forKey: "Guest")
        if guest != nil{
            return self.guestArray.count
        }else{
           return self.menuArray.count
        
      }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMenu") as? cellMenu
        
        let guest = UserDefaults.standard.value(forKey: "Guest")
        if guest != nil{
            cell?.lblmenu.text = self.guestArray[indexPath.row].title.localized
            cell?.menuimag.image = self.guestArray[indexPath.row].menuimage
            
        }else{
                cell?.lblmenu.text = self.menuArray[indexPath.row].title.localized
                cell?.menuimag.image = self.menuArray[indexPath.row].menuimage
        }
        cell?.selectionStyle = .none
        return cell!
    }
    
   
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        
        let guest = UserDefaults.standard.value(forKey: "Guest")
        if guest != nil{
            
            switch index {
            case 0:
                self.MoveOnSettings()
                break
            case 1:
                self.MoveOnTermscondtions()
                break
            case 2:
                 self.MoveOnPrivayPolicy()
                break
            case 3:
                self.MoveOnaboutUs()
                break
            case 4:
               self.MoveOnaContactUs()
                break
           
            default:
                
                break
            }
            
            
        }else{
            switch index {
                case 0:
                    self.MoveOnProfile()
                break
                case 1:
                    self.MoveOnSettings()
                break
                case 2:
                    self.MoveOnTermscondtions()
                break
                case 3:
                    self.MoveOnPrivayPolicy()
                break
                case 4:
                    self.MoveOnaboutUs()
                break
                case 5:
                    self.MoveOnaContactUs()
                break
                default:
                    self.GoToLogout()
                   break
             }
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
                self.alertMessage(message: response.message ?? "Something went wrong".localized, completionHandler: nil)
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
        

    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCLoginORCreateAccount") as! VCLoginORCreateAccount
         vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)

         AppDelegate.appDelegate.moveTologInSignUp()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "VCLoginORCreateAccount") as! VCLoginORCreateAccount
//        
//        self.navigationController?.pushViewController(vc, animated: true)

        
    }
    
    func MoveOnProfile(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VcProfile") as! VcProfile
          AppUserDefault.shared.isUserupdate = false
          vc.profileDelegate = self
         vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func MoveOnSettings(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCSettings") as! VCSettings
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func MoveOnTermscondtions(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCTermsAndConditions") as! VCTermsAndConditions
         vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func MoveOnPrivayPolicy(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VcPrivacyPolicy") as! VcPrivacyPolicy
         vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func MoveOnaboutUs(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCAboutUs") as! VCAboutUs
         vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    func MoveOnaContactUs(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCContactUs") as! VCContactUs
         vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
}
