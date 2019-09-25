//
//  VCQuotationDetail.swift
//  CarInsurance
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

import  SDWebImage
import SKActivityIndicatorView
class VCQuotationDetail: UIViewController {
    
    @IBOutlet weak var lbldateHeading: UILabel!
    @IBOutlet weak var lbltotaolquots: UILabel!
    @IBOutlet weak var btndetail: UIButton!
    @IBOutlet weak var quotesDetailTable: UITableView!
    
    @IBOutlet weak var lbldate: UILabel!
    @IBOutlet weak var lblordernumber: UILabel!
    var quotationArray = [String]()
      var collectionarray = [QuotListCollection]()
    var qoutlistPagination:QuotListPagination?
     var orderid = ""
     var order = ""
    var checkbox:Bool = true
    var totalsectionrows = 0
    var totalValue = 0.0
    
    
    var topayplaybasic = 0.0
    var topayplayaddtionTotal = 0.0
    var topaypaltotal = ""
    var Topaypaladditional : [String] = []
    
    var QuotID = ""
    var headerCellIndex = 0
    var basicPriceCellIndex = 1
    var additionalServicesCellIndex = 2
    var totalPriceCellIndex = 3
    var refreshControl: UIRefreshControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        quotesDetailTable.sectionHeaderHeight = 5.0;
        quotesDetailTable.sectionFooterHeight = 5.0;
        
        self.quotesDetailTable.estimatedRowHeight = 80
        quotesDetailTable.rowHeight = UITableView.automaticDimension
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh".localized)
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        quotesDetailTable.addSubview(refreshControl)
       
        self.quotlistgetapicall()
        quotesDetailTable.separatorStyle = .none
        quotesDetailTable.register(UINib.init(nibName: "companyCell", bundle: nil), forCellReuseIdentifier: "companyCell")
        quotesDetailTable.register(UINib.init(nibName: "AdditionalServicesCell", bundle: nil), forCellReuseIdentifier: "AdditionalServicesCell")
        quotesDetailTable.register(UINib.init(nibName: "ReplacementCell", bundle: nil), forCellReuseIdentifier: "ReplacementCell")
        quotesDetailTable.register(UINib.init(nibName: "headerSectionView", bundle: nil), forCellReuseIdentifier: "headerSectionView")
        quotesDetailTable.register(UINib.init(nibName: "BuyNowCell", bundle: nil), forCellReuseIdentifier: "BuyNowCell")
        quotesDetailTable.register(UINib.init(nibName: "searvicesHeaderCell", bundle: nil), forCellReuseIdentifier: "searvicesHeaderCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Quotation Detail".localized
        self.setNavigationBar()
       self.addBackButton()
       btndetail.setTitle("Detail".localized, for: .normal)
        lbldateHeading.text = "Date:".localized
        self.btndetail.setcornerButton(Corner: 10)
    }

