//
//  VCConfirmPopUp.swift
//  CarInsurance
//
//  Created by Apple on 8/28/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
protocol popProtoocol {
   func mypop()
    func myhome()
}

import SKActivityIndicatorView
class VCConfirmPopUp: UIViewController,successprotocool {
    
    
    var params : PostParams?
    @IBOutlet weak var lbldoyou: UILabel!
    @IBOutlet weak var poptableview: UITableView!
    @IBOutlet weak var btnconfirm: UIButton!
    @IBOutlet weak var btnedit: UIButton!
    var delegate:popProtoocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.poptableview.register(UINib.init(nibName: "vehicleinfiHaderCellPop", bundle: nil), forCellReuseIdentifier: "vehicleinfiHaderCellPop")
        self.poptableview.register(UINib.init(nibName: "VehicleInfoTxtCell", bundle: nil), forCellReuseIdentifier: "VehicleInfoTxtCell")
        self.poptableview.register(UINib.init(nibName: "attachmentVehicleCell", bundle: nil), forCellReuseIdentifier: "attachmentVehicleCell")
        
        
         self.poptableview.register(UINib.init(nibName: "driverinfoHeadercellPop", bundle: nil), forCellReuseIdentifier: "driverinfoHeadercellPop")
        self.poptableview.register(UINib.init(nibName: "drivertxtCellPOP", bundle: nil), forCellReuseIdentifier: "drivertxtCellPOP")
        self.poptableview.register(UINib.init(nibName: "driverattachementCellPOP", bundle: nil), forCellReuseIdentifier: "driverattachementCellPOP")
        
        
        
        self.poptableview.register(UINib.init(nibName: "ClaimDetailheaderCellPOP", bundle: nil), forCellReuseIdentifier: "ClaimDetailheaderCellPOP")
        self.poptableview.register(UINib.init(nibName: "ClaimtxtCellPOP", bundle: nil), forCellReuseIdentifier: "ClaimtxtCellPOP")
        self.poptableview.register(UINib.init(nibName: "InsuranceHeaderCellOPO", bundle: nil), forCellReuseIdentifier: "InsuranceHeaderCellOPO")
        self.poptableview.register(UINib.init(nibName: "InsuranceTxtCellPOP", bundle: nil), forCellReuseIdentifier: "InsuranceTxtCellPOP")
        
