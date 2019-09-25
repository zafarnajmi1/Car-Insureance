//
//  VCTabbarHome.swift
//  CarInsurance
//
//  Created by Apple on 7/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class VCTabbarHome: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    self.title = "Car Insurance".localized
    self.tabBarController?.tabBar.isHidden = false
        
   
    
    self.setviewtababr()
    self.setNavigationBar()
    
    getUnseenNotificationCount { (total) in
         self.setNavigationBar()
        
    }
    
    if myDefaultLanguage == .ar{
        
        UITableView.appearance().semanticContentAttribute = .forceRightToLeft
        UIView.appearance().semanticContentAttribute = .forceRightToLeft
    }else{
        
        UITableView.appearance().semanticContentAttribute = .forceLeftToRight
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
    }
    
 }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        tabBar.items?[0].title = "Home".localized
        tabBar.items?[1].title = "Quotations".localized
        tabBar.items?[2].title = "Menu".localized
    }

    
    func setviewtababr(){
        self.navigationController?.navigationBar.isHidden = false;
        self.navigationItem.hidesBackButton = true
        
        
        tabBar.selectionIndicatorImage = UIImage().createSelectionIndicator(color: #colorLiteral(red: 0.9333333333, green: 0.737254902, blue: 0.3960784314, alpha: 1), size: CGSize(width: tabBar.frame.width/CGFloat(tabBar.items!.count), height:  tabBar.frame.height), lineWidth: 3.0)
        
        tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        tabBar.layer.shadowOpacity = 0.5
        tabBar.layer.shadowOffset = CGSize.zero
        tabBar.layer.shadowRadius = 5
        self.tabBar.layer.borderColor = UIColor.clear.cgColor
        self.tabBar.layer.borderWidth = 0
        self.tabBar.clipsToBounds = false
        self.tabBar.backgroundColor = UIColor.white
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        
        // Set BackgroundColor
        UITabBar.appearance().backgroundImage = UIImage.colorForNavBar(color: .white)
        
        //Set Shadow Color
        
        UITabBar.appearance().shadowImage = UIImage.colorForNavBar(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) )
        
        guard let tabs = self.tabBar.items else {
            return
        }
        
        for tabbarItem in tabs {
            tabbarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: -5)
        }
        

        
//        self.tabBar.layer.masksToBounds = true
//        self.tabBar.isTranslucent = true
//        self.tabBar.barStyle = .blackOpaque
//        self.tabBar.layer.cornerRadius = 20
//        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
    }
    
//    func addNavigationButton()
//    {
//        let btn1 = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 30))
//        btn1.setImage(UIImage(named: "chat"), for: .normal)
//
////        let btn1 = UIButton(type: .custom)
////        btn1.setImage(UIImage(named: "chat"), for: .normal)
//        //btn1.frame = CGRect(x: 10, y: 0, width: 40, height: 40)
//        btn1.addTarget(self, action: #selector(btnmsgClick(_:)), for: .touchUpInside)
//        let btnmsg = UIBarButtonItem(customView: btn1)
//
////        let btn2 = UIButton(type: .custom)
////        btn2.setImage(UIImage(named: "notifi"), for: .normal)
////        btn2.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//        let btn2 = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 30))
//        btn2.setImage(UIImage(named: "notifi"), for: .normal)
//        btn2.addTarget(self, action: #selector(btnnotificationhClick(_:)), for: .touchUpInside)
//        let btnnotification = UIBarButtonItem(customView: btn2)
//        notificationBadge(btn2)
//
////        self.navigationItem.setRightBarButtonItems([btnnotification,btnmsg], animated: true)
//
//
////        NotificationCenter.default.addObserver(self, selector: #selector(updateNotificaitonCount), name: NSNotification.Name(rawValue: NOTIFICATIONS_UPDATED), object: nil)
//
//    }
//    @objc func updateNotificaitonCount(){
//        //        if AppSettings.shared.unseenNotification == 0{
//        //            badgeHub?.hideCount()
//        //        }
//        //        else{
////        notificationBadge.setCount(AppUserDefault.shared.unseenNotification)
//        //        }
//
//        //        badgeHub?.hideCount()
//    }
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
    
        
        
    }
    
    @objc func btnnotificationhClick (_ sender: Any){
        
        let guest = UserDefaults.standard.value(forKey: "Guest")
        
            if guest != nil {
        
              self.guestAlert()
        
            }else{
                
                let storyboard = UIStoryboard(name: "Chat", bundle: nil)
                let vc =  storyboard.instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
                
                self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    
    
    
    
}
extension UIImage {
    func createSelectionIndicator(color: UIColor, size: CGSize, lineWidth: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: size.height - lineWidth, width: size.width, height: lineWidth))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    
    class func colorForNavBar(color: UIColor) -> UIImage {
        //let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        
        let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 2.0, height: 2.0))
        
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        return image!
    }
    
}



