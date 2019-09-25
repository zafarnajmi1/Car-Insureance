//
//  VCLoginORCreateAccount.swift
//  CarInsurance
//
//  Created by Apple on 7/1/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit
import InstagramLogin

import SKActivityIndicatorView
class VCLoginORCreateAccount: UIViewController, UIWebViewDelegate {
    
    
    var instagramLogin: InstagramLoginViewController!
    var currentAccessTolken : String!
    var dataInstagram : String!
    
    var firstName = ""
    var lastName = ""
    var myEmail = ""
    var socialId = ""
    var myGender = ""
    var socialToken = ""
    
    var isComeFromHome = false
    
    @IBOutlet weak var pinkimg: UIImageView!
    @IBOutlet weak var regimg: UIImageView!
    @IBOutlet weak var blueimg: UIImageView!
    
    @IBOutlet weak var lblfbcon: UILabel!
    @IBOutlet weak var lblinstagram: UILabel!
    @IBOutlet weak var lblgmail: UILabel!
    @IBOutlet weak var lblfb: NSLayoutConstraint!
    @IBOutlet weak var lblor: UILabel!
    @IBOutlet weak var btnGuest: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnlogin: UIButton!
    
    struct instgramUrls {
        static let clientId = "1f9c7ef155194fe8b4d72d52fcf0e441"//"1a50df5f7e4a413b88059ece6c3de03f" //"42b51078b45b4e39b15674e24acfe423"
        static let redirectUri =  "https://www.projects.mytechnology.ae/car-insurance/"
        
        // static let clientScret = "54786ef7ce44467ba81408c1a9adf89d"
        static let authorization = "https://api.instagram.com/oauth/authorize/"
        static let scope = "likes+comments+relationships"
        
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
        
        
        self.tabBarController?.tabBar.isHidden = true
        
        self.navigationController?.navigationBar.isHidden =  false
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.delegate = self
    }
    

    override func viewWillAppear(_ animated: Bool) {
        self.setupView()
        self.setLoaclization()
    }
    
    func setLoaclization(){
        
        if myDefaultLanguage == .ar {
            pinkimg.image  = UIImage.init(named: "Pink-1")
            regimg.image  = UIImage.init(named: "Red-1")
            blueimg.image  = UIImage.init(named: "Blue-1")
        }
        else {
            
            pinkimg.image  = UIImage.init(named: "Pink")
            regimg.image  = UIImage.init(named: "Red")
            blueimg.image  = UIImage.init(named: "Blue")
        }
        
    }
    
