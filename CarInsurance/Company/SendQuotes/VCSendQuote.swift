//
//  VCSendQuote.swift
//  CarInsurance
//
//  Created by Apple on 7/22/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import SKActivityIndicatorView
class VCSendQuote: UIViewController {

    @IBOutlet weak var btsendQuote: UIButton!
    @IBOutlet weak var sendQuotTableView: UITableView!
    @IBOutlet weak var lblbasicinfo: UILabel!
    var additionalServicesArray = [sendquoteQuestionsAddionalService]()
    var basicservicesArray = [sendquoteQuestionsQuestions]()
    var sendquotparams =  sendQuotParams()
    var orderid = ""
    var basicPrice = ""
    var checkbox: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btsendQuote.setcornerButton(Corner: 10)
       self.sendQuotTableView.register(UINib.init(nibName: "ThirdrdpartyCell", bundle: nil), forCellReuseIdentifier: "ThirdrdpartyCell")
        self.sendQuotTableView.register(UINib.init(nibName: "RoadSideCell", bundle: nil), forCellReuseIdentifier: "RoadSideCell")
        self.sendQuotTableView.register(UINib.init(nibName: "BasicPriceSendQouteCell", bundle: nil), forCellReuseIdentifier: "BasicPriceSendQouteCell")
        self.sendQuotTableView.register(UINib.init(nibName: "additionalServicesHeaderSendQuoteCell", bundle: nil), forCellReuseIdentifier: "additionalServicesHeaderSendQuoteCell")
        self.sendQuotTableView.register(UINib.init(nibName: "AdditionalServicesOptionsCell", bundle: nil), forCellReuseIdentifier: "AdditionalServicesOptionsCell")
        self.sendQuotTableView.register(UINib.init(nibName: "btnSendQuoteCell", bundle: nil), forCellReuseIdentifier: "btnSendQuoteCell")
        self.sendQuotTableView.register(UINib.init(nibName: "BasicServicesOptionCell", bundle: nil), forCellReuseIdentifier: "BasicServicesOptionCell")
        self.companysendquotequestions()
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Send Quote".localized
        self.sendQuotTableView.separatorStyle = .none
        self.setNavigationBar()
        self.addBackButton()
        btsendQuote.setTitle("Send Quote".localized, for: .normal)
    }
    
    
    func companysendquotequestions(){
        SKActivityIndicator.show()
        userhandler.sendqutequestioncompany(Success: {(successResponse)in
            SKActivityIndicator.dismiss()
            if(successResponse.success!){
                
                self.additionalServicesArray = successResponse.data!.addionalService!
                self.basicservicesArray = (successResponse.data?.basicService!.questions)!
                self.lblbasicinfo.text = successResponse.data?.basicService?.title
                self.sendQuotTableView.reloadData()
            }else{
                SKActivityIndicator.dismiss()
                self.alertMessage(message: successResponse.message!, completionHandler: nil)
            }
            
        }, Falioure: {(error)in
            SKActivityIndicator.dismiss()
            self.alertMessage(message: error.message, completionHandler: nil)
            
        })
        
    }
    
    
    
    func ischeckData()->Bool{
        
        for item in basicservicesArray {
            
            
            if(item.questionType == "radio"){
                
                if(item.yes == nil && item.no == nil){
                    self.alertMessage(message: "Please Select The One Option:\(item.title ?? "")".localized, completionHandler: nil)
                     return false
                }
            }
            else if(item.questionType == "number"){
                if(item.answerValue ==  nil){
                    self.alertMessage(message: "Please Enter  The Value:\(item.title ?? "")".localized, completionHandler: nil)
                    return false
                }
            }
            
        }
        
        if(basicPrice == ""){
            self.alertMessage(message: "Please Enter  The Basic Price".localized, completionHandler: nil)
            return false
        }
        
        
        
        for additem in additionalServicesArray{
            if(additem.isSelected ==  true && additem.value == ""){
                self.alertMessage(message: "Please Enter  The Value:\(additem.title ?? "")".localized, completionHandler: nil)
                return false
            }
            
        }
        
        return true
    }
    
    
    func sendquotApiCall(){
        
        
        var Bparams : [String:Any] = ["order": self.orderid, "basicPrice": sendquotparams.basicprice ?? ""]
        var array :  [[String:String]] = []
        var arrayB : [[String:String]] = []
        
        for  objectA in sendquotparams.basicparams{
            let   dictA = ["question":objectA.key, "answer": objectA.value]
            
            array.append(dictA as! [String : String])
        }
        
        Bparams.updateValue(array, forKey: "basicServices")
        
        for objectB in sendquotparams.addtionalparams{
            let dictB = ["id":objectB.key, "charges":objectB.value]
            arrayB.append(dictB as! [String : String])
        }
        Bparams.updateValue(arrayB, forKey: "additionalServices")
        
        print(Bparams)
        SKActivityIndicator.show()
        userhandler.companysendqout(parameter: Bparams as NSDictionary, Success: {(Successresponse)in
            SKActivityIndicator.dismiss()
            if(Successresponse.success!){
                self.alertMessage(message: Successresponse.message!, completionHandler: {
                   // self.navigationController?.popViewController(animated: true)
                   
                    
                    let storyboard =  UIStoryboard.init(name: "Main", bundle: nil)
                    
                    let vc = storyboard.instantiateViewController(withIdentifier: "VCCompanyHome") as?  VCCompanyHome//VCSendQuote
                    vc?.isfromQuotation = true
                    self.navigationController?.pushViewController(vc!, animated: true)
                    
//                    let app = UIApplication.shared.delegate as! AppDelegate
//                    app.moveToHome() // company VC root controller
                    
                })
            }else{
                SKActivityIndicator.dismiss()
                self.alertMessage(message: Successresponse.message!, completionHandler: nil)
            }
            
        }, Falioure: {(error)in
            SKActivityIndicator.dismiss()
            self.alertMessage(message: error.message, completionHandler: nil)
            
        })
        
        
        
    }
    
    
    
    @IBAction func sendQoutAction(_ sender: UIButton) {
        
       
        if ischeckData(){
            
            self.sendquotApiCall()
        }
    }
    

}
extension VCSendQuote: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if(indexPath.section == 0){
            return 90
            
        }else if(indexPath.section == 1){
            return 70
        }else if(indexPath.section == 2){
            
            return 60
        }else {
            return 80
        }
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(section == 0){
            
                return self.basicservicesArray.count
        }else if(section == 1){
            
                return 1
                
        }else if(section == 2){
            
                return 1
                
        }else {
            
                return self.additionalServicesArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if(indexPath.section == 0){
            let object = self.basicservicesArray[indexPath.row]
            
            
            if(object.questionType == "radio"){
                
                let cell =  tableView.dequeueReusableCell(withIdentifier: "BasicServicesOptionCell") as? BasicServicesOptionCell
               
                  cell?.basicservecelload(object: object)
                
                 cell?.delegate = self
                  cell?.sendquotparams = sendquotparams
                   cell?.selectionStyle = .none
                    return cell!
                
                
            }else{
                let cell =  tableView.dequeueReusableCell(withIdentifier: "ThirdrdpartyCell") as? ThirdrdpartyCell
                    cell?.lblThirdPrty.text = object.title
                 cell?.delegate = self
                cell!.loadThirdPartycell(object: object)
                cell?.sendquotparams = sendquotparams
                    cell?.selectionStyle = .none
                    return cell!
        
            }
            
        }else if(indexPath.section == 1){
            
            let cell =  tableView.dequeueReusableCell(withIdentifier: "BasicPriceSendQouteCell") as? BasicPriceSendQouteCell
               cell?.selectionStyle = .none
            
              cell?.delegate = self
              cell?.sendquotparams = sendquotparams
                return cell!
        }else if(indexPath.section == 2){
            
            let cell =  tableView.dequeueReusableCell(withIdentifier: "additionalServicesHeaderSendQuoteCell") as? additionalServicesHeaderSendQuoteCell
            
               cell?.selectionStyle = .none
                return cell!
            
        }else {
             let object = additionalServicesArray[indexPath.row]
            let cell =  tableView.dequeueReusableCell(withIdentifier: "AdditionalServicesOptionsCell") as? AdditionalServicesOptionsCell
            
            cell?.loadaddtionaservices(object: object)
            cell?.sendquotparams = sendquotparams
            cell?.delegate = self
           cell?.selectionStyle = .none
            return cell!
            
        }
        
        
    }
    
}
extension VCSendQuote: companyBasicServicesProtocool{
    
