//
//  VCUserQoutationDetail.swift
//  CarInsurance
//
//  Created by Apple on 7/19/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  NVActivityIndicatorView
import SKActivityIndicatorView
class VCUserQoutationDetail: UIViewController, NVActivityIndicatorViewable {

    @IBOutlet weak var bntsendquote: UIButton!
    @IBOutlet weak var lblcategory: UILabel!
     @IBOutlet weak var lblDateAndOrder: UILabel!
    @IBOutlet weak var userQuotaesDetailTableView: UITableView!
    var orderid = ""
    var orderDate: String?
    var orderNumber: String?
    
    var isfromcompanySent :Bool?
    var userdetailArray = [UserOrderDeatilOrderInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userorderdetailAPiCall()
        userQuotaesDetailTableView.separatorStyle = .none
        userQuotaesDetailTableView.register(UINib.init(nibName: "VehicalHeaderCell", bundle: nil), forCellReuseIdentifier: "VehicalHeaderCell")
        userQuotaesDetailTableView.register(UINib.init(nibName: "VehicalInfoCell", bundle: nil), forCellReuseIdentifier: "VehicalInfoCell")
        
        userQuotaesDetailTableView.register(UINib.init(nibName: "DriverHeaderCell", bundle: nil), forCellReuseIdentifier: "DriverHeaderCell")
        userQuotaesDetailTableView.register(UINib.init(nibName: "DriverInfoCell", bundle: nil), forCellReuseIdentifier: "DriverInfoCell")
        
        userQuotaesDetailTableView.register(UINib.init(nibName: "ClaimHeaderCell", bundle: nil), forCellReuseIdentifier: "ClaimHeaderCell")
        userQuotaesDetailTableView.register(UINib.init(nibName: "ClaimInfoCell", bundle: nil), forCellReuseIdentifier: "ClaimInfoCell")
        
        userQuotaesDetailTableView.register(UINib.init(nibName: "InsuranceHeaderCell", bundle: nil), forCellReuseIdentifier: "InsuranceHeaderCell")
        userQuotaesDetailTableView.register(UINib.init(nibName: "InsuranceInfoCell", bundle: nil), forCellReuseIdentifier: "InsuranceInfoCell")
        
        userQuotaesDetailTableView.register(UINib.init(nibName: "VechalAttachmentCell", bundle: nil), forCellReuseIdentifier: "VechalAttachmentCell")
        
       bntsendquote.setcornerButton(Corner: 10)
         userQuotaesDetailTableView.tableFooterView?.isHidden = true
        
        if ( AppUserDefault.shared.accountType == "5d08c0d814068021482f9d2d"){
            userQuotaesDetailTableView.tableFooterView = nil
        }else{
            if(isfromcompanySent ==  true){
                 userQuotaesDetailTableView.tableFooterView = nil
               
            }
            
        }
        
        if let date = orderDate , let number = orderNumber {
            self.lblDateAndOrder.text = "\(number)\t" + "Date:".localized + " \(date)"
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Detail".localized
        self.setNavigationBar()
        self.addBackButton()
     bntsendquote.setTitle("Send Quote".localized, for: .normal)
    }
    
    
    //MARK:userOrderDetaiApical
    func userorderdetailAPiCall(){
        print(self.orderid)
        let dic : [String:Any] = ["order": self.orderid]
        SKActivityIndicator.show()
        userhandler.userorderdetailget(parameter: dic as NSDictionary , Success: {(SuccessResponse)in
            if(SuccessResponse.success!){
                SKActivityIndicator.dismiss()
                let order = SuccessResponse.data
                self.userdetailArray = order?.orderInfo ?? []
                self.lblcategory.text = order?.category?.title ?? ""
                let number = order?.orderNumber ?? ""
                let date = setDateFormatBy(dateString: order?.createdAt ?? "")
                self.lblDateAndOrder.text = "Order #".localized + " \(number)\t " + "Date:".localized + " \(date)"
               
                self.userQuotaesDetailTableView.tableFooterView?.isHidden = false
                self.userQuotaesDetailTableView.reloadData()
            }else{
                SKActivityIndicator.dismiss()
                self.alertMessage(message: SuccessResponse.message!, completionHandler: {
                    self.navigationController?.popViewController(animated: true)
                })
            }
        }, Falioure: {(errror)in
            SKActivityIndicator.dismiss()
            self.alertMessage(message: errror.message, completionHandler: nil)
            
        })
        
    }
    
    
    @IBAction func sendQuoteAction(_ sender: UIButton) {
        let storyboard =  UIStoryboard.init(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "VCSendQuote") as? VCSendQuote
        vc!.orderid = self.orderid
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
extension VCUserQoutationDetail: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if userdetailArray.count > 0{
             return 8
        }
       return 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.userdetailArray.count != 0){
        if(section == 0){
            return 1
        }else if(section == 1){
            
            if let cnt =  self.userdetailArray[0].questions?.count{
                return cnt
                
            }else
            {
                return 0
            }
            
        }else if(section == 2){
            
            return 1
            
        }else if(section == 3){
            
            if let cnt1 = self.userdetailArray[1].questions?.count{
                return cnt1
                
            }else {
                return 0
            }
        }else if(section == 4){
            return 1
        }else if(section == 5){
            if let cont2 = self.userdetailArray[2].children?[0].questions?.count{
                return cont2
                
            }else {
                return 0
            }
            
        }else if(section == 6){
            return 1
        }else{
          
            if let cnt3 = self.userdetailArray[2].children?[1].questions?.count{
                return cnt3

            }else {
                return 0
            }
        }
    }else{
     return 0
    }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
     if(indexPath.section == 0){
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "VehicalHeaderCell") as? VehicalHeaderCell
             cell?.lblvehicalheader.text = self.userdetailArray[0].title
                cell?.selectionStyle = .none
                return cell!
     }else if(indexPath.section == 1) {
              let object = self.userdetailArray[0].questions
        
        if(object![indexPath.row].questionType == "datepicker"){
               let cell = tableView.dequeueReusableCell(withIdentifier: "VehicalInfoCell") as? VehicalInfoCell
                 cell?.lblquestion.text = object![indexPath.row].title
        let string = object![indexPath.row].answer1
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: string!)!
        dateFormatter.dateFormat = "d MMM yyyy"//"dd-MM-yyyy"//"MMM d, yyyy" ; //"dd-MM-yyyy HH:mm:ss"
        dateFormatter.locale = tempLocale // reset the locale --> but no need here
        let dateString = dateFormatter.string(from: date)
        
        cell?.lblanswer.text = "\(dateString)"
        print("EXACT_DATE : \(dateString)")
        
        
                cell?.selectionStyle = .none
                return cell!
    }else if(object![indexPath.row].questionType == "file"){
            let cell = tableView.dequeueReusableCell(withIdentifier: "VechalAttachmentCell") as? VechalAttachmentCell
            cell?.lblquation.text = object![indexPath.row].title
            cell?.loadcell(path:object![indexPath.row].answer1 ?? "")
            cell?.delegate = self
            //cell?.lblanswer.text = object![indexPath.row].placeholder
            
            cell?.selectionStyle = .none
            return cell!
            
        }else if(object![indexPath.row].questionType == "number"){
            let cell = tableView.dequeueReusableCell(withIdentifier: "VehicalInfoCell") as? VehicalInfoCell
            cell?.lblquestion.text = object![indexPath.row].title
            cell?.lblanswer.text = object![indexPath.row].answer1
            
            cell?.selectionStyle = .none
            return cell!
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "VehicalInfoCell") as? VehicalInfoCell
            cell?.lblquestion.text = object![indexPath.row].title
            cell?.lblanswer.text = object![indexPath.row].answer?.title
            
