//
//  BaseViewController.swift
//  CarInsurance
//
//  Created by Asif Habib on 16/09/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import BadgeHub
class BaseViewController: UIViewController {
    var notificationBadge : BadgeHub?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateNotificaitonCount), name: NSNotification.Name(rawValue: NOTIFICATIONS_UPDATED), object: nil)

        // Do any additional setup after loading the view.
    }
    
    @objc func addNotificationButton() {
        //
        //        self.navigationItem.setHidesBackButton(true, animated:false)
        //your custom view for back image with custom size
        let view = UIView(frame: CGRect(x: 0, y: -5, width: 40, height: 40))
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        let notification = UIImage(named: "notification")
        imageView.image = notification
        view.addSubview(imageView)
        notificationBadge = BadgeHub(view: view)
        notificationBadge?.scaleCircleSize(by: 0.65)
        notificationBadge?.setCircleColor(#colorLiteral(red: 0.9568627451, green: 0.6352941176, blue: 0.2078431373, alpha: 1), label: nil)
        notificationBadge?.moveCircleBy(x: -3, y: 3)
        notificationBadge?.setCount(AppUserDefault.shared.unseenNotification)
        let backTap = UITapGestureRecognizer(target: self, action: #selector(moveToNotification))
        view.addGestureRecognizer(backTap)
        let rightBarButtonItem = UIBarButtonItem(customView: view)
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    func notificationButton() -> UIBarButtonItem{
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 30))
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 30))
//        let notification = UIImage(named: "notifi")
//        imageView.image = notification
//        view.addSubview(imageView)
        let btn2 = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 30))
        btn2.setImage(UIImage(named: "notifi"), for: .normal)
        btn2.addTarget(self, action: #selector(moveToNotification), for: .touchUpInside)
        notificationBadge = BadgeHub(view: btn2)
        notificationBadge?.scaleCircleSize(by: 0.65)
        notificationBadge?.setCircleColor(#colorLiteral(red: 0.9568627451, green: 0.6352941176, blue: 0.2078431373, alpha: 1), label: nil)
//        notificationBadge?.moveCircleBy(x: -6, y: 0)
        notificationBadge?.setCount(AppUserDefault.shared.unseenNotification)
//        let backTap = UITapGestureRecognizer(target: self, action: #selector(moveToNotification))
//        view.addGestureRecognizer(backTap)
        return  UIBarButtonItem(customView: btn2)
//        let rightBarButtonItem = UIBarButtonItem(customView: view)
        
    }
    @objc func moveToNotification(){
        
        
        let guest = UserDefaults.standard.value(forKey: "Guest")
        
        if guest != nil {
            
            self.guestAlert()
            
        }else{
        
        print("Moving to Notificaiton screen.")
        let storyboard = UIStoryboard(name: "Chat", bundle: nil)
        let vc =  storyboard.instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
         vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    @objc func updateNotificaitonCount(){
        notificationBadge?.setCount(AppUserDefault.shared.unseenNotification)
    }


}