    func setupView(){
        self.title = "Login or Create Account".localized
        //addBackButton()
        self.navigationItem.hidesBackButton = true
        
        self.btnGuest.setcornerButton(Corner: 10)
        self.btnlogin.setcornerButton(Corner: 10)
        self.btnRegister.setcornerButton(Corner: 10)
        
        if isComeFromHome {
            addBackButton()
        }
        
        
        lblfbcon.text = "Continue Login with facebook".localized
        lblgmail.text = "Continue Login with Google".localized
        lblinstagram.text = "Continue Login with Instagram".localized
         btnGuest.setTitle("Continue as Guest".localized, for: .normal)
        btnlogin.setTitle("Login".localized, for: .normal)
         btnRegister.setTitle("Register".localized, for: .normal)
        lblor.text = "OR".localized
    }
    
   
    
    
    @IBAction func ContinueAsGuest(_ sender: UIButton) {
        
        AppUserDefault.shared.removeAllObjects()
        guestUser()
       
    }
    
    
    func guestUser(){
        myDefaultAccount = .guest
        UserDefaults.standard.set(true, forKey: "Guest")
    
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "VCTabbarHome") as! VCTabbarHome
//        self.navigationController?.pushViewController(vc, animated: true)
        let delegate = UIApplication.shared.delegate as? AppDelegate
        delegate?.moveToUserHome()
    }
    
    
    
    
    @IBAction func loginAction(_ sender: UIButton) {
         UserDefaults.standard.set(nil, forKey: "Guest")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCLogin") as! VCLogin
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCRegister") as! VCRegister
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func loginwithFaceBook(_ sender: UIButton) {
        
        self.FaceBookBasicInfo()
    }
    
    
    func FaceBookBasicInfo(){
        UserDefaults.standard.set(nil, forKey: "Guest")
        let loginmanger = LoginManager()
        loginmanger.logIn(permissions:["email","public_profile"] , from: self){[weak self](success, error) in
            if error != nil
            {
                print(error?.localizedDescription ?? "You are not logedIn")
            }else if((success?.isCancelled)!){
                print("You have cancelled")
                
            }else if((success?.grantedPermissions.contains("email"))!){
                self?.FBLogin()
            }}
        
    }
    
    
    
    @IBAction func loginwithGmail(_ sender: UIButton) {
        
        self.gmailbasicInfo()
    }
    
    func gmailbasicInfo(){
        UserDefaults.standard.set(nil, forKey: "Guest")
        let Googlelogin = GIDSignIn.sharedInstance()
        Googlelogin?.signOut()
        Googlelogin?.shouldFetchBasicProfile = true
        Googlelogin?.scopes = ["profile", "email"]
        Googlelogin?.delegate = self
        Googlelogin?.presentingViewController = self
        Googlelogin?.signIn()
    }
    
    
    
    @IBAction func loginWithInstagram(_ sender: UIButton) {
        
        self.InstaGramLogin()
    }
    
    
    
    func InstaGramLogin(){
        
        
        UserDefaults.standard.set(nil, forKey: "Guest")
//        instagramLogin = InstagramLoginViewController(clientId: Constant.instgramUrls.clientId, redirectUri: Constant.instgramUrls.redirectUri )
//        instagramLogin.delegate = self
//        instagramLogin.scopes = [.all]
//        print(instagramLogin)
        
        instagramLogin = InstagramLoginViewController(clientId: instgramUrls.clientId, redirectUri: instgramUrls.redirectUri )
        instagramLogin.delegate = self
        instagramLogin.scopes = [.basic]
        print(instagramLogin)
        
        
        
        instagramLogin.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(dismissLoginViewController))
        instagramLogin.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshPage))
        
        present(UINavigationController(rootViewController: instagramLogin), animated: true)
        
        
    }
    
    
    
    @objc func dismissLoginViewController() {
        instagramLogin.dismiss(animated: true)
    }
    
    @objc func refreshPage() {
        instagramLogin.reloadPage()
    }
    
    
   
    func getInstagramUserData(){
        print("1")
        // https://api.instagram.com/v1/users/self/?access_token=ACCESS-TOKEN
        let urlString = "https://api.instagram.com/v1/users/self/?access_token=\(self.currentAccessTolken!)"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("error=\(error!)")
                return
            }
            print("response = \(response!)")
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString!)")
            let jsonText = responseString
            
            var dictonary:NSDictionary?
            
            if let data = jsonText?.data(using: String.Encoding.utf8) {
                
                do {
                    dictonary = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject] as NSDictionary?
                    
                    if let myDictionary = dictonary
                    {
                        print(" First name is: \(myDictionary["data"]!)")
                        if let dataData = myDictionary["data"] as? [String:Any]{
                            
                            self.myEmail = dataData["username"]! as! String
                            self.firstName = dataData["full_name"]! as! String
                            self.lastName = dataData["full_name"]! as! String
                            self.socialId = dataData["id"]! as! String
                            self.socialToken = self.currentAccessTolken
                            
                            self.instgramLogin(token: self.currentAccessTolken, id: self.socialId, authmethod:"instagram",instaemail: self.myEmail, instaFirstName: self.firstName, instaLastName: self.lastName)
                        }
                        
                    }
                } catch let error as NSError {
                    print(error)
                }
            }
            
        }
        task.resume()
    }
    /*AppUserDefault.shared.socialID = id
     AppUserDefault.shared.socialFiratName = instaFirstName
     AppUserDefault.shared.socialLastName = instaLastName
     AppUserDefault.shared.socialAccessToken = token
     AppUserDefault.shared.authmethod = authmethod
     AppUserDefault.shared.socialemail = instaemail
     AppUserDefault.shared.AutoLogin = true*/
    
    
    
    func instgramLogin(token: String, id: String, authmethod: String,instaemail: String, instaFirstName: String, instaLastName: String){
        
        
        let dic: [String: Any] = ["id": id, "accessToken": token, "authMethod": authmethod]
        
        print(dic)
        SKActivityIndicator.show()
        
        
        
        userhandler.UserLoginWithSocial(parameter:dic , Success: {(SuccessResponse)in
            SKActivityIndicator.dismiss()
            print(SuccessResponse.success!)
            if(SuccessResponse.success!){
                UserDefaults.standard.set(SuccessResponse.data?.authorization, forKey: "userAuthToken")
                
                
                AppUserDefault.shared.accountType = SuccessResponse.data?.accountType
                AppUserDefault.shared.token = SuccessResponse.data?.authorization
                AppUserDefault.shared.FirstName = SuccessResponse.data?.firstName
                AppUserDefault.shared.LastName = SuccessResponse.data?.lastName
                AppUserDefault.shared.authmethod = authmethod
                AppUserDefault.shared.Email = SuccessResponse.data?.email
                AppUserDefault.shared.AutoLogin = true
                AppUserDefault.shared.socialAccessToken = token
                AppUserDefault.shared.socialID = id
                //important
                AppUserDefault.shared.userData = SuccessResponse.data
                
//                AppUserDefault.sahreinfo.socialID = id
//                AppUserDefault.sahreinfo.socialFiratName = instaFirstName
//                AppUserDefault.sahreinfo.socialLastName = instaLastName
//                AppUserDefault.sahreinfo.socialAccessToken = token
//                AppUserDefault.sahreinfo.authmethod = authmethod
//                AppUserDefault.sahreinfo.socialemail = instaemail
//                AppUserDefault.sahreinfo.AutoLogin = true
                
                
                self.moveOnHome()
                
            }else{
                SKActivityIndicator.dismiss()
                
                AppUserDefault.shared.socialAccessToken = token
                AppUserDefault.shared.socialID = id
                self.moveOnSocialLogin(socialEmail: instaemail, accesstoken: token, socialID: id, socialfirstName: instaFirstName, socialLastName: instaLastName, authmethod: authmethod)
                
            }
            
        }, Falioure: {(error)in
            SKActivityIndicator.dismiss()
            
            self.alertMessage(message: error.message, completionHandler: nil)
        })
    }
    
    
    
    
    
}
extension VCLoginORCreateAccount: InstagramLoginViewControllerDelegate {
    