    func mybasicservices(cell: BasicServicesOptionCell) {
        let indx = sendQuotTableView.indexPath(for: cell)
        if(cell.btnAvailAble.isSelected ==  true){
            self.basicservicesArray[(indx?.row)!].yes = "Yes"
            sendquotparams.basicparams.updateValue(self.basicservicesArray[(indx?.row)!].options![0]._id ?? "", forKey:self.basicservicesArray[(indx?.row)!]._id ?? "" )
        }else{
            self.basicservicesArray[(indx?.row)!].no = "No"
            sendquotparams.basicparams.updateValue(self.basicservicesArray[(indx?.row)!].options![1]._id ?? 0, forKey:self.basicservicesArray[(indx?.row)!]._id ?? "")
        }
    }
    
    
}
extension VCSendQuote: mybasicpricProtocool{
    func mybasicprice(cell: BasicPriceSendQouteCell) {
        
        let indx = sendQuotTableView.indexPath(for: cell)
        sendquotparams.basicprice = cell.txtbasicprice.text
        self.basicPrice = cell.txtbasicprice.text!
    }
    
    
}
extension VCSendQuote: thirdpartyProtocool{
    func thirdparty(cell: ThirdrdpartyCell) {
        
        let indx = sendQuotTableView.indexPath(for: cell)
        self.basicservicesArray[(indx?.row)!].answerValue = cell.txtprice.text!
        sendquotparams.basicparams.updateValue(cell.txtprice.text!, forKey: self.basicservicesArray[(indx?.row)!]._id ?? "")
    }
    
    
    
}
extension VCSendQuote: addtionalservicesprotocool{
    
    func myAdditionalPrice(cell: AdditionalServicesOptionsCell) {
         let indx = sendQuotTableView.indexPath(for: cell)
        additionalServicesArray[(indx?.row)!].value = cell.txtPrice.text!
        sendquotparams.addtionalparams.updateValue(cell.txtPrice.text!, forKey: additionalServicesArray[(indx?.row)!]._id ?? "")
    }
    
    func myaddtionalservices(cell: AdditionalServicesOptionsCell) {
        
        let indx = sendQuotTableView.indexPath(for: cell)
        let object = additionalServicesArray[indx!.row]
        if(object.isSelected == true){
            checkbox = false
           object.isSelected = true
            additionalServicesArray[(indx?.row)!].value = cell.txtPrice.text!
            
        }else{
            checkbox = true
            object.isSelected = false
            additionalServicesArray[(indx?.row)!].value = ""
            sendquotparams.addtionalparams.removeValue(forKey: additionalServicesArray[(indx?.row)!]._id ?? "")
           
            
        }
    }
    
    
    
    
}
