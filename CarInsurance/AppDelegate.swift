//
//  AppDelegate.swift
//  CarInsurance
//
//  Created by Apple on 7/1/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import CoreData
import GoogleSignIn
import FBSDKLoginKit
import SlideMenuControllerSwift
import  IQKeyboardManagerSwift
import  GooglePlaces
import GooglePlacePicker
import GoogleMaps
import UserNotifications
import Firebase
import FirebaseMessaging

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static var appDelegate : AppDelegate{
        get {
            return UIApplication.shared.delegate as! AppDelegate
        }
        
    }
    var window: UIWindow?

       let storyBoard = UIStoryboard.mainStoryboard
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
      
        
        //"AIzaSyB94MKwU5wRvADF2o9xioRSLp8Te1zUEDc"
        //"AIzaSyBnW1wbtDB6F5-mwXF_Y2uJ-m-_22ef-x8"
        GMSServices.provideAPIKey("AIzaSyBjEjCpCv1VfMc-BTh191xCd_omhTjJZDE")
        GMSPlacesClient.provideAPIKey("AIzaSyBjEjCpCv1VfMc-BTh191xCd_omhTjJZDE")
        
        IQKeyboardManager.shared.enable = true
        GIDSignIn.sharedInstance().clientID = "91823052794-ojg6dccme8uv0ktn93ekegf8v84ema18.apps.googleusercontent.com"
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        PayPalMobile.initializeWithClientIds(forEnvironments: [PayPalEnvironmentSandbox: "AR9DVJvSCQyaYqojNmNyjPaz14YM17PkPJ3KlyCbDfEOg4WYZAYctEF5s6Dxkxx-jVWva2xCXOXHWGvl"])
        
        UNUserNotificationCenter.current().requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in
            
            if granted {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
                
            }
            
        }
        if let saveLanguage = AppUserDefault.shared.saveLanguage{
            switch saveLanguage{
            case "ar":
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
             
                myDefaultLanguage = .ar
            default :
                
                
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                myDefaultLanguage = .en
            }
            
          
        }
        
        if let currentcurrency = AppUserDefault.shared.currency{
            switch currentcurrency {
            case "usd":
               AppUserDefault.shared.currency = "usd"
            default :
                
                 AppUserDefault.shared.currency = "aed"
            }
        }
        
        FirebaseApp.configure()
        let manager = PushNotificationManager()
        manager.registerForPushNotifications()
        
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let handled: Bool = ApplicationDelegate.shared.application(application, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation])
        
        //Mark:- GoogleSignin
        GIDSignIn.sharedInstance().handle(url)
        //GIDSignIn.sharedInstance().handle(url,sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,annotation: options[UIApplication.OpenURLOptionsKey.annotation])
        
        return handled
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceTokenString = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        //        let deviceTokenString = deviceToken.hexString
        print("Device Token:\(deviceTokenString)")
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    
    
    func moveToUserHome()
    {
        let tabbarVC = self.storyBoard.instantiateViewController(withIdentifier: "VCTabbarHome") as! VCTabbarHome
//        let nvc: UINavigationController = UINavigationController(rootViewController: logIN)

        self.window?.rootViewController = tabbarVC
        self.window?.makeKeyAndVisible()
    }
    
    func moveTologInSignUp()
    {
        let logIN = self.storyBoard.instantiateViewController(withIdentifier: "VCLoginORCreateAccount") as! VCLoginORCreateAccount
        let nvc: CANavController = CANavController(rootViewController: logIN)
        self.window?.rootViewController = nvc
        self.window?.makeKeyAndVisible()
    }
    
    func moveToHome() {
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "VCCompanyHome") as! VCCompanyHome
        
        var sideMenuController : ExSlideMenuController!
        
        let menuVC = storyboard.instantiateViewController(withIdentifier: "VCcompanyMenu") as! VCcompanyMenu
         let nvc: CANavController = CANavController(rootViewController: mainViewController)
        UINavigationBar.appearance().tintColor = UIColor(named: "689F38")
        
        if myDefaultLanguage == .ar{
            SlideMenuController().openRight()
            sideMenuController = ExSlideMenuController(mainViewController: nvc, rightMenuViewController: menuVC)
        }
        else{
              sideMenuController  = ExSlideMenuController(mainViewController:nvc, leftMenuViewController: menuVC)
        }
        sideMenuController.automaticallyAdjustsScrollViewInsets = true
        sideMenuController.delegate = mainViewController
        SlideMenuOptions.hideStatusBar = false
        self.window?.backgroundColor = UIColor(red: 236.0, green: 238.0, blue: 241.0, alpha: 1.0)
        self.window?.rootViewController = sideMenuController
        self.window?.makeKeyAndVisible()
        
//
//        let leftViewController = storyboard.instantiateViewController(withIdentifier: "VCcompanyMenu") as! VCcompanyMenu
//        let nvc: CANavController = CANavController(rootViewController: mainViewController)
//        UINavigationBar.appearance().tintColor = UIColor(named: "689F38")
//
//        slideMenuController.automaticallyAdjustsScrollViewInsets = true
//        slideMenuController.delegate = mainViewController
//        SlideMenuOptions.hideStatusBar = false
//        self.window?.backgroundColor = UIColor(red: 236.0, green: 238.0, blue: 241.0, alpha: 1.0)
//        self.window?.rootViewController = slideMenuController
//        self.window?.makeKeyAndVisible()
        
    }
//
    
    
    
    
    
    
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "CarInsurance")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
extension UIStoryboard {
    
    public static var mainStoryboard: UIStoryboard {
        let bundle = Bundle.main
        guard let name = bundle.object(forInfoDictionaryKey: "UIMainStoryboardFile") as? String else {
            return UIStoryboard()
        }
        return UIStoryboard(name: name, bundle: bundle)
    }
}