    func instagramLoginDidFinish(accessToken: String?, error: InstagramError?) {
        dismissLoginViewController()
        
        if accessToken != nil {
            
//            alertMessage(message: accessToken!, completionHandler: nil)//(title: "Successfully logged in! 👍", message: accessToken!)
            self.currentAccessTolken = accessToken!
            getInstagramUserData()
        } else {
            alertMessage(message:"\(error!.localizedDescription)" , completionHandler: nil)
        }
    }
    
    
    
    
    
    
    
}


extension VCLoginORCreateAccount{
    func FBLogin()
    {
        if(AccessToken.current != nil)
        {
    
            GraphRequest(graphPath: "/me", parameters: ["fields": "id, name, first_name, last_name, email, gender, picture.type(large)"]).start{(connection, result, error)in
                
                if(error != nil)
                {
                    print(error?.localizedDescription as Any,"Some thing is Wrong")
                }else
                {
                    let socialdict = result as! [String : AnyObject]
                    print(socialdict)
                    
        
                    let token = AccessToken.current?.tokenString ??  ""
                    let id = socialdict["id"] as! String
                    let email = socialdict["email"] as! String
                    let name = socialdict["name"] as! String
                    let firstname = socialdict["first_name"] as! String
                    let lastname = socialdict["last_name"] as! String
                    
                    
                    self.FaceBookLogin(token: token, id: id, authmethod: "facebook", fbemail: email, fbFirstName: name, FbLastName: lastname)
                
                   
                }
                
                
            }
            
            
        }
        
        
    }
    
    
    func FaceBookLogin(token: String, id: String, authmethod: String,fbemail: String, fbFirstName: String, FbLastName: String){
        
        
        let dic: [String: Any] = ["id": id, "accessToken": token, "authMethod": authmethod]
        
        print(dic)
        SKActivityIndicator.show()
        
        
        userhandler.UserLoginWithSocial(parameter:dic  , Success: {(SuccessResponse)in
            SKActivityIndicator.dismiss()
            print(SuccessResponse.success!)
            if(SuccessResponse.success!){
                
                UserDefaults.standard.set(SuccessResponse.data?.authorization, forKey: "userAuthToken")
                AppUserDefault.shared.accountType = SuccessResponse.data?.accountType
                AppUserDefault.shared.token = SuccessResponse.data?.authorization
                AppUserDefault.shared.FirstName = SuccessResponse.data?.firstName
                AppUserDefault.shared.LastName = SuccessResponse.data?.lastName
                AppUserDefault.shared.authmethod = authmethod
                AppUserDefault.shared.Email = SuccessResponse.data?.email
                AppUserDefault.shared.AutoLogin = true
                AppUserDefault.shared.socialAccessToken = token
                AppUserDefault.shared.socialID = id
                
                //Important
                 AppUserDefault.shared.userData = SuccessResponse.data
                
                
                self.moveOnHome()
                
            }else{
                SKActivityIndicator.dismiss()
                
                AppUserDefault.shared.socialAccessToken = token
                AppUserDefault.shared.socialID = id
                self.moveOnSocialLogin(socialEmail: fbemail, accesstoken: token, socialID: id, socialfirstName: fbFirstName, socialLastName: FbLastName, authmethod: authmethod)
                
            }
            
        }, Falioure: {(error)in
            SKActivityIndicator.dismiss()
            
            self.alertMessage(message: error.message, completionHandler: nil)
        })
    }
    
    
    
}