        self.btnconfirm.setRoundbutton()
        self.btnedit.setRoundbutton()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        btnedit.setTitle("I want to edit".localized, for: .normal)
        btnconfirm.setTitle("Confirm".localized, for: .normal)
        lbldoyou.text = "Please verify if the details below are correct.".localized
    }

    @IBAction func dismis(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editAction(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        self.delegate?.mypop()
        
    }
    
    @IBAction func conformAction(_ sender: UIButton) {
        
         sendQuotApiCall()
        
    }
    
    
    //MARK:- SendQuotApiCallHere
    func sendQuotApiCall(){
        
        
        
        var xparams : [String : Any] = ["category":params?.id ?? ""]
        
        var array :  [[String:String]] = []
        
        for object in params?.params ?? [:]{
            
            let dictionary = ["question" : object.key, "answer" : object.value, "isRequired": "true"]
            
            
            array.append(dictionary as! [String : String])
            
            
        }
        xparams.updateValue(array,forKey: "orderInfo" )
        print(xparams)
        SKActivityIndicator.show()
        userhandler.userOrderSave(parameter:xparams as NSDictionary, Success: {(SuccessResponse)in
            SKActivityIndicator.dismiss()
            if(SuccessResponse.success!){
                
                
                let ordernumber = SuccessResponse.data?.orderNumber
                let createdAt = SuccessResponse.data?.createdAt
                let status = SuccessResponse.data?.status
                let category = SuccessResponse.data?.category
                let user = SuccessResponse.data?.user
                
                self.moveOnQuoteSccess(ordernumber:ordernumber! , Created: createdAt!, Status: status!, category: category!, user: user!)
            }else{
                SKActivityIndicator.dismiss()
                self.alertMessage(message: SuccessResponse.message!, completionHandler: nil)
            }
            
            
        }, Falioure: {(error)in
            SKActivityIndicator.dismiss()
            self.alertMessage(message: error.message, completionHandler: nil)
            
            
        })
        
        
    }
    
    
    func moveOnQuoteSccess(ordernumber: String, Created: String, Status: String, category: String, user: String){
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VCQuotSuccessFully") as! VCQuotSuccessFully
        vc.category = category
        vc.user = user
        vc.createdAt =  Created
        vc.status = Status
        vc.delegate = self
        vc.modalPresentationStyle = .currentContext
        vc.providesPresentationContextTransitionStyle = true
        vc.definesPresentationContext = true
        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
        vc.view.backgroundColor = UIColor.init(white: 0.4, alpha: 0.8)
        self.present(vc, animated: true, completion: nil)
        
    }
    
    func mysuccess() {
        dismiss(animated: true, completion: nil)
        self.delegate?.myhome()
    }
    
    
}
extension VCConfirmPopUp: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return 8
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if(indexPath.section == 8){
//           return 70
//
//        }else{
//             return 70
//        }
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(section == 0){
            return 1
        }else if(section == 1){
            return AppUserDefault.shared.questionListArray[0].questions!.count
        }else if(section == 2){
            return 1
        }else if(section ==  3){
            return AppUserDefault.shared.questionListArray[1].questions!.count
        }else if(section == 4){
            return 1
            
        }else if(section == 5){
            return AppUserDefault.shared.questionListArray[2].children![0].questions!.count
            
        }else if(section == 6){
            return 1
        }else{
             return AppUserDefault.shared.questionListArray[2].children![1].questions!.count
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "vehicleinfiHaderCellPop") as? vehicleinfiHaderCellPop
            cell?.selectionStyle = .none
            return cell!
        }
        else if(indexPath.section ==  1){
            
                let object = AppUserDefault.shared.questionListArray[0].questions![indexPath.row]
                if(object.questionType == "text" || object.questionType == "number" || object.questionType == "select" || object.questionType == "datepicker" ){
                    let cell = tableView.dequeueReusableCell(withIdentifier: "VehicleInfoTxtCell") as? VehicleInfoTxtCell
                    cell?.lblquestions.text = object.title
                    cell?.lblanswer.text = object.answerText
                    cell?.selectionStyle = .none
                    return cell!
                }else if object.questionType == "file"{
                    
                    
                    let cell = tableView.dequeueReusableCell(withIdentifier: "attachmentVehicleCell") as? attachmentVehicleCell
                    cell?.lblquestion.text = object.title
                    cell?.imagepath = object.imageURL ?? ""
                    print(object.imageURL)
                    cell?.loadcell(imgpath: object.imageURL ?? "")
                    cell?.deleagate = self
                    cell?.selectionStyle = .none
                    return cell!
                }else{
                    
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ClaimtxtCellPOP") as? ClaimtxtCellPOP
                    
                    cell?.lblquestion.text = object.title
                    
                    if object.yesNo ?? false{
                        cell?.lblanswer.text = object.answerText
                    }else{
                        cell?.lblanswer.text = object.answerText
                    }
                    
                    cell?.selectionStyle = .none
                    return cell!
                    
            }
            
        }else if(indexPath.section == 2){
            let cell = tableView.dequeueReusableCell(withIdentifier: "driverinfoHeadercellPop") as? driverinfoHeadercellPop
            cell?.selectionStyle = .none
            return cell!
        }
        else if(indexPath.section ==  3){
            let object = AppUserDefault.shared.questionListArray[1].questions![indexPath.row]
            if(object.questionType == "text" || object.questionType == "number" || object.questionType == "select" || object.questionType == "datepicker"  ){
                
                    let cell = tableView.dequeueReusableCell(withIdentifier: "drivertxtCellPOP") as? drivertxtCellPOP
                     cell?.lblquestion.text = object.title
                     cell?.lblanswer.text = object.answerText
                    cell?.selectionStyle = .none
                    return cell!
            }else if object.questionType == "file"{
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "driverattachementCellPOP") as? driverattachementCellPOP
                   cell?.lblquestions.text = object.title
                cell!.loadcell(imgpath: object.imageURL ?? "")
                cell?.imagepath = object.imageURL ?? ""
                cell!.delegate = self
                cell?.selectionStyle = .none
                return cell!
                
            }else{
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "ClaimtxtCellPOP") as? ClaimtxtCellPOP
                
                cell?.lblquestion.text = object.title
                
                if object.yesNo ?? false{
                    cell?.lblanswer.text = object.answerText
                }else{
                    cell?.lblanswer.text = object.answerText
                }
                
                cell?.selectionStyle = .none
                return cell!
                
            }
        }
        else if(indexPath.section == 4){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClaimDetailheaderCellPOP") as? ClaimDetailheaderCellPOP
            cell?.selectionStyle = .none
            return cell!
        }
        else if(indexPath.section == 5){
            let object = AppUserDefault.shared.questionListArray[2].children![0].questions![indexPath.row]
            
            
            if(object.questionType == "text" || object.questionType == "number" || object.questionType == "select" || object.questionType == "datepicker" ){
                let cell = tableView.dequeueReusableCell(withIdentifier: "VehicleInfoTxtCell") as? VehicleInfoTxtCell
                cell?.lblquestions.text = object.title
                cell?.lblanswer.text = object.answerText
                cell?.selectionStyle = .none
                return cell!
            }else if object.questionType == "file"{
                
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "attachmentVehicleCell") as? attachmentVehicleCell
                cell?.lblquestion.text = object.title
                cell?.imagepath = object.imageURL ?? ""
                print(object.imageURL)
                cell?.loadcell(imgpath: object.imageURL ?? "")
                cell?.deleagate = self
                cell?.selectionStyle = .none
                return cell!
            } else if(object.questionType == "radio"){
                let cell = tableView.dequeueReusableCell(withIdentifier: "ClaimtxtCellPOP") as? ClaimtxtCellPOP
                
                 cell?.lblquestion.text = object.title
               
                if object.yesNo ?? false {
                  cell?.lblanswer.text = object.answerText
                }else{
                    cell?.lblanswer.text = object.answerText
                }
                
                cell?.selectionStyle = .none
                return cell!
                
            }else{
                return UITableViewCell()
                
            }
            
        }else if(indexPath.section == 6){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "InsuranceHeaderCellOPO") as? InsuranceHeaderCellOPO
            cell?.selectionStyle = .none
            return cell!
            
        }else{
            let object = AppUserDefault.shared.questionListArray[2].children![1].questions![indexPath.row]
            
            if(object.questionType == "text" || object.questionType == "number" || object.questionType == "select" || object.questionType == "datepicker" ){
                let cell = tableView.dequeueReusableCell(withIdentifier: "VehicleInfoTxtCell") as? VehicleInfoTxtCell
                cell?.lblquestions.text = object.title
                cell?.lblanswer.text = object.answerText
                cell?.selectionStyle = .none
                return cell!
            }else if object.questionType == "file"{
                
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "attachmentVehicleCell") as? attachmentVehicleCell
                cell?.lblquestion.text = object.title
                cell?.imagepath = object.imageURL ?? ""
                print(object.imageURL)
                cell?.loadcell(imgpath: object.imageURL ?? "")
                cell?.deleagate = self
                cell?.selectionStyle = .none
                return cell!
            } else if(object.questionType == "radio"){
            let cell = tableView.dequeueReusableCell(withIdentifier: "InsuranceTxtCellPOP") as? InsuranceTxtCellPOP
                cell?.lblquestion.text = object.title
                
                if object.yesNo ?? false{
                    cell?.lblamswer.text = object.answerText
                }else{
                    cell?.lblamswer.text = object.answerText
                }
            cell?.selectionStyle = .none
            return cell!
            }else{
                return UITableViewCell()
                
            }
        }
    
        
    }
    
    
    
    
    
    
}
extension VCConfirmPopUp: showattachmentProtocol{
    