    var Pagenumber : Int {
        get {
            if let pageInfo = qoutlistPagination{
                return  (pageInfo.page ?? 1) + 1
            }
            else{
                return 1
            }
        }
        
    }
    var isLoadMore : Bool {
        get {
            if let pageInfo = qoutlistPagination{
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
        if  qoutlistPagination != nil{
            qoutlistPagination?.page = 0
        }
         quotlistgetapicall()
    }
    
    
    func quotlistgetapicall(){
        let dic : [String:Any] = ["order": self.order]
        SKActivityIndicator.show()
        self.isRequestSent = true
        userhandler.getquotlist(pagenumber: self.Pagenumber, parameter: dic as NSDictionary, Success: {(successresponse)in
            SKActivityIndicator.dismiss()
            if(successresponse.success!){
               self.refreshControl.endRefreshing()
                self.qoutlistPagination = successresponse.data?.pagination
                
                if self.qoutlistPagination?.page == 1 {
                     self.collectionarray = successresponse.data!.collection!
                }else{
                     self.collectionarray += successresponse.data!.collection!
                }
                
                self.orderid = (successresponse.data?.order!._id)!
                self.lblordernumber.text = "Order #".localized + "  \(successresponse.data?.order?.orderNumber ?? "")"
                self.lbltotaolquots.text = "Total Quotes Recieved:".localized + " \(successresponse.data?.order?.quotesCount ?? 0)"
                let string = successresponse.data?.order?.createdAt
                let dateFormatter = DateFormatter()
                let tempLocale = dateFormatter.locale // save locale temporarily
                dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                let date = dateFormatter.date(from: string!)!
                dateFormatter.dateFormat = "d MMM yyyy"//"dd-MM-yyyy"//"MMM d, yyyy" ; //"dd-MM-yyyy HH:mm:ss"
                dateFormatter.locale = tempLocale // reset the locale --> but no need here
                let dateString = dateFormatter.string(from: date)
                
                self.lbldate.text = "\(dateString)"
                print("EXACT_DATE : \(dateString)")
                
                self.quotesDetailTable.reloadData()
                
                
            }else{
                self.refreshControl.endRefreshing()
                SKActivityIndicator.dismiss()
                self.alertMessage(message: successresponse.message!, completionHandler: nil)
            }
            self.isRequestSent = false
        }, Falioure: {(error)in
            self.refreshControl.endRefreshing()
            SKActivityIndicator.dismiss()
            
            self.alertMessage(message: error.message, completionHandler: nil)
        })
    }
    
    
    @IBAction func DetailAction(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCUserQoutationDetail") as? VCUserQoutationDetail
        vc?.orderid = self.orderid
        vc?.orderNumber = self.lblordernumber.text
        vc?.orderDate = self.lbldate.text
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
}
extension VCQuotationDetail: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
       
        return self.collectionarray.count
    }
    
    private func tableView(tableView: UITableView,heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let collection = self.collectionarray[indexPath.section]
//        var totalRows = 0
//        let rows = collection.basicService?.questions?.count ?? 0
//        totalRows = totalRows + rows
//        let adRows =  collection.additionalServices!.count
//        totalRows = totalRows + adRows
//        totalRows = totalRows + 2
        
//        if(indexPath.row == 0){
//            return 120
//
//        }else if indexPath.row <=  (collection.basicService?.questions!.count)! {
//            return 60
//
//        }else if(indexPath.row <=  (collection.basicService?.questions!.count)! + 1 ) {
//
//            return 80
//        }else if (indexPath.row <= (collection.basicService?.questions!.count)! + 2  ){
//            return 90
//
//        }else if (indexPath.row <= collection.additionalServices!.count + (collection.basicService?.questions!.count)! + 1  ){
//
//            return 50
//        }else {
//
//            return 100
//        }
        
        
//
//
//
//
//        //if(indexPath.section == 0){
////
////            return 120
////        }else if(indexPath.section == 1){
////
////            return 60
////        } else if(indexPath.section == 2){
////
////            return 80
////
////        }else if(indexPath.section == 3){
////
////            return 60
////        } else if(indexPath.section == 4){
////
////            return 60
////
////        }else {
////            return 100
////        }
//////        if(indexPath.row == 6){
//////            return 80
//////        }else if(indexPath.row == 9){
//////            return 100
//////        }else{
//////           return 60
//////        }
        //}
    
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        let headerview = Bundle.main.loadNibNamed("headerSectionView", owner: self, options:nil)?.first as? headerSectionView
//        headerview?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        return headerview
//
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//
//            return 120
//
   // }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
      let collection = self.collectionarray[section]
//        var totalRows = 0
        let basicRows = collection.basicService?.questions?.count ?? 0
        let additionalRows = collection.additionalServices?.count ?? 0
//        basicPriceCellIndex = basicRows
//        additionalServicesCellIndex = basicRows + 1
//        totalPriceCellIndex = additionalServicesCellIndex + additionalRows
        return basicRows + additionalRows + 3
        
        
//            let rows = collection.basicService?.questions?.count ?? 0
//               totalRows = totalRows + rows
//            let adRows =  collection.additionalServices!.count
//             totalRows = totalRows + adRows
//             totalRows = totalRows + 4
//
//
//
//        return totalRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let collection = collectionarray[indexPath.section]

       
            if(indexPath.row == 0){
                //totalsectionrows = totalsectionrows + indexPath.row
                let cell = tableView.dequeueReusableCell(withIdentifier: "headerSectionView") as? headerSectionView
                cell?.selectionStyle = .none
                cell?.lblcompanyname.text = collection.company?.orgnizationTitle
                cell?.lblbasicservices.text = collection.basicService?.title
                cell?.companyimg.sd_imageIndicator = SDWebImageActivityIndicator.gray
                cell?.companyimg.sd_setImage(with: URL(string: collection.company!.image!), placeholderImage: UIImage(named: "SplashBg"))
                return cell!
            }
            else  if indexPath.row <=  (collection.basicService?.questions!.count)! - 1  {
                
               let inx = indexPath.row - 1
                print(inx)
                let cell = tableView.dequeueReusableCell(withIdentifier: "companyCell") as? companyCell
                cell?.selectionStyle = .none
                cell?.lblquestion.text = collection.basicService?.questions?[inx ].title
                if(collection.basicService?.questions?[inx].answer1 != nil){
                    cell?.lblanswer.text = collection.basicService?.questions?[inx].answer1
                }else{
                    cell?.lblanswer.text = collection.basicService?.questions?[inx].answer?.title
                }
                return cell ?? UITableViewCell()
                
            
            }else if(indexPath.row <=  (collection.basicService?.questions!.count)! ){
                
                let inx = indexPath.row - 1
                let cell = tableView.dequeueReusableCell(withIdentifier: "ReplacementCell") as? ReplacementCell
                    cell?.selectionStyle = .none
                
                cell?.lblquestion.text = collection.basicService?.questions?[inx ].title
                if(collection.basicService?.questions?[inx].answer1 != nil){
                    cell?.lblanswer.text = collection.basicService?.questions?[inx].answer1
                }else{
                    cell?.lblanswer.text = collection.basicService?.questions?[inx].answer?.title
                }
                
                if AppUserDefault.shared.currency == "usd"{
                  let somevalue = String(format:"%.2f",collection.basicAmount?.usd?.amount ?? 0)
                   cell?.lblprice.text = "\(collection.basicAmount?.usd?.symbol ?? "") \(somevalue)"
                }else{
                    //let somevalue = String(format:"%.2f",collection.basicAmount?.aed?.amount ?? 0)
                    cell?.lblprice.text = "\(collection.basicAmount?.aed?.symbol ?? "") \(collection.basicAmount?.aed?.amount ?? 0)"
                }
                    return cell!
                
                
            } else if (indexPath.row <= (collection.basicService?.questions!.count)! + 1  ){
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "searvicesHeaderCell") as? searvicesHeaderCell
                    cell?.selectionStyle = .none
                
                    return cell!
                
            }
            else if (indexPath.row <= collection.additionalServices!.count + (collection.basicService?.questions!.count)! + 1  ){
                
                let adinx = indexPath.row - (collection.basicService?.questions!.count)! - 2
                let cell = tableView.dequeueReusableCell(withIdentifier: "AdditionalServicesCell") as? AdditionalServicesCell
                
                cell?.loadcell(object: collection.additionalServices![adinx], Index: adinx, section: indexPath.section)
                   

                    cell?.selectionStyle = .none
                    cell?.delegate = self
                    return cell!
                
            }else{
                
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "BuyNowCell") as? BuyNowCell
                    cell?.selectionStyle = .none
                if myDefaultLanguage == .ar{
                   cell?.lbltotalPrice.textAlignment = .right
                }
                if AppUserDefault.shared.currency == "usd"{
                        let value =  String(format:"%.2f",collection.basicAmount?.usd?.amount ?? 0)
                        cell?.lbltotalPrice.text = "Total Price :".localized + " \(collection.basicAmount?.usd?.symbol ?? "") \(value)"
                   
                    
                    var totalValue  =  (collection.basicAmount?.usd!.amount)!
                    
                    for item in collection.additionalServices ?? []{
                        if item.isSelect {
                            
                            totalValue += item.charges?.usd?.amount ?? 0
                        }
                        
                    }
                    let total = String(format:"%.2f",totalValue)
                    cell?.lbltotalPrice.text =  "Total Price :".localized + "\(total)"
                    
                    
                    
                }else{
                    //let value =  String(format:"%.2f",collection.basicAmount?.aed?.amount ?? 0)
                    cell?.lbltotalPrice.text = "Total Price :".localized + "\(collection.basicAmount?.aed?.symbol ?? "") \(collection.basicAmount?.aed?.amount ?? 0)"
                    
                    
                    var totalValue  =  (collection.basicAmount?.aed!.amount)!
                    
                    for item in collection.additionalServices ?? []{
                        if item.isSelect {
                            
                            totalValue += item.charges?.aed?.amount ?? 0
                        }
                        
                    }
//                    let total = String(format:"%.2f",totalValue)
                    cell?.lbltotalPrice.text =  "Total Price :".localized + " \(totalValue)"
                   
                }
                
                
                
                
                 self.topaypaltotal = String(format:"%.2f",collection.basicAmount?.usd?.amount ?? 0)
                cell!.loadcellBuynow(getSetion: indexPath.section)
                cell?.delegete = self
                    return cell!
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if self.collectionarray.count != 0 {
            if indexPath.row == self.collectionarray.count - 1 && isLoadMore && !isRequestSent {
                
                self.quotlistgetapicall()
                
            }
            
        }
    }
    
}
extension VCQuotationDetail:aditionalservicesPrices{
    
    
    
