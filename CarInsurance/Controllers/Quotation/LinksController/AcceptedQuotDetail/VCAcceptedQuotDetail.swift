//
//  VCAcceptedQuotDetail.swift
//  CarInsurance
//
//  Created by Apple on 8/26/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

import SKActivityIndicatorView
class VCAcceptedQuotDetail: UIViewController {
     var orderId = ""
    @IBOutlet weak var accceptedtableView: UITableView!
    var acceptedDetail = [acceptedQuotDetailQuotes]()
    var totalValue = 0.0
    
    @IBOutlet weak var lblordernumber: UILabel!
    @IBOutlet weak var lbldate: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
         accceptedtableView.register(UINib.init(nibName: "acceptedBacisPriceCell", bundle: nil), forCellReuseIdentifier: "acceptedBacisPriceCell")
        
        accceptedtableView.register(UINib.init(nibName: "acceptedAdditionalTotaoPriceCell", bundle: nil), forCellReuseIdentifier: "acceptedAdditionalTotaoPriceCell")
        
        accceptedtableView.register(UINib.init(nibName: "acceptedadditionalServicesCell", bundle: nil), forCellReuseIdentifier: "acceptedadditionalServicesCell")
        
        accceptedtableView.register(UINib.init(nibName: "acceptedAdditionalHeaderCell", bundle: nil), forCellReuseIdentifier: "acceptedAdditionalHeaderCell")
        
        accceptedtableView.register(UINib.init(nibName: "acceptedBasicQuestionCell", bundle: nil), forCellReuseIdentifier: "acceptedBasicQuestionCell")
        
        accceptedtableView.register(UINib.init(nibName: "AcceptedbasicserviceHeaderCell", bundle: nil), forCellReuseIdentifier: "AcceptedbasicserviceHeaderCell")
        
        self.acceptedQuotetailApi()
          
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Accepted Quotation Detail".localized
        self.addBackButton()
//        if (myDefaultLanguage == .en){
//           
//        }
//        else{
//          addArabicBackButton()
//            
//        }
//        if ( ShareData.sahreinfo.accountType == "5d08c0d814068021482f9d2d"){
//            self.addBackButton()
//
//        }else{
//
//            addMenuBackButton()
//
//        }
    }
    
    
    func acceptedQuotetailApi(){
        let dic : [String:Any] = ["order": self.orderId]
        SKActivityIndicator.show()
        userhandler.acceptedQuotDetailGet(parameter: dic as NSDictionary, Success: {(SuccessRespons)in
            SKActivityIndicator.dismiss()
            if(SuccessRespons.success!){
                
                self.acceptedDetail = SuccessRespons.data!.quotes!
                
                self.lblordernumber.text = "Order # :".localized + " \(SuccessRespons.data?.orderNumber ?? "")"
                
                let string = SuccessRespons.data?.createdAt
                let dateFormatter = DateFormatter()
                let tempLocale = dateFormatter.locale // save locale temporarily
                dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                let date = dateFormatter.date(from: string!)!
                dateFormatter.dateFormat = "d MMM yyyy"//"dd-MM-yyyy"//"MMM d, yyyy" ; //"dd-MM-yyyy HH:mm:ss"
                dateFormatter.locale = tempLocale // reset the locale --> but no need here
                let dateString = dateFormatter.string(from: date)
                
                self.lbldate.text = "Date:".localized + " \(dateString)"
                print("EXACT_DATE : \(dateString)")
                
                
                
                self.accceptedtableView.reloadData()
            }else{
                SKActivityIndicator.dismiss()
                self.alertMessage(message: SuccessRespons.message!, completionHandler: nil)
            }
            
        }, Falioure: {(error)in
            SKActivityIndicator.dismiss()
             self.alertMessage(message: error.message, completionHandler: nil)
        })
        
    }
    
    

    
    
    

}


