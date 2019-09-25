//
//  VCCompanyHome.swift
//  CarInsurance
//
//  Created by Apple on 8/2/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  SlideMenuControllerSwift
import  XLPagerTabStrip
import BadgeHub
class VCCompanyHome: ButtonBarPagerTabStripViewController {
    var notificationBadge : BadgeHub?
     let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var isfromQuotation: Bool = false
//      var delegate: LeftMenuProtocol?
    override func viewDidLoad() {
        
        settings.style.selectedBarHeight = 0 //line
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        settings.style.selectedBarVerticalAlignment = .middle
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .black
            oldCell?.contentView.backgroundColor = #colorLiteral(red: 0.9958658814, green: 1, blue: 0.9999271035, alpha: 1)
            oldCell?.label.font = UIFont.init(name: "JosefinSans-Regular", size: 18)
            newCell?.label.textColor = .white
            newCell?.contentView.backgroundColor =  #colorLiteral(red: 0.9333333333, green: 0.737254902, blue: 0.3960784314, alpha: 1)
            newCell?.label.font = UIFont.init(name: "JosefinSans-Regular", size: 18)
            if self.isfromQuotation == true{
                self.moveToViewController(at: 1)
            }
        }
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateNotificaitonCount), name: NSNotification.Name(rawValue: NOTIFICATIONS_UPDATED), object: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
     // self.slideMenuController()?.delegate = self
        self.setNavigationBar()
         self.navigationController?.navigationBar.isHidden = false;
         self.navigationItem.hidesBackButton = true
         self.addNavigationButton()
        
          self.addMenuButton()
        
         setNavigationBarItem()
        
        
        getUnseenNotificationCount { (count) in
            //refresh navigation button
            self.addNavigationButton()
        }
    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: NOTIFICATIONS_UPDATED), object: nil)
    }
    func addNavigationButton()
    {
        let btn1 = UIButton(frame: CGRect(x: 0, y: 0, width: 15, height: 16))
        btn1.setBackgroundImage(UIImage(named: "chat"), for: .normal)
        
        btn1.addTarget(self, action: #selector(btnmsgClick(_:)), for: .touchUpInside)
        let btnmsg = UIBarButtonItem(customView: btn1)
        self.navigationItem.setRightBarButtonItems([notificationButton(),btnmsg], animated: true)
        
    }
    @objc func btnmsgClick (_ sender: Any){
        let guest = UserDefaults.standard.value(forKey: "Guest")
        if guest != nil {
            self.guestAlert()
            
        }else{
            let storyboard = UIStoryboard(name: "Chat", bundle: nil)
            let vc =  storyboard.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    func notificationButton() -> UIBarButtonItem{
        let btn2 = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 30))
        btn2.setImage(UIImage(named: "notifi"), for: .normal)
        btn2.addTarget(self, action: #selector(moveToNotification), for: .touchUpInside)
        notificationBadge = BadgeHub(view: btn2)
        notificationBadge?.scaleCircleSize(by: 0.65)
        notificationBadge?.setCircleColor(#colorLiteral(red: 0.9568627451, green: 0.6352941176, blue: 0.2078431373, alpha: 1), label: nil)
        notificationBadge?.setCount(AppUserDefault.shared.unseenNotification)
        return  UIBarButtonItem(customView: btn2)
    }
    @objc func moveToNotification(){
        print("Moving to Notificaiton screen.")
        let storyboard = UIStoryboard(name: "Chat", bundle: nil)
        let vc =  storyboard.instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func updateNotificaitonCount(){
        notificationBadge?.setCount(AppUserDefault.shared.unseenNotification)
    }
    
    
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let child_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VCCompanyReceived") as? VCCompanyReceived
        let child_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VCCompanySent")  as? VCCompanySent
        let child_3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VCCompanyAccepted")  as? VCCompanyAccepted
        
        return [child_1!, child_2!,child_3!]
    }
    
    let buttonLeftMenu = UIButton (type: .custom)
    func addMenuButton() {
        let imageLeftmenu = UIImage(named: "WhiteMenu")
        let tintedLeftImage = imageLeftmenu?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        buttonLeftMenu.setImage(tintedLeftImage, for: .normal)
        buttonLeftMenu.tintColor = UIColor.white
        buttonLeftMenu.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        buttonLeftMenu.addTarget(self, action: #selector(actionLeftMenu(_:)), for: .touchUpInside)
        let item = UIBarButtonItem(customView: buttonLeftMenu)
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "Car Insurance".localized
        label.font = UIFont(name: "JosefinSans-SemiBold", size: 20)
        let labelitem = UIBarButtonItem.init(customView: label)
        self.navigationItem.setLeftBarButtonItems([item], animated: false)
    }
    
    
    @objc func actionLeftMenu (_ sender: Any){
       
            if myDefaultLanguage == .en {
                self.toggleLeft()
            }else {
                self.toggleRight()
                
            }
        
    }
    
    
    
//    func addNavigationButton()
//    {  //Search
//
//        let btn0 = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 30))
//        btn0.setImage(UIImage(named: "Search"), for: .normal)
//        btn0.addTarget(self, action: #selector(btnmsgSearch(_:)), for: .touchUpInside)
//        let btnsearch = UIBarButtonItem(customView: btn0)
//
//        let btn1 = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 30))
//        btn1.setImage(UIImage(named: "chat"), for: .normal)
//
//        btn1.addTarget(self, action: #selector(btnmsgClick(_:)), for: .touchUpInside)
//        let btnmsg = UIBarButtonItem(customView: btn1)
//
//
////        let btn2 = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 30))
////        btn2.setImage(UIImage(named: "notifi"), for: .normal)
////        notificationBadge(btn2)
////
////        btn2.addTarget(self, action: #selector(btnnotificationhClick(_:)), for: .touchUpInside)
////        let btnnotification = UIBarButtonItem(customView: btn2)
//
//
//        self.navigationItem.setRightBarButtonItems([btnnotification,btnmsg], animated: true)
//
//    }
    
    
    
    @objc func btnmsgSearch (_ sender: Any){
        
        let guest = UserDefaults.standard.value(forKey: "Guest")
        
        if guest != nil {
            
            self.guestAlert()
            
        }else{
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc =  storyboard.instantiateViewController(withIdentifier: "VCcompanyMenu") as! VCcompanyMenu
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    
//    @objc func btnmsgClick (_ sender: Any){
//
//        let guest = UserDefaults.standard.value(forKey: "Guest")
//
//        if guest != nil {
//
//            self.guestAlert()
//
//        }else{
//
//            let storyboard = UIStoryboard(name: "Chat", bundle: nil)
//            let vc =  storyboard.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
//            self.navigationController?.pushViewController(vc, animated: true)
//
//        }
//
//
//
//    }
//    
//    @objc func btnnotificationhClick (_ sender: Any){
//
//        let guest = UserDefaults.standard.value(forKey: "Guest")
//
//        if guest != nil {
//
//            self.guestAlert()
//
//        }else{
//
//            let storyboard = UIStoryboard(name: "Chat", bundle: nil)
//            let vc =  storyboard.instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
//
//
//    }
    
    
}
extension VCCompanyHome  : SlideMenuControllerDelegate {
    
    func leftWillOpen() {
        print("SlideMenuControllerDelegate: leftWillOpen")
    }
    
    func leftDidOpen() {
        print("SlideMenuControllerDelegate: leftDidOpen")
    }
    
    func leftWillClose() {
        print("SlideMenuControllerDelegate: leftWillClose")
    }
    
    func leftDidClose() {
        print("SlideMenuControllerDelegate: leftDidClose")
    }
    
    func rightWillOpen() {
        print("SlideMenuControllerDelegate: rightWillOpen")
    }
    
    func rightDidOpen() {
        print("SlideMenuControllerDelegate: rightDidOpen")
    }
    
    func rightWillClose() {
        print("SlideMenuControllerDelegate: rightWillClose")
    }
    
    func rightDidClose() {
        print("SlideMenuControllerDelegate: rightDidClose")
    }
}
