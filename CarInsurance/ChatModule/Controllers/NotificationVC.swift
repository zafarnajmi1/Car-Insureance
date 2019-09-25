//
//  NotificationVC.swift
//  CarInsurance
//
//  Created by apple on 8/28/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import ObjectMapper
import BadgeHub
import DZNEmptyDataSet
class NotificationVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //MARK:-  properties
    var isComeFromCompanyMenu = false
    var page = 1
    var totalPage = 0
    var notificationList = [NotificationModel]()
  
    let socket = SocketIOManager.sharedInstance.getSocket()
    
    var selectedIndepath: IndexPath!
    
    fileprivate func setupDelegates(){
        self.tableView.emptyDataSetSource = self as DZNEmptyDataSetSource
        self.tableView.emptyDataSetDelegate = self as DZNEmptyDataSetDelegate
        self.tableView.tableFooterView = UIView()
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        addMenuBackButton()
        setNavigationBar()
        self.navigationItem.title = "Notifications".localized
       // setupView()
        notificationSocket()
        
        
    }
    
    override func onMenuBackButtonClciked() {
        if isComeFromCompanyMenu {
            AppDelegate.appDelegate.moveToHome()
        }
        else {
            self.navigationController?.popViewController(animated: true)
        }
    }

    func deleteAllNavigtionButton() {
        let deleteBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
       // deleteBtn.backgroundColor = .red
        deleteBtn.setImage(UIImage(named: "Delete"), for: .normal)
        deleteBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)

        deleteBtn.addTarget(self, action: #selector(deleteBtnTapped(_:)), for: .touchUpInside)
        let deleteAllBarButton = UIBarButtonItem(customView: deleteBtn)
        self.navigationItem.setRightBarButtonItems([deleteAllBarButton], animated: true)
     }
    
    @objc func deleteBtnTapped (_ sender: Any){
        
        let guest = UserDefaults.standard.value(forKey: "Guest")
        
        if guest != nil {
            self.guestAlert()
        }
        else{
            let msg = "Do you want to remove all notification?".localized
            self.alertConfirmation(title: "Notification".localized, message: msg, yes: {
                self.removeAllNotification()
            }, no: nil)
        
        }
     }
 
}


extension NotificationVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell") as! NotificationCell
    
        let model = notificationList[indexPath.row]
        cell.delegate = self
        cell.setData(model: model)
        
        return cell
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if (tableView.contentOffset.y + tableView.frame.size.height) >= tableView.contentSize.height - 10 {
            
            if self.page <= self.totalPage {
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
                let dic = ["page": self.page] as [String: Any]
                socket.emit("notificationsList", dic)
            }
            
        }
    }
    
    
}

 //MARK:-  notificationCell actions delegate
extension NotificationVC: NotificationCellDelegate {
    func buttonDidTapped(notification: NotificationModel?) {
        guard  let model = notification else { return }
        if let indexOfB = notificationList.firstIndex(of: model) {
            
            let msg = "Do you want to remove this notification?".localized
            self.alertConfirmation(title: "Notification".localized, message: msg, yes: {
                self.removeNotification(index: indexOfB)
            }, no: nil)
            
            
        }
       
    }
    
    
}