            cell?.selectionStyle = .none
            return cell!
        }
        
        }else if(indexPath.section == 2){
            
                let cell = tableView.dequeueReusableCell(withIdentifier: "DriverHeaderCell") as? DriverHeaderCell
                    cell?.lbldriverHeader.text = self.userdetailArray[1].title
                cell?.selectionStyle = .none
                return cell!
        
        }else if(indexPath.section == 3){
                let object = self.userdetailArray[1].questions
        if(object![indexPath.row].questionType == "file"){
        
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "VechalAttachmentCell") as? VechalAttachmentCell
            cell?.lblquation.text = object![indexPath.row].title
            cell?.loadcell(path:object![indexPath.row].answer1 ?? "")
            cell?.delegate = self
//                 let cell = tableView.dequeueReusableCell(withIdentifier: "DriverInfoCell") as? DriverInfoCell
//                 cell?.lbldriverquestion.text = object![indexPath.row].title
//                cell?.lbldriverianswer.text = object![indexPath.row].placeholder
                cell?.selectionStyle = .none
                return cell!
        }else if(object![indexPath.row].questionType == "datepicker"){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DriverInfoCell") as? DriverInfoCell
            cell?.lbldriverquestion.text = object![indexPath.row].title
            
            let string = object![indexPath.row].answer1
            let dateFormatter = DateFormatter()
            let tempLocale = dateFormatter.locale // save locale temporarily
            dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let date = dateFormatter.date(from: string!)!
            dateFormatter.dateFormat = "d MMM yyyy"//"dd-MM-yyyy"//"MMM d, yyyy" ; //"dd-MM-yyyy HH:mm:ss"
            dateFormatter.locale = tempLocale // reset the locale --> but no need here
            let dateString = dateFormatter.string(from: date)
            
            cell?.lbldriverianswer.text = "\(dateString)"
            print("EXACT_DATE : \(dateString)")
            cell?.selectionStyle = .none
            return cell!
            
        }else if (object![indexPath.row].questionType == "number"){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DriverInfoCell") as? DriverInfoCell
            cell?.lbldriverquestion.text = object![indexPath.row].title
            cell?.lbldriverianswer.text = object![indexPath.row].answer1
            cell?.selectionStyle = .none
            return cell!
            
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DriverInfoCell") as? DriverInfoCell
            cell?.lbldriverquestion.text = object![indexPath.row].title
            cell?.lbldriverianswer.text = object![indexPath.row].answer?.title
            cell?.selectionStyle = .none
            return cell!
            
            
        }
        
        }else if(indexPath.section == 4){
        
                let cell = tableView.dequeueReusableCell(withIdentifier: "ClaimHeaderCell") as? ClaimHeaderCell
                    cell?.lblclaimheader.text = self.userdetailArray[2].children![0].title
                cell?.selectionStyle = .none
                return cell!
            }else if(indexPath.section == 5){
        
                    let object = self.userdetailArray[2].children![0].questions
                let cell = tableView.dequeueReusableCell(withIdentifier: "ClaimInfoCell") as? ClaimInfoCell
                 cell?.lblclaimQuestions.text = object![indexPath.row].title
                 cell?.lblClaimAnswer.text = object![indexPath.row].answer?.title
                cell?.selectionStyle = .none
                return cell!
                
        
        }else if(indexPath.section == 6){
        
                let cell = tableView.dequeueReusableCell(withIdentifier: "InsuranceHeaderCell") as? InsuranceHeaderCell
                 cell?.lblinsuranceheader.text = self.userdetailArray[2].children![1].title
                cell?.selectionStyle = .none
                return cell!
     }
     else if indexPath.section == 7 {
        
        let object = self.userdetailArray[2].children![1].questions
        let cell = tableView.dequeueReusableCell(withIdentifier: "InsuranceInfoCell") as? InsuranceInfoCell
        cell?.lblinsuranquestions.text = object![indexPath.row].title
        cell?.lblinsurandAnswer.text = object![indexPath.row].answer?.title
        cell?.selectionStyle = .none
        return cell!
        
     }
        else {
             return UITableViewCell()

        }
        
    }
    
    
    
    
}
extension VCUserQoutationDetail: vehicalattachmentShowprotocool{
    func myfilepath(path: String) {
        
    
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VCInsurancePolicyImage") as! VCInsurancePolicyImage
        vc.policyPath = path
        vc.modalPresentationStyle = .currentContext
        vc.providesPresentationContextTransitionStyle = true
        vc.definesPresentationContext = true
        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
        vc.view.backgroundColor = UIColor.init(white: 1.0, alpha: 1.0)
        self.present(vc, animated: true, completion: nil)
        
        
    }
    
    
}