extension VCAcceptedQuotDetail: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return acceptedDetail.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let collection = self.acceptedDetail[section]
       
        let basicRows = collection.basicService?.questions?.count ?? 0
        let additionalRows = collection.additionalServices?.count ?? 0
        return basicRows + additionalRows + 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let collection = acceptedDetail[indexPath.section]
        
        if(indexPath.row == 0){
            return 70
        }else if(indexPath.row <= (collection.basicService?.questions!.count)!){
            return 60
        }
        else if(indexPath.row <= (collection.basicService?.questions!.count)! + 1){
            return 60
        }else if (indexPath.row <= (collection.basicService?.questions!.count)! + 2){
            
            return 60
        }else  if(indexPath.row <= collection.additionalServices!.count + (collection.basicService?.questions!.count)! + 2){
            
            return 50
        }else{
            return 60
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let collection = acceptedDetail[indexPath.section]
        
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "AcceptedbasicserviceHeaderCell") as? AcceptedbasicserviceHeaderCell
            cell?.selectionStyle = .none
            return cell!
        }
        else if(indexPath.row <= (collection.basicService?.questions!.count)!){
            let inx = indexPath.row - 1
            let cell = tableView.dequeueReusableCell(withIdentifier: "acceptedBasicQuestionCell") as? acceptedBasicQuestionCell
            cell?.lblquestion.text = collection.basicService?.questions![inx].title
            if collection.basicService?.questions![inx].answer1 != nil{
                cell?.lblanswer.text = collection.basicService?.questions![inx].answer1
            }else{
                  cell?.lblanswer.text = collection.basicService?.questions![inx].answer?.title
            }
            cell?.selectionStyle = .none
            return cell!
        }
        else if(indexPath.row <= (collection.basicService?.questions!.count)! + 1){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "acceptedBacisPriceCell") as? acceptedBacisPriceCell
            cell?.selectionStyle = .none
            if AppUserDefault.shared.currency == "usd"{
                    let somevalue = String(format:"%.2f",collection.basicAmount?.usd?.amount ?? 0)
                    cell?.lblbasicprice.text = "\(collection.basicAmount?.usd?.symbol ?? "") \(somevalue)"
            }else{
                let somevalue = String(format:"%.2f",collection.basicAmount?.aed?.amount ?? 0)
                cell?.lblbasicprice.text = "\(collection.basicAmount?.aed?.symbol ?? "") \(collection.basicAmount?.aed?.amount ?? 0)"
            }
            return cell!
            
        }
        else if (indexPath.row <= (collection.basicService?.questions!.count)! + 2){
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "acceptedAdditionalHeaderCell") as? acceptedAdditionalHeaderCell
            cell?.selectionStyle = .none
            return cell!
        }
        else if(indexPath.row <= collection.additionalServices!.count + (collection.basicService?.questions!.count)! + 2){
            let adinx = indexPath.row - (collection.basicService?.questions!.count)! - 3
            let cell = tableView.dequeueReusableCell(withIdentifier: "acceptedadditionalServicesCell") as? acceptedadditionalServicesCell
            cell?.loadCell(object: collection.additionalServices![adinx])
           
            cell?.selectionStyle = .none
            return cell!
            
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "acceptedAdditionalTotaoPriceCell") as? acceptedAdditionalTotaoPriceCell
            if AppUserDefault.shared.currency == "usd"{
                
                for item in collection.additionalServices ?? [] {
                    if(item.status == "selected"){
                        self.totalValue = self.totalValue + (item.charges?.usd!.amount)!
                    }
                    
                }
                
                let sumvalue =  self.totalValue +  (collection.basicAmount?.usd!.amount)!
                let somevalue = String(format:"%.2f",sumvalue)
                cell?.lbltotalPrice.text = "Total Price :".localized
                
                cell?.lblprice.text = "\(collection.basicAmount?.usd?.symbol ?? "") \(somevalue)"
            
        }else{
                for item in collection.additionalServices ?? [] {
                    if(item.status == "selected"){
                        self.totalValue = self.totalValue + Double((item.charges?.aed!.amount) ?? 0)
                    }
                    
                }
                let sumvalue =  self.totalValue +  Double( collection.basicAmount?.aed?.amount ?? 0)
                let somevalue = String(format:"%.2f",sumvalue)
                cell?.lbltotalPrice.text = "Total Price :".localized
                
                cell?.lblprice.text = "\(collection.basicAmount?.aed?.symbol ?? "") \(somevalue)"
                
            }
            cell?.selectionStyle = .none
            return cell!
        }
        
       
    }
    
    
    
    
    
}