//MARK:- selected row Events Tableveiew delegate
extension NotificationVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let model = notificationList[indexPath.row]
      didSelectEvent(notification: model)
        //self.seenAllNotifications()
    }
    
    func didSelectEvent(notification: NotificationModel)  {
        
        //        Notification Keys (Save This for later use)
        //        ----------------------
        //        1- QUOTE_REQUEST (Open Screen ?)
        //        2- ASSIGNED_COMPANY (Open Screen ?)
        //        3- UNASSIGNED_COMPANY (Open Screen ?)
        //        4- QUOTE_RESPONSE (Open Screen ?)
        //        5- QUOTE_ACCEPT (Open Screen ?)
        //        6- POLICY_FILE (Open Screen ?)
        //        7- OPEN_CONVERSATION (Open Screen ?)
         print(notification.action ?? "")
        if notification.action == "QUOTE_REQUEST"  {
            
            self.moveToVCUserQoutationDetail(id: notification.extras?.order?.id ?? "")
            return
        }

        if notification.action == "ASSIGNED_COMPANY"  {
            
            self.moveToVCUserQoutationDetail(id: notification.extras?.order?.id ?? "")
            
            return
        }
        
        if notification.action == "UNASSIGNED_COMPANY"  {
            // moveToStoreOrderDetail(object: notification)
            return
        }
        
        if notification.action == "QUOTE_RESPONSE"  {
            
            self.moveToVCQuotationDetail(id: notification.extras?.order?.id ?? "" )
            return
        }
        
        if notification.action == "QUOTE_ACCEPT"  {
             self.moveToQuotationLinks(id: notification.extras?.order?.id ?? "")
            return
        }
        if notification.action == "POLICY_FILE"  {
            self.moveToQuotationLinks(id: notification.extras?.order?.id ?? "")
            return
        }
        
        if notification.action == "OPEN_CONVERSATION" {
            moveToChatVC()
            return
        }
        
    }
    
    
    
    
    
    
    
    
    //common method in convesation
    func moveToChatVC() {
        let storyboard = UIStoryboard(name: "Chat", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
         vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveToVCUserQoutationDetail(id: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCUserQoutationDetail") as! VCUserQoutationDetail
        vc.orderid = id
        if ( AppUserDefault.shared.accountType == "5d08c0d814068021482f9d2d"){
            vc.isfromcompanySent = true
        }else{
            vc.isfromcompanySent = false
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func moveToQuotationLinks(id: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCQuotationLinks") as! VCQuotationLinks
        vc.orderid = id
       
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveToVCQuotationDetail(id: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCQuotationDetail") as! VCQuotationDetail
        vc.order = id
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK:-  socket Implementation

extension NotificationVC {
    
    func notificationSocket(){
        
        
        getUnseenNotificationCount { (count) in
            print("unseeenNotificationCount:\(count)")
        }
        
        
        let dic = ["page": self.page] as [String: Any]
        socket.emit("notificationsList",dic)
       
    
         showLoader()
        socket.once("notificationsList"){(data, ack)in
           // self.tableView.stopLoader()
            AppUserDefault.shared.unseenNotification = 0
          
            //MARK:- StopProccessHere
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
             hidLoader()
         //   ProgressHUD.dismiss(animated: true)
            
            
            
            let modified = data[0] as AnyObject
            
            if let obj =  Mapper<NotificationAPIResponse>().map(JSONObject: modified) {
                
                
                if obj.success == true {
                    
                    self.totalPage = (obj.data?.pagination?.pages)!
                    
                    if self.page == 1 {
                        self.notificationList = (obj.data?.notifications)! // default list
                        self.page += 1
                    }
                    else {
                        
                        if self.page <= self.totalPage {
                            
                            self.page += 1 //increment in current page
                            
                            for model in (obj.data?.notifications)! {
                                self.notificationList.append(model)
                            }
                        }
                    }
                    
                      self.seenAllNotifications()
                    
                    if self.notificationList.count == 0{
                        self.setupDelegates()
                    }
//                    let count = obj.data?.unseenNotificationsCount ?? 0
//                    ShareData.sahreinfo.notificationsCount = count
//                    UIApplication.shared.applicationIconBadgeNumber = count
//                    if count == 0 {
//                        self.tabBarController?.increaseBadge(indexOfTab: 2, num: nil)
//                    }
//                    else {
//                        self.tabBarController?.increaseBadge(indexOfTab: 2, num: "\(count)")
//                    }
                    
                    
//
                    if self.notificationList.count == 0 {
                        self.navigationItem.rightBarButtonItems = nil;
                        self.tableView.reloadData()
                        //self.tableView.empty()

                    }
                    else {
                        self.deleteAllNavigtionButton()
                        self.tableView.reset()
                        self.tableView.reloadData()
                        print(self.notificationList.count)
                    }
                    
                  
                }
                else {
                    let msg = obj.message
                    self.alertMessage(message: msg ?? "Error", completionHandler: nil)
                }
            }
            
        }
        
    
        
        socket.on("newNotification"){(data , ack )in
            let dic = ["page": self.page] as [String: Any]
            self.socket.emit("notificationsList", dic)
            
        }
        socket.on("removeNotifications"){(data , ack)in
            
            let modified = data[0] as AnyObject
            let dictionary = modified as! [String: AnyObject]
            print(dictionary)
            
        }
        socket.on("notificationsChanged"){(data, ack)in
            let dic = ["page": self.page] as [String: Any]
            self.socket.emit("notificationsList",dic)
        }
        
        socket.on("unseenNotifications"){(data, ack)in
            let modified = data[0] as AnyObject
            guard let obj =  Mapper<NotificationAPIResponse>().map(JSONObject: modified) else { return }
            
            if let count = obj.data?.total {
                AppUserDefault.shared.notificationsCount = count
               
            }
        }
        
        
    }
    
    
    func seenAllNotifications() {
        
        let socket = SocketIOManager.sharedInstance.getSocket()
        
        
        let notificationIds = notificationList.compactMap({$0.id})
        let json = ["notifications":notificationIds ]
        
        #if DEBUG
        print(self.notificationList.count)
        print(notificationIds)
        print(json)
        #endif
        socket.emit("notificationsSeen", with: [json])
        
    }
    
    
    func removeNotification(index : Int) {
        
        let socket = SocketIOManager.sharedInstance.getSocket()
        
        var notificationIds = [String]()
        let notification = self.notificationList[index]
        notificationIds.append(notification.id!)
        let json = ["notifications": notificationIds]
        
        if(notificationIds.count > 0) {
            
            socket.emit("removeNotifications", with: [json])
            self.notificationList.remove(at: index)
            self.tableView.reset()
            self.tableView.reloadData()
        }
    }
    
    func removeAllNotification() {
        
        let socket = SocketIOManager.sharedInstance.getSocket()
        socket.emit("removeAllNotifications")
        
        self.notificationList.removeAll()
        self.tableView.reloadData()
        self.setupDelegates()
        //self.tableView.empty()
        self.navigationItem.rightBarButtonItems = nil;
        
    }
    
}

extension NotificationVC: DZNEmptyDataSetSource,DZNEmptyDataSetDelegate {
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "you have no notifications".localized
        let attribs = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 19),
            NSAttributedString.Key.foregroundColor: UIColor.darkGray
        ]
        
        return NSAttributedString(string: text, attributes: attribs)
    }
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControl.State) -> NSAttributedString! {
        let text = "Try Again!".localized
        let attribs = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5818647146, green: 0.8263530135, blue: 0.2647219598, alpha: 1)
            ] as [NSAttributedString.Key : Any] as [NSAttributedString.Key : Any]
        
        return NSAttributedString(string: text, attributes: attribs)
    }
    
    func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!){
        
        let guest = UserDefaults.standard.value(forKey: "Guest")
        
        if guest != nil {
            
            self.guestAlert()
            
            
            
        }else{
            self.notificationSocket()
        }
    }
    
    
    
    
}

func getUnseenNotificationCount(completion: @escaping (_ result: Int) -> Void) {
//    SocketIOManager.sharedInstance.startListeningCommonMethods()
    let socket = SocketIOManager.sharedInstance.getSocket()
   // socket.emit("unseenNotifications")
    socket.on("unseenNotifications"){(data, ack)in
        let modified = data[0] as AnyObject
        guard let obj =  Mapper<NotificationAPIResponse>().map(JSONObject: modified) else { return }
        
        if let count = obj.data?.total {
            AppUserDefault.shared.notificationsCount = count
           
            completion(count)
        }
    }
}



func notificationBadge(_ button: UIButton) {
    let hub = BadgeHub(view: button)
    hub.setCount(AppUserDefault.shared.notificationsCount ?? 0)
    hub.scaleCircleSize(by: 0.65)
   // hub.moveCircleBy(x: 5, y: -4 )
    hub.setCircleColor(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), label: .white)
 
}
