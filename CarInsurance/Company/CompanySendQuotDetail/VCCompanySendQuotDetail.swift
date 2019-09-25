//
//  VCCompanySendQuotDetail.swift
//  CarInsurance
//
//  Created by Apple on 8/27/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

import SKActivityIndicatorView
class VCCompanySendQuotDetail: UIViewController {

    @IBOutlet weak var lbldateHeading: UILabel!
    @IBOutlet weak var detailTable: UITableView!
    @IBOutlet weak var btndetail: UIButton!
    @IBOutlet weak var lbldate: UILabel!
    @IBOutlet weak var lblordernumber: UILabel!
   var companyQuotDetail = [companysendQuotDetailQuotes]()
    var totalValue = 0.0
    var orderid = ""
    
    var orderDate: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
         detailTable.register(UINib.init(nibName: "companyBasicServiceHeaderCell", bundle: nil), forCellReuseIdentifier: "companyBasicServiceHeaderCell")
        
         detailTable.register(UINib.init(nibName: "companyBasiceServideQuestionCell", bundle: nil), forCellReuseIdentifier: "companyBasiceServideQuestionCell")
        
         detailTable.register(UINib.init(nibName: "companyBasicPriceCell", bundle: nil), forCellReuseIdentifier: "companyBasicPriceCell")
        
         detailTable.register(UINib.init(nibName: "companyAdditionaServiceHeaderCell", bundle: nil), forCellReuseIdentifier: "companyAdditionaServiceHeaderCell")
        
         detailTable.register(UINib.init(nibName: "companyAddtionalServicesQuestionCell", bundle: nil), forCellReuseIdentifier: "companyAddtionalServicesQuestionCell")
         detailTable.register(UINib.init(nibName: "companyTotalpriceCell", bundle: nil), forCellReuseIdentifier: "companyTotalpriceCell")
          self.getcompanysendQuotDetailApiCall()
        btndetail.setcornerButton(Corner: 10)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Company Quote Detail".localized
        self.addBackButton()
        lbldateHeading.text = "Date:".localized
        btndetail.setTitle("Detail".localized, for: .normal)
    }
    
    
    
    func getcompanysendQuotDetailApiCall(){
        let dic :[String: Any]  = ["order": orderid]
        SKActivityIndicator.show()
        userhandler.companySendQuotDetailget(parameter: dic as NSDictionary, Success: {(SuccessRespoinse)in
            SKActivityIndicator.dismiss()
            if(SuccessRespoinse.success!){
                self.companyQuotDetail = SuccessRespoinse.data!.quotes!
                
                
                self.lblordernumber.text = "Order # :".localized + " \(SuccessRespoinse.data?.orderNumber ?? "")"
                
                let string = SuccessRespoinse.data?.createdAt
                let dateFormatter = DateFormatter()
                let tempLocale = dateFormatter.locale // save locale temporarily
                dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                let date = dateFormatter.date(from: string!)!
                dateFormatter.dateFormat = "d MMM yyyy"//"dd-MM-yyyy"//"MMM d, yyyy" ; //"dd-MM-yyyy HH:mm:ss"
                dateFormatter.locale = tempLocale // reset the locale --> but no need here
                let dateString = dateFormatter.string(from: date)
                self.orderDate = dateString
                self.lbldate.text = "\(dateString)"
                print("EXACT_DATE : \(dateString)")
                
                
                
                self.detailTable.reloadData()
            }else{
                 SKActivityIndicator.dismiss()
                self.alertMessage(message: SuccessRespoinse.message!, completionHandler: nil)
            }
            
            
        }, Falioure: {(error)in
             SKActivityIndicator.dismiss()
            self.alertMessage(message: error.message, completionHandler: nil)
            
        })
        
        
    }
    @IBAction func btnDetailAction(_ sender: UIButton) {
         let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCUserQoutationDetail") as? VCUserQoutationDetail
        vc?.orderid = self.orderid
        vc?.orderNumber = lblordernumber.text
        vc?.orderDate = self.orderDate
        vc?.isfromcompanySent = true
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
}