    func showattach(img: String) {
        let basurl = "https://www.projects.mytechnology.ae/car-insurance/assets/temp/" + "\(img )"
        print(basurl)
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VCInsurancePolicyImage") as! VCInsurancePolicyImage
        vc.policyPath = basurl
        vc.modalPresentationStyle = .currentContext
        vc.providesPresentationContextTransitionStyle = true
        vc.definesPresentationContext = true
        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
        vc.view.backgroundColor = UIColor.init(white: 1.0, alpha: 1.0)
        self.present(vc, animated: true, completion: nil)
    }
    
    
   
    
    
    
}
extension VCConfirmPopUp:showdriverAttachment{
    //https://www.projects.mytechnology.ae/car-insurance/assets/temp/EcCn1W2ifzQvmTRImjS8mIuBIEjMO6KQ-1567069036550.png
    
    func driverattachment(img: String) {
        let basurl =  "https://www.projects.mytechnology.ae/car-insurance/assets/temp/" + "\(img )"
       
        print(basurl)
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VCInsurancePolicyImage") as! VCInsurancePolicyImage
        vc.policyPath = basurl
        vc.modalPresentationStyle = .currentContext
        vc.providesPresentationContextTransitionStyle = true
        vc.definesPresentationContext = true
        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
        vc.view.backgroundColor = UIColor.init(white: 1.0, alpha: 1.0)
        self.present(vc, animated: true, completion: nil)
    }
    
    
   
    
    
    
    
}
