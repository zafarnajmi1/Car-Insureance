//
//  VCAcceptedQuotes.swift
//  CarInsurance
//
//  Created by Apple on 7/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  XLPagerTabStrip
import  NVActivityIndicatorView
import  DZNEmptyDataSet
import SKActivityIndicatorView
class VCAcceptedQuotes: UIViewController, IndicatorInfoProvider,NVActivityIndicatorViewable {
    
    var ordercollectionArray = [OrderFiltersCollection]()
    var orderDataPagination :OrderFiltersPagination?
    @IBOutlet weak var acceptedTablView: UITableView!
    var username = ""
    var datecreateAt = ""
   
    var refreshControl: UIRefreshControl!
    
    fileprivate func setupDelegates(){
        self.acceptedTablView.emptyDataSetSource = self as DZNEmptyDataSetSource
        self.acceptedTablView.emptyDataSetDelegate = self as DZNEmptyDataSetDelegate
        self.acceptedTablView.tableFooterView = UIView()
        self.acceptedTablView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh".localized)
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        acceptedTablView.addSubview(refreshControl)
        
        let guest = UserDefaults.standard.value(forKey: "Guest")
        
        if guest != nil {
            
            
            self.guestAlertForQuotes()
            self.setupDelegates()
            
        }else{
            
            self.GetOrderFiltersApiCall()
            
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        hidLoader()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.view.localized()
        acceptedTablView.localized()
        acceptedTablView.reloadData()
    }
    var Pagenumber : Int {
        get {
            if let pageInfo = orderDataPagination{
                return  (pageInfo.page ?? 1) + 1
            }
            else{
                return 1
            }
        }
        
    }
    var isLoadMore : Bool {
        get {
            if let pageInfo = orderDataPagination{
                if (pageInfo.page ?? 1) < (pageInfo.pages ?? 1){
                    return true
                }
                else{
                    return false
                }
                
            }
            else{
                return false
            }
        }
    }
    var isRequestSent = false
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Accepted".localized)
    
    }
    
    
    @objc func refresh(_ sender: Any) {
        
        let guest = UserDefaults.standard.value(forKey: "Guest")
        
        if guest != nil {
            
            self.refreshControl.endRefreshing()
            self.guestAlertForQuotes()
            
        }else{
            
            if  orderDataPagination != nil{
                orderDataPagination?.page = 0
            }
            GetOrderFiltersApiCall()
        }
    }
    
    //MARK: OrderFilterApi
    func GetOrderFiltersApiCall(){
        SKActivityIndicator.show()
         self.isRequestSent = true
        userhandler.ordersFilterGet(status: "accepted", pagenumber: Pagenumber , Success: {suucessRespons in
            SKActivityIndicator.dismiss()
            if(suucessRespons.success!){
                
                self.refreshControl.endRefreshing()
               
                self.orderDataPagination = suucessRespons.data?.pagination
                
                if self.orderDataPagination?.page == 1{
                    self.ordercollectionArray = suucessRespons.data?.collection ?? []
                }
                else {
                    self.ordercollectionArray.append(contentsOf: suucessRespons.data?.collection ?? [])
                }
                
                if(self.ordercollectionArray.count == 0){
                    self.setupDelegates()
                }
                
                self.acceptedTablView.reloadData()
            }else{
                SKActivityIndicator.dismiss()
                self.setupDelegates()
                self.alertMessage(message: suucessRespons.message!, completionHandler: nil)
            }
            
            self.isRequestSent = false
            
        }, Falioure: {error in
            
            SKActivityIndicator.dismiss()
            self.setupDelegates()
            self.alertMessage(message:error.message, completionHandler: nil)
        })
        
        
    }
    
    
}
extension VCAcceptedQuotes: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 140
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ordercollectionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "CellAccepted") as? CellAccepted
        
        
        cell?.lblorderNumber.text = "Order #".localized + " \(ordercollectionArray[indexPath.row].orderNumber ?? "0")"
        cell?.lbltotalcount.text = "\(self.ordercollectionArray[indexPath.row].quotesCount ?? 0)"
        //"2019-07-30T13:04:51.896Z"
        
        let string = self.ordercollectionArray[indexPath.row].createdAt
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: string!)!
        dateFormatter.dateFormat = "d MMM yyyy"//"dd-MM-yyyy"//"MMM d, yyyy" ; //"dd-MM-yyyy HH:mm:ss"
        dateFormatter.locale = tempLocale // reset the locale --> but no need here
        let dateString = dateFormatter.string(from: date)
        cell?.loadAcceptedCell()
        cell?.lblDate.text = "\(dateString)"
        print("EXACT_DATE : \(dateString)")
        
        
        cell?.delegate = self
        
        cell?.selectionStyle = .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCQuotationLinks") as? VCQuotationLinks
        let order = self.ordercollectionArray[indexPath.row]
         vc?.orderid = order._id ?? ""
         vc?.ordernumber = order.orderNumber ?? ""
        vc?.hidesBottomBarWhenPushed = true
      
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if self.ordercollectionArray.count != 0{
            if ((indexPath.row == self.ordercollectionArray.count - 1) && isLoadMore && !isRequestSent){
               
                GetOrderFiltersApiCall()
            }
        }
    }
    
}
extension VCAcceptedQuotes: DZNEmptyDataSetSource,DZNEmptyDataSetDelegate {
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "Sorry there is no data available".localized
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
            
            self.guestAlertForQuotes()
            
            
            
        }else{
            self.GetOrderFiltersApiCall()
        }
    }
    
    
    
    
}
extension VCAcceptedQuotes: acceptedProtocool{
    func myaccepted(cell: CellAccepted) {
        let indx = acceptedTablView.indexPath(for: cell)
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCQuotationLinks") as? VCQuotationLinks
        vc?.orderid = self.ordercollectionArray[indx?.row ?? 0]._id ?? ""
        vc?.ordernumber = self.ordercollectionArray[indx?.row ?? 0].orderNumber ?? ""
        vc?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    
}