    func myprices(object: QuotListAdditionalServices, Index: Int, section: Int) {
        
        
        let collection = collectionarray[section]
        //let additional =  collection.additionalServices?[Index]
//        self.QuotID = collection._id!
        
        let indexPath11 = IndexPath(row: collection.additionalServices!.count + (collection.basicService?.questions!.count)! + 2  , section: section)
        if let cell = quotesDetailTable.cellForRow(at: indexPath11) as? BuyNowCell{
            var basicvalue = (collection.basicAmount?.usd!.amount)!
            if AppUserDefault.shared.currency == "usd"{
            var totalValue  =  (collection.basicAmount?.usd!.amount)!
            
            for item in collection.additionalServices!{
                if item.isSelect {
                    
                    totalValue += item.charges?.usd?.amount ?? 0
                }
               
            }
            let total = String(format:"%.2f",totalValue)
            cell.lbltotalPrice.text =  "Total Price :".localized + " \(total)"
                
                
            }else{
                
                var totalValue  =  (collection.basicAmount?.aed!.amount)!
                
                for item in collection.additionalServices!{
                    if item.isSelect {
                        
                        totalValue += item.charges?.aed?.amount ?? 0
                    }
                    
                }
                
                cell.lbltotalPrice.text =  "Total Price :".localized + " \(totalValue)"
                
            }
            
            
            
            for item in collection.additionalServices!{
                if item.isSelect {
                    
                    basicvalue += item.charges?.usd?.amount ?? 0
                }
                
            }
            let total = String(format:"%.2f",basicvalue)
            self.topaypaltotal = "\(total)"
            
            
        }



    }




}
extension VCQuotationDetail: buynowProtocool{
   
    
    
    
    
    
    func buynow(cell: BuyNowCell,section: Int) {
        
        let storyboard =  UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCAddressForm") as? VCAddressForm
        vc?.QuotId = collectionarray[section]._id!
        vc?.selctedAdditional = self.Topaypaladditional
        vc?.totalAmoutn = "\(topaypaltotal)"
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
    func termscompny(cell: BuyNowCell,section: Int) {
        
        if(collectionarray[section].company?.termsCondition ?? "" == ""){
            self.alertMessage(message: "No Terms And Conditions Found Yet!", completionHandler: nil)
            
        }else{
        
        let storyboard =  UIStoryboard.init(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "VCCompanyTermsConditions") as?  VCCompanyTermsConditions//VCSendQuote
        vc?.terms = collectionarray[section].company!.termsCondition!
        self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    
}
