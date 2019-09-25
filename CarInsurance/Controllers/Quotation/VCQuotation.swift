//
//  VCQuotation.swift
//  CarInsurance
//
//  Created by Apple on 7/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  XLPagerTabStrip
import BadgeHub
class VCQuotation: ButtonBarPagerTabStripViewController {

    @IBOutlet weak var collectionView: ButtonBarView!
    var notificationBadge : BadgeHub?
    var isfromorder : Bool = false
    override func viewDidLoad() {
        
        
        
        settings.style.selectedBarHeight = 0 //line
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        settings.style.selectedBarVerticalAlignment = .middle
        addNavigationButton()
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .black
            oldCell?.contentView.backgroundColor = #colorLiteral(red: 0.9958658814, green: 1, blue: 0.9999271035, alpha: 1)
            oldCell?.label.font = UIFont.init(name: "JosefinSans-Regular", size: 18)
            newCell?.label.textColor = .white
            newCell?.contentView.backgroundColor =  #colorLiteral(red: 0.9333333333, green: 0.737254902, blue: 0.3960784314, alpha: 1)
            newCell?.label.font = UIFont.init(name: "JosefinSans-Regular", size: 18)
            
        }
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateNotificaitonCount), name: NSNotification.Name(rawValue: NOTIFICATIONS_UPDATED), object: nil)
        
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
             vc.hidesBottomBarWhenPushed = true
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
         vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func updateNotificaitonCount(){
        notificationBadge?.setCount(AppUserDefault.shared.unseenNotification)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
        //tabBarController?.tabBar.items![1].title = "Quotations".localized
       
          self.navigationItem.title = "Car Insurance".localized
        self.setNavigationBar()
        
        buttonBarView.localized()
        self.collectionView.localized()
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VCPendingQuotes") as? VCPendingQuotes
        let child_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VCReceivedQuotes")  as? VCReceivedQuotes
         let child_3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VCAcceptedQuotes")  as? VCAcceptedQuotes
        
        return [child_1!, child_2!,child_3!]
    }
    

    

}
