//
//  VCCompanySent.swift
//  CarInsurance
//
//  Created by Apple on 8/2/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import  DZNEmptyDataSet
import SKActivityIndicatorView
class VCCompanySent: UIViewController,IndicatorInfoProvider {

    var ordercollectionArray = [OrderFiltersCollection]()
    @IBOutlet weak var companySentTableView: UITableView!
    var orderDataPagination :OrderFiltersPagination?
    var refreshControl: UIRefreshControl!
   
    override func viewDidLoad() {
        super.viewDidLoad()
       self.companyGetOrderDetail()
       navigationController?.isNavigationBarHidden = false
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh".localized)
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        companySentTableView.addSubview(refreshControl)
    }
    

    fileprivate func setupDelegates(){
        self.companySentTableView.emptyDataSetSource = self as DZNEmptyDataSetSource
        self.companySentTableView.emptyDataSetDelegate = self as DZNEmptyDataSetDelegate
        self.companySentTableView.tableFooterView = UIView()
        self.companySentTableView.reloadData()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Sent".localized)
        
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
    
    @objc func refresh(_ sender: Any) {
        if  orderDataPagination != nil{
            orderDataPagination?.page = 0
        }
        companyGetOrderDetail()
    }
    
    //MARK: OrderFilterApi
    func companyGetOrderDetail(){
        SKActivityIndicator.show()
         self.isRequestSent = true
        userhandler.ordersFilterGet(status: "sent", pagenumber: Pagenumber, Success: {suucessRespons in
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
                self.companySentTableView.reloadData()
            }else{
                self.refreshControl.endRefreshing()
                SKActivityIndicator.dismiss()
                self.setupDelegates()
                self.alertMessage(message: suucessRespons.message!, completionHandler: nil)
            }
            
             self.isRequestSent = false
            
        }, Falioure: {error in
            self.refreshControl.endRefreshing()
            SKActivityIndicator.dismiss()
            self.setupDelegates()
            self.alertMessage(message:error.message, completionHandler: nil)
        })
        
        
    }
    
    

}
extension VCCompanySent: UITableViewDelegate, UITableViewDataSource{
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
        let cell =  tableView.dequeueReusableCell(withIdentifier: "CellSentCompany") as? CellSentCompany
        
        
        cell?.lblOrdernumber.text = "Order #".localized + " \(ordercollectionArray[indexPath.row].orderNumber ?? "0")"
        cell?.lblCategoryname.text = self.ordercollectionArray[indexPath.row].category?.title
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
        
        cell?.lbldate.text = "\(dateString)"
        print("EXACT_DATE : \(dateString)")
        
        cell?.loadsentCell()
        cell?.delegate = self
        cell?.selectionStyle = .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if self.ordercollectionArray.count != 0{
            if ((indexPath.row == self.ordercollectionArray.count - 1) && isLoadMore && !isRequestSent){
                
                self.companyGetOrderDetail()
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard =  UIStoryboard.init(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "VCCompanySendQuotDetail") as?  VCCompanySendQuotDetail//VCSendQuote
        vc!.orderid = self.ordercollectionArray[indexPath.row]._id!
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
extension VCCompanySent: DZNEmptyDataSetSource,DZNEmptyDataSetDelegate {
    
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
        
        
        self.companyGetOrderDetail()
        
    }
    
    
    
    
}
extension VCCompanySent:  sentProtocool{
    func mysent(cell: CellSentCompany) {
        let indx = companySentTableView.indexPath(for: cell)
        
        let storyboard =  UIStoryboard.init(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "VCCompanySendQuotDetail") as?  VCCompanySendQuotDetail//VCSendQuote
        vc!.orderid = self.ordercollectionArray[indx?.row ?? 0]._id!
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
}