extension VCCompanySendQuotDetail: UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return companyQuotDetail.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let collection = self.companyQuotDetail[section]
        
        let basicRows = collection.basicService?.questions?.count ?? 0
        let additionalRows = collection.additionalServices?.count ?? 0
        return basicRows + additionalRows + 4
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let collection = companyQuotDetail[indexPath.section]
        
        if(indexPath.row == 0){
            return 80
        }else if(indexPath.row <= (collection.basicService?.questions!.count)!){
            return 65
        }
        else if(indexPath.row <= (collection.basicService?.questions!.count)! + 1){
            return 60
        }else if (indexPath.row <= (collection.basicService?.questions!.count)! + 2){
            
            return 60
        }  else if(indexPath.row <= collection.additionalServices!.count + (collection.basicService?.questions!.count)! + 2){
            
            return 60
        }else{
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let collection = companyQuotDetail[indexPath.section]
        
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "companyBasicServiceHeaderCell") as? companyBasicServiceHeaderCell
            cell?.selectionStyle = .none
            return cell!
        }
        else if(indexPath.row <= (collection.basicService?.questions!.count)!){
            let inx = indexPath.row - 1
            let cell = tableView.dequeueReusableCell(withIdentifier: "companyBasiceServideQuestionCell") as? companyBasiceServideQuestionCell
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
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "companyBasicPriceCell") as? companyBasicPriceCell
            cell?.selectionStyle = .none
            if AppUserDefault.shared.currency == "usd"{
                let somevalue = String(format:"%.2f",collection.basicAmount?.usd?.amount ?? 0)
                cell?.lblprice.text = "\(collection.basicAmount?.usd?.symbol ?? "") \(somevalue)"
            }else{
                let somevalue = String(format:"%.2f",collection.basicAmount?.aed?.amount ?? 0)
                cell?.lblprice.text = "\(collection.basicAmount?.aed?.symbol ?? "") \(collection.basicAmount?.aed?.amount ?? 0)"
            }
            return cell!
            
        }
        else if (indexPath.row <= (collection.basicService?.questions!.count)! + 2){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "companyAdditionaServiceHeaderCell") as? companyAdditionaServiceHeaderCell
            cell?.selectionStyle = .none
            return cell!
        }
        else if(indexPath.row <= collection.additionalServices!.count + (collection.basicService?.questions!.count)! + 2){
            let adinx = indexPath.row - (collection.basicService?.questions!.count)! - 3
            let cell = tableView.dequeueReusableCell(withIdentifier: "companyAddtionalServicesQuestionCell") as? companyAddtionalServicesQuestionCell
            cell?.loadCell(object: collection.additionalServices![adinx])
            
            cell?.selectionStyle = .none
            return cell!
            
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "companyTotalpriceCell") as? companyTotalpriceCell
            if AppUserDefault.shared.currency == "usd"{
//            for item in collection.additionalServices ?? [] {
//                if(item.status == "selected"){
//                    self.totalValue = self.totalValue + (item.charges?.usd!.amount)!
//                }
//
//            }
            
//            let sumvalue =  self.totalValue +  (collection.basicAmount?.usd!.amount)!
//            let somevalue = String(format:"%.2f",sumvalue)
            cell?.lblPrice.text = "Total Price :".localized
            
                let somevalue = String(format:"%.2f",collection.quoteTotalAmount?.usd?.amount ?? 0)
            cell?.lblPrice.text = "\(collection.quoteTotalAmount?.usd?.symbol ?? "") \(somevalue)"
        }else{
                
//                for item in collection.additionalServices ?? [] {
//                    if(item.status == "selected"){
//                        self.totalValue = self.totalValue + Double((item.charges?.aed!.amount ?? 0))
//                    }
//
//                }
//
//                let sumvalue =  self.totalValue +  Double(collection.basicAmount?.aed!.amount ?? 0)
//                let somevalue = String(format:"%.2f",sumvalue)
                cell?.lblPrice.text = "Total Price :".localized
                
                
                cell?.lblPrice.text = "\(collection.quoteTotalAmount?.aed?.symbol ?? "") \(collection.quoteTotalAmount?.aed?.amount ?? 0)"
         }
            cell?.selectionStyle = .none
            return cell!
        }
        
    }
    
    
    
    
}