//GIDSignInUIDelegate
extension VCLoginORCreateAccount: GIDSignInDelegate{
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let error = error {
            print(error.localizedDescription)
        }else if(error == nil)
        {
            let accessToken = GIDSignIn.sharedInstance()?.currentUser.authentication.idToken
        
            self.gmailLogin(token: accessToken!, id: user.userID, authmethod: "google", user: user)
            
        }
    }
    
    
    
    func gmailLogin(token: String, id: String, authmethod: String, user:GIDGoogleUser){
        
        
        let dic:[String: Any] = ["id": user.userID ?? 0, "accessToken": token, "authMethod": authmethod]
        
        print(dic)
        SKActivityIndicator.show()

        
        userhandler.UserLoginWithSocial(parameter:dic  , Success: {(SuccessResponse)in
            SKActivityIndicator.dismiss()
            print(SuccessResponse.success!)
            if(SuccessResponse.success!){
                UserDefaults.standard.set(SuccessResponse.data?.authorization, forKey: "userAuthToken")
                AppUserDefault.shared.accountType = SuccessResponse.data?.accountType
                AppUserDefault.shared.token = SuccessResponse.data?.authorization
                AppUserDefault.shared.FirstName = SuccessResponse.data?.firstName
                AppUserDefault.shared.LastName = SuccessResponse.data?.lastName
                AppUserDefault.shared.authmethod = authmethod
                AppUserDefault.shared.Email = SuccessResponse.data?.email
                AppUserDefault.shared.AutoLogin = true
                AppUserDefault.shared.socialAccessToken = token
                AppUserDefault.shared.socialID = id
                //important
                AppUserDefault.shared.userData = SuccessResponse.data
                
                self.moveOnHome()
    
            }else{
                 SKActivityIndicator.dismiss()
                
                
                self.moveOnSocialLogin(socialEmail: user.profile.email, accesstoken: token, socialID: user.userID, socialfirstName: user.profile.name, socialLastName: user.profile.name, authmethod: authmethod)
                
            }
            
        }, Falioure: {(error)in
             SKActivityIndicator.dismiss()
            
            self.alertMessage(message: error.message, completionHandler: nil)
            })
    }
    
    
    
    func moveOnHome(){
        AppDelegate.appDelegate.moveToUserHome()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "VCTabbarHome") as! VCTabbarHome
//        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    func moveOnSocialLogin(socialEmail : String,accesstoken :String,socialID:String,socialfirstName: String,socialLastName : String,authmethod: String){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCSocialLogin") as! VCSocialLogin
        vc.accesstoken =  accesstoken
        vc.authmethod = authmethod
        vc.socialEmail = socialEmail
        vc.socialfirstName = socialfirstName
        vc.socialLastName = socialLastName
        vc.socialID = socialID
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    
    
}

