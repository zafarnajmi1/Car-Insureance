//
//  VCClaimDetail.swift
//  CarInsurance
//
//  Created by Apple on 7/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  DLRadioButton
import  NVActivityIndicatorView
import SKActivityIndicatorView
class VCClaimDetail: UIViewController, NVActivityIndicatorViewable,popProtoocol {
    
let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var cemeraimg = UIImagePickerController()
    var galleryimage = UIImagePickerController()
    var params : PostParams?
    @IBOutlet weak var claimTableView: UITableView!
    var InsuranseStepVehical: InsuranceRegisterSteps?
    
    var socketImageUrl = ""
    var imgId = ""
    var insuranceName = ""
    var attachementSelectedIndex : IndexPath!
    var imgindex = 0
    var selectedsection = 0
    //MARK:- Outlet
    
    @IBOutlet weak var lblProgress: UILabel!
    @IBOutlet weak var roundview: UIView!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var oneUivew: UIView!
    @IBOutlet weak var twoUiview: UIView!
    @IBOutlet weak var threeUiview: UIView!
    
    @IBOutlet weak var btnone: UIButton!
    
    @IBOutlet weak var btntwo: UIButton!
    @IBOutlet weak var btnthree: UIButton!
    
    @IBOutlet weak var btngetQuote: UIButton!
    
    var questionListDataArray = [QuestionListData]()
    var questionarray = [Questions]()
    var optionArrayCarMake = [Options]()
    var optionArrayCarModel = [Options]()
    var modelChild = [Children]()
    var ChildernArray = [Children]()
    var fromStepOne : Bool = false
    var fromSteptwo : Bool = false
    var fromStepThree : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.roundview.setroundUiView()
       //self.InsuranseStepClaimDetail = InsuranceRegisterSteps()
       btngetQuote.setcornerButton(Corner: 10)
        self.addBackButton()
//        if (myDefaultLanguage == .en){
//            
//        }else{
//            addArabicBackButton()
//        }
        self.setNavigationBar()
        
        
        if(fromStepOne == true){
            btnone.isEnabled = true
        }else if(fromSteptwo == true){
            
            btntwo.isEnabled = true
        }else if(fromStepThree == true){
            self.questionarray =  AppUserDefault.shared.questionListArray[2].questions!
            btnthree.isEnabled =  true
        }else{
            self.GetQuestionApiCall()
        }
        
        
        
        self.claimTableView.register(UINib.init(nibName: "ClaimRadioSectionCell", bundle: nil), forCellReuseIdentifier: "ClaimRadioSectionCell")
        self.claimTableView.register(UINib.init(nibName: "InsuranceDetailHeadingSecion", bundle: nil), forCellReuseIdentifier: "InsuranceDetailHeadingSecion")
        self.claimTableView.register(UINib.init(nibName: "CliamButtonSectionCell", bundle: nil), forCellReuseIdentifier: "CliamButtonSectionCell")
        self.claimTableView.register(UINib.init(nibName: "InsuranceDetailRadioSectionCell", bundle: nil), forCellReuseIdentifier: "InsuranceDetailRadioSectionCell")
        self.claimTableView.register(UINib.init(nibName: "ClaimdetailHeadingCell", bundle: nil), forCellReuseIdentifier: "ClaimdetailHeadingCell")
        
        self.claimTableView.register(UINib.init(nibName: "claimTxtCell", bundle: nil), forCellReuseIdentifier: "claimTxtCell")
        
        self.claimTableView.register(UINib.init(nibName: "claimFileCell", bundle: nil), forCellReuseIdentifier: "claimFileCell")
        self.claimTableView.register(UINib.init(nibName: "claimNumberCell", bundle: nil), forCellReuseIdentifier: "claimNumberCell")
        
         self.claimTableView.register(UINib.init(nibName: "claimDatePickerCell", bundle: nil), forCellReuseIdentifier: "claimDatePickerCell")
        
        self.claimTableView.register(UINib.init(nibName: "ClaimDropwDownCell", bundle: nil), forCellReuseIdentifier: "ClaimDropwDownCell")
        
       //claimDatePickerCell
        //ClaimDropwDownCell
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = insuranceName
        self.oneUivew.setroundUiView()
        self.twoUiview.setroundUiView()
        self.threeUiview.setroundUiView()
        btngetQuote.setTitle("Get A Quote".localized, for: .normal)
      
    }
    
    
    
    //GeQuestionApiCall
    func GetQuestionApiCall(){
        self.ChildernArray.removeAll()
        self.ChildernArray = AppUserDefault.shared.questionListArray[2].children!
        self.claimTableView.reloadData()
//        userhandler.getQuestionListUser(Success: {(SuccessResponse)in
//            if(SuccessResponse.success!){
//                self.questionarray.removeAll()
//                self.optionArrayCarMake.removeAll()
//                self.questionListDataArray = SuccessResponse.data!
//
//                self.ChildernArray = self.questionListDataArray[2].children!
//
//                print(self.questionListDataArray[0].children?.count as Any)
//                print(self.ChildernArray[0].questions?.count as Any)
//                self.claimTableView.reloadData()
//                ShareData.sahreinfo.questionListArray = SuccessResponse.data!
//
//            }
//
//        }, Falioure: {(error)in
//
//        })
//
        
    }
    
    @IBAction func stepOneAction(_ sender: UIButton) {
        if let navVC = self.navigationController {
            let views = navVC.viewControllers as Array
            for controller in views {
                if controller.isKind(of: VCVehicalInformation.self) {
                    
                    navVC.popToViewController(controller, animated: true)
                    return
                }
            }
        }
        
    }
    
    @IBAction func StepTwoAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
//        if let navVC = self.navigationController {
//            let views = navVC.viewControllers as Array
//            for controller in views {
//                if controller.isKind(of: VCDeriverInformation.self) {
//                    navVC.popToViewController(controller, animated: true)
//                    return
//                }
//            }
//        }
    }
    
    
//    //MARK:- SendQuotApiCallHere
//    func sendQuotApiCall(){
//       
//        
//        
//        var xparams : [String : Any] = ["category":params?.id ?? ""]
//        
//        var array :  [[String:String]] = []
//        
//        for object in params?.params ?? [:]{
//            
//            let dictionary = ["question" : object.key, "answer" : object.value, "isRequired": "true"]
//            
//            
//            array.append(dictionary as! [String : String])
//            
//        
//        }
//        xparams.updateValue(array,forKey: "orderInfo" )
//        print(xparams)
//        
//        userhandler.userOrderSave(parameter:xparams as NSDictionary, Success: {(SuccessResponse)in
//            SKActivityIndicator.show()
//            if(SuccessResponse.success!){
//                SKActivityIndicator.dismiss()
//                
//                let ordernumber = SuccessResponse.data?.orderNumber
//                let createdAt = SuccessResponse.data?.createdAt
//                let status = SuccessResponse.data?.status
//                let category = SuccessResponse.data?.category
//                let user = SuccessResponse.data?.user
//                
//                self.moveOnQuoteSccess(ordernumber:ordernumber! , Created: createdAt!, Status: status!, category: category!, user: user!)
//            }else{
//                SKActivityIndicator.dismiss()
//                self.alertMessage(message: SuccessResponse.message!, completionHandler: nil)
//            }
//            
//            
//        }, Falioure: {(error)in
//            SKActivityIndicator.dismiss()
//            self.alertMessage(message: error.message, completionHandler: nil)
//            
//            
//        })
//        
//        
//    }
    
    
    
    
    
    
    
    
    
//    func moveOnQuoteSccess(ordernumber: String, Created: String, Status: String, category: String, user: String){
//        
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VCQuotSuccessFully") as! VCQuotSuccessFully
//        vc.category = category
//        vc.user = user
//        vc.createdAt =  Created
//        vc.status = Status
//        
//        vc.modalPresentationStyle = .currentContext
//        vc.providesPresentationContextTransitionStyle = true
//        vc.definesPresentationContext = true
//        vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
//        vc.view.backgroundColor = UIColor.init(white: 0.4, alpha: 0.8)
//        self.present(vc, animated: true, completion: nil)
//        
//    }
    
    
    
    func PickImag()
    {
        let alert = UIAlertController(title: "Please Select an Option".localized, message: "", preferredStyle: .actionSheet)
        
        let Gallry = UIAlertAction(title: "Photo Library", style: .default){ (Picimg) in self.GalleryPic()
        }
        let camraimg = UIAlertAction(title: "Camera", style: .default){ (ac) in self.cemeraPic()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel){(action) in self.cancel()
            
        }
        
        alert.addAction(Gallry)
        alert.addAction(camraimg)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }
    func cancel()
    {
        self.galleryimage.dismiss(animated: true, completion: nil)
    }
    
    func cemeraPic()
    {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            cemeraimg.sourceType = .camera
            cemeraimg.delegate = self
            cemeraimg.allowsEditing = false
            present(cemeraimg, animated: true, completion: nil)
        }
        else {
            
            let alert = UIAlertController(title: "Camera".localized, message: "Camera is not available".localized, preferredStyle: .actionSheet)
            let alertaction = UIAlertAction(title: "Cancel".localized, style: .cancel)
            alert.addAction(alertaction)
            present(alert, animated: true, completion: nil)
            
        }
    }
    func GalleryPic()
    {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary))
        {
            galleryimage.delegate = self
            galleryimage.allowsEditing = false
            galleryimage.sourceType = UIImagePickerController.SourceType.photoLibrary
            present(galleryimage, animated: true, completion: nil)
            
        }else{
            
            print("Image is not Available")
            
        }
        
    }
    
    
    
    @IBAction func getquotAction(_ sender: UIButton) {
        
        if claimdataCehck(){
            
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VCConfirmPopUp") as! VCConfirmPopUp
            vc.delegate =  self
            vc.params = self.params
            vc.modalPresentationStyle = .currentContext
            vc.providesPresentationContextTransitionStyle = true
            vc.definesPresentationContext = true
            vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
            vc.view.backgroundColor = UIColor.init(white: 0.9, alpha: 0.9)
            self.present(vc, animated: true, completion: nil)
            
           
            
        }
        
    }
    
    func mypop() {
        popBack(toControllerType: VCVehicalInformation.self)
    }
    
    func myhome() {
       
        appDelegate.moveToUserHome()
    }
    func claimdataCehck()-> Bool{
        
        for  childern0 in ChildernArray[0].questions!{
            if childern0.isRequired == true{
            if(childern0.questionType == "radio"){
                    
//                if(childern0.yes == nil && childern0.no == nil){
                if(childern0.yesNo == nil ){
                    self.alertMessage(message: "Please Select This Field: \(childern0.title ?? "")", completionHandler: nil)
                    return false
                }
                
            } else if childern0.questionType == "text" {
                
                if childern0.answerText == nil{
                    self.alertMessage(message: "Please Fill This Field: \(childern0.title ?? "")", completionHandler: nil)
                    return false
                }
            }else if childern0.questionType == "number" {
                
                if childern0.answerText == nil{
                    self.alertMessage(message: "Please Fill This Field: \(childern0.title ?? "")", completionHandler: nil)
                    return false
                }
            }else if childern0.questionType == "file" {
                
                if childern0.imageURL == nil{
                    self.alertMessage(message: "Please Fill This Field: \(childern0.title ?? "")", completionHandler: nil)
                    return false
                }//object.questionType == "select"
            }else if childern0.questionType == "datepicker" {
                
                if childern0.answerText == nil{
                    self.alertMessage(message: "Please Fill This Field: \(childern0.title ?? "")", completionHandler: nil)
                    return false
                }
            }else if childern0.questionType == "select" {
                
                if childern0.selectedAns == nil{
                    self.alertMessage(message: "Please Fill This Field: \(childern0.title ?? "")", completionHandler: nil)
                    return false
                }
                }
        }
            
        }
        
        for  childern1 in ChildernArray[1].questions!{
            if childern1.isRequired == true{
                if(childern1.questionType == "radio"){
                    
//                    if(childern1.yes == nil && childern1.no == nil){
                    if(childern1.yesNo == nil){
                        self.alertMessage(message: "Please Select This Field: \(childern1.title ?? "")", completionHandler: nil)
                        return false
                    }
                    
                }else if childern1.questionType == "text" {
                
                if childern1.answerText == nil{
                    self.alertMessage(message: "Please Fill This Field: \(childern1.title ?? "")", completionHandler: nil)
                    return false
                }
            }else if childern1.questionType == "number" {
                
                if childern1.answerText == nil{
                    self.alertMessage(message: "Please Fill This Field: \(childern1.title ?? "")", completionHandler: nil)
                    return false
                }
            }else if childern1.questionType == "file" {
                
                if childern1.imageURL == nil{
                    self.alertMessage(message: "Please Fill This Field: \(childern1.title ?? "")", completionHandler: nil)
                    return false
                }
            }else if childern1.questionType == "datepicker" {
                
                if childern1.answerText == nil{
                    self.alertMessage(message: "Please Fill This Field: \(childern1.title ?? "")", completionHandler: nil)
                    return false
                }
            }else if childern1.questionType == "select" {
                
                if childern1.selectedAns == nil{
                    self.alertMessage(message: "Please Fill This Field: \(childern1.title ?? "")", completionHandler: nil)
                    return false
                }
            }
            
            }}
        
        
        
        return true
    }
    
    
    
    
    
}
extension VCClaimDetail: UITableViewDataSource, UITableViewDelegate{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        if(indexPath.section == 0){
//            return 50
//        }else if(indexPath.section == 1){
//             return 120
//        }else if(indexPath.section == 2){
//            return 60
//        }else {
//            return 110
//        }
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if ChildernArray.count > 0{
                
                    if(section == 0){
                        return 1
                    }else if(section == 1){
                    
                    return self.ChildernArray[0].questions?.count ?? 0
                    }else if(section == 2){
                        return 1
                    }else {
                    
                    return self.ChildernArray[1].questions?.count ?? 0
                    
                }
        }
        else{
            return 0
            
        }
            
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if(indexPath.section == 0) {
            let object = ChildernArray[0].title
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClaimdetailHeadingCell") as? ClaimdetailHeadingCell
           cell?.lblclaimdetailgead.text =  object
            
            cell?.selectionStyle = .none
            return cell!
            
        }else if(indexPath.section == 1){
            
                let object = ChildernArray[0].questions![indexPath.row]
            
                    if(object.questionType == "radio"){

                    let cell = tableView.dequeueReusableCell(withIdentifier: "ClaimRadioSectionCell") as? ClaimRadioSectionCell
                      cell?.lblqeastionHeading.text = object.title
                        cell!.loadCellclaimRadio(object:object)
                        if (object.isRequired ==  false){
                            cell?.params?.params.updateValue("", forKey:  object._id ?? "")
                        }
                        cell?.params = params
                        cell!.delegate = self
                    cell?.selectionStyle = .none
                    return cell!
                }else if object.questionType == "file" {
                    
                    let cell = tableView.dequeueReusableCell(withIdentifier: "claimFileCell") as? claimFileCell
                    cell?.LoadImageCell(objec: object,Section: indexPath.section)
                        if (object.isRequired ==  false){
                            cell?.params?.params.updateValue("", forKey:  object._id ?? "")
                        }
                        cell?.params = params
                        cell?.delegate = self
                    cell?.selectionStyle = .none
                    return cell!
                        
                } else if object.questionType == "number"{
                        
                        let cell = tableView.dequeueReusableCell(withIdentifier: "claimNumberCell") as? claimNumberCell
                        cell?.loadnumberCell(object: object, Section: indexPath.section)
                        if (object.isRequired ==  false){
                            cell?.params?.params.updateValue("", forKey:  object._id ?? "")
                        }
                        cell?.params = params
                        cell?.delegate = self
                        cell?.selectionStyle = .none
                        return cell!
            
             }else if object.questionType == "text" {
                        let cell = tableView.dequeueReusableCell(withIdentifier: "claimTxtCell") as? claimTxtCell
                        cell?.loadTextCell(object: object,Section: indexPath.section)
                        if (object.isRequired ==  false){
                            cell?.params?.params.updateValue("", forKey:  object._id ?? "")
                        }
                        cell?.params = params
                        cell?.delegate = self
                        cell?.selectionStyle = .none
                        return cell!
                        
                    }
                    else if object.questionType == "select" {
                        
                        let cell = tableView.dequeueReusableCell(withIdentifier: "ClaimDropwDownCell") as? ClaimDropwDownCell
                        cell?.loadCellClainDropDown(object: object, section : indexPath.section)
                        if (object.isRequired ==  false){
                            cell?.params?.params.updateValue("", forKey:  object._id ?? "")
                        }
                        cell?.params = params
                        cell?.delegate = self
                        cell?.selectionStyle = .none
                        return cell!
                        
                        
                        
                    }else{
                        let cell = tableView.dequeueReusableCell(withIdentifier: "claimDatePickerCell") as? claimDatePickerCell
                        cell?.LoadDatePickerCell(object: object,Section: indexPath.section)
                        if (object.isRequired ==  false){
                            cell?.params?.params.updateValue("", forKey:  object._id ?? "")
                        }
                        cell?.params = params
                        cell?.delegate = self
                        cell?.selectionStyle = .none
                        return cell!
                        
              }
            
        }else if(indexPath.section == 2){
            
            
                    let cell = tableView.dequeueReusableCell(withIdentifier: "InsuranceDetailHeadingSecion") as? InsuranceDetailHeadingSecion
            
                    cell?.selectionStyle = .none
                    return cell!
            
        }else {
            
                    let object = ChildernArray[1].questions![indexPath.row]
            
                        if(object.questionType == "radio"){
                            
                            let cell = tableView.dequeueReusableCell(withIdentifier: "InsuranceDetailRadioSectionCell") as? InsuranceDetailRadioSectionCell
                            cell!.lblquesyionheading.text = object.title
                            cell!.loadCellInsuranceDetail(object: object)
                            if (object.isRequired ==  false){
                                cell?.params?.params.updateValue("", forKey:  object._id ?? "")
                            }
                            cell?.params = params
                            cell?.delegate = self
                            cell?.selectionStyle = .none
                            return cell!
                        }else if object.questionType == "file" {
                            
                            let cell = tableView.dequeueReusableCell(withIdentifier: "claimFileCell") as? claimFileCell
                            cell?.LoadImageCell(objec: object, Section: indexPath.section)
                            if (object.isRequired ==  false){
                                cell?.params?.params.updateValue("", forKey:  object._id ?? "")
                            }
                            cell?.params = params
                            cell?.delegate = self
                            cell?.selectionStyle = .none
                            return cell!
                            
                        } else if object.questionType == "number"{
                            
                            let cell = tableView.dequeueReusableCell(withIdentifier: "claimNumberCell") as? claimNumberCell
                            cell?.loadnumberCell(object: object, Section: indexPath.section)
                            if (object.isRequired ==  false){
                                cell?.params?.params.updateValue("", forKey:  object._id ?? "")
                            }
                            cell?.params = params
                            cell?.delegate = self
                            cell?.selectionStyle = .none
                            return cell!
                            
                        }else if object.questionType == "text" {
                            let cell = tableView.dequeueReusableCell(withIdentifier: "claimTxtCell") as? claimTxtCell
                            cell?.loadTextCell(object: object, Section: indexPath.section)
                            if (object.isRequired ==  false){
                                cell?.params?.params.updateValue("", forKey:  object._id ?? "")
                            }
                            cell?.params = params
                            cell?.delegate = self
                            cell?.selectionStyle = .none
                            return cell!
                            
                        }else if object.questionType == "select" {
                            
                            let cell = tableView.dequeueReusableCell(withIdentifier: "ClaimDropwDownCell") as? ClaimDropwDownCell
                            cell?.loadCellClainDropDown(object: object, section : indexPath.section)
                            if (object.isRequired ==  false){
                                cell?.params?.params.updateValue("", forKey:  object._id ?? "")
                            }
                            cell?.params = params
                            cell?.delegate = self
                            cell?.selectionStyle = .none
                            return cell!
                            
                            
                            
                        }else {
                            let cell = tableView.dequeueReusableCell(withIdentifier: "claimDatePickerCell") as? claimDatePickerCell
                            cell?.LoadDatePickerCell(object: object, Section: indexPath.section)
                            if (object.isRequired ==  false){
                                cell?.params?.params.updateValue("", forKey:  object._id ?? "")
                            }
                            cell?.params = params
                            cell?.delegate = self
                            cell?.selectionStyle = .none
                            return cell!
                            
            }
            
            
        }
        
    
    }
    
}
extension VCClaimDetail: GetQuotprotocool{
    func submitQuotAction(cell: CliamButtonSectionCell) {
      
    }
    
    
}
extension VCClaimDetail: radiobuttonProtocoll{
    func myradio(cell: ClaimRadioSectionCell) {
         let indx = claimTableView.indexPath(for: cell)
        if(cell.btnYes.isSelected == true){
            
            params?.params.updateValue(ChildernArray[0].questions![(indx?.row)!].options![0]._id!, forKey: ChildernArray[0].questions![(indx?.row)!]._id!)
             ChildernArray[0].questions![(indx?.row)!].yesNo = true
             ChildernArray[0].questions![(indx?.row)!].answerText = ChildernArray[0].questions![(indx?.row)!].options![0].title
        }else{
            ChildernArray[0].questions![(indx?.row)!].yesNo = false
            params?.params.updateValue(ChildernArray[0].questions![(indx?.row)!].options![1]._id!, forKey: ChildernArray[0].questions![(indx?.row)!]._id!)
            ChildernArray[0].questions![(indx?.row)!].answerText = ChildernArray[0].questions![(indx?.row)!].options![1].title
        }
    }
    
    
    
    
}

extension VCClaimDetail: insurancDetalProtocol{
    func myinsuranceDetail(cell: InsuranceDetailRadioSectionCell) {
       let indx = claimTableView.indexPath(for: cell)
        
        //ChildernArray[1].questions
        if(cell.btnYes.isSelected == true){
            ChildernArray[1].questions![(indx?.row)!].yesNo = true
            params?.params.updateValue(ChildernArray[1].questions![(indx?.row)!].options![0]._id!, forKey: ChildernArray[1].questions![(indx?.row)!]._id!)
            ChildernArray[1].questions![(indx?.row)!].answerText = ChildernArray[1].questions![(indx?.row)!].options![0].title
        }else{
            ChildernArray[1].questions![(indx?.row)!].yesNo = false
            params?.params.updateValue(ChildernArray[1].questions![(indx?.row)!].options![1]._id!, forKey: ChildernArray[1].questions![(indx?.row)!]._id!)
            ChildernArray[1].questions![(indx?.row)!].answerText = ChildernArray[1].questions![(indx?.row)!].options![1].title
        }
    }

    
}

extension VCClaimDetail:  getclaimImageProtocol{
    func myimage(cell: claimFileCell, mysection: Int) {
        
        if mysection == 1 {
             let indx = claimTableView.indexPath(for: cell)
            self.PickImag()
            self.selectedsection = mysection
            self.attachementSelectedIndex = indx
            self.imgId = ChildernArray[0].questions![(indx?.row)!]._id ?? ""
            self.imgindex = indx!.row
            
            print(self.imgId)
            
        }else{
            
            let indx = claimTableView.indexPath(for: cell)
            self.PickImag()
            self.selectedsection = mysection
            self.attachementSelectedIndex = indx
            self.imgId = ChildernArray[1].questions![(indx?.row)!]._id ?? ""
            self.imgindex = indx!.row
            
            print(self.imgId)
            
        }
    }

    
}
extension VCClaimDetail:  claimnumberfoprotocol{
    func mynumberClaim(cell: claimNumberCell, Section: Int) {
        
        if Section == 1 {
            let indx = claimTableView.indexPath(for: cell)
            
           ChildernArray[0].questions![(indx?.row)!].answerText = cell.txtnumbervalue.text!
            
            params?.params.updateValue(cell.txtnumbervalue.text!, forKey:  self.ChildernArray[0].questions![(indx?.row)!]._id!)
            
        }else{
            
            let indx = claimTableView.indexPath(for: cell)
            
            ChildernArray[1].questions![(indx?.row)!].answerText = cell.txtnumbervalue.text!
            
            params?.params.updateValue(cell.txtnumbervalue.text!, forKey:  self.ChildernArray[1].questions![(indx?.row)!]._id!)
            
        }
    }
    
    
    
    
}

extension VCClaimDetail:  claimtxtfoprotocol{
    func mytxtClaim(cell: claimTxtCell, Section: Int) {
        if Section == 1 {
            let indx = claimTableView.indexPath(for: cell)
            
            ChildernArray[0].questions![(indx?.row)!].answerText = cell.txtvalue.text!
            
            params?.params.updateValue(cell.txtvalue.text!, forKey:  self.ChildernArray[0].questions![(indx?.row)!]._id!)
            
        }else{
            
            let indx = claimTableView.indexPath(for: cell)
            
            ChildernArray[1].questions![(indx?.row)!].answerText = cell.txtvalue.text!
            
            params?.params.updateValue(cell.txtvalue.text!, forKey:  self.ChildernArray[1].questions![(indx?.row)!]._id!)
            
        }
    }

    
}

extension VCClaimDetail:  claimDateProtocol{
    func myclaimdate(cell: claimDatePickerCell, Section: Int) {
        if Section == 1 {
            let indx = claimTableView.indexPath(for: cell)
            print(cell.dateISOFormate)
            ChildernArray[0].questions![(indx?.row)!].answerText =  cell.txtclaimdate.text! //cell.dateISOFormate
            params?.params.updateValue(cell.dateISOFormate, forKey:   self.ChildernArray[0].questions![(indx?.row)!]._id!)
        }else{
            
            let indx = claimTableView.indexPath(for: cell)
            print(cell.dateISOFormate)
             ChildernArray[1].questions![(indx?.row)!].answerText =  cell.txtclaimdate.text! //cell.dateISOFormate
            params?.params.updateValue(cell.dateISOFormate, forKey:     self.ChildernArray[1].questions![(indx?.row)!]._id!)
        }
    }
    

    
}
extension VCClaimDetail : UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let img =  (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
        
        
        
        
        SocketEventManager.shared.uploadImage(image: img) { [weak self] (result) in
            SKActivityIndicator.show()
            self?.progressView.isHidden = false
            switch result {
                
            case .progress(let value):
                print(value)
                self?.lblProgress.text = "\(Int(value))%"
            //self.progressLabel.text = "\(Int(value))%"
            case .path(let fileName):
                self?.progressView.isHidden = true
                print(fileName)
                self!.socketImageUrl = fileName
                
                
                if self?.selectedsection == 1{
                    
                    self?.ChildernArray[0].questions?[(self!.imgindex)].imageURL = self?.socketImageUrl
                    
                            self?.params!.params.updateValue( self?.socketImageUrl ?? "", forKey:  self?.imgId ?? "")

                            let cell = self?.claimTableView.cellForRow(at: self!.attachementSelectedIndex) as?  claimFileCell
                            cell?.lblimagename.text = fileName
                }else {
                    
                    self?.ChildernArray[1].questions?[(self!.imgindex)].imageURL = self?.socketImageUrl
                    
                    self?.params!.params.updateValue( self?.socketImageUrl ?? "", forKey:  self?.imgId ?? "")
                    
                    let cell = self?.claimTableView.cellForRow(at: self!.attachementSelectedIndex) as?  claimFileCell
                    cell?.lblimagename.text = fileName
                }
            case .failure(let errorMsg):
                self?.progressView.isHidden = true
                
                self?.alertMessage(message: errorMsg, completionHandler: {
                    
                })
            }
            
        }
        
        
        dismiss(animated: true, completion: nil)
    }
    

}
extension  VCClaimDetail : claimdropdownprotocool{
    func myclaimdropdown(cell: ClaimDropwDownCell, ind: Int, Section: Int) {
        
        if Section == 1{
           let indx = claimTableView.indexPath(for: cell)
            
            self.params?.params.updateValue(self.ChildernArray[0].questions?[(indx?.row)!].options![ind]._id ?? "", forKey: self.ChildernArray[0].questions?[(indx?.row)!]._id ?? "")
        }else{
            
            let indx = claimTableView.indexPath(for: cell)
            
            self.params?.params.updateValue(self.ChildernArray[1].questions?[(indx?.row)!].options![ind]._id ?? "", forKey: self.ChildernArray[1].questions?[(indx?.row)!]._id ?? "")
            
        }
    }
    
//    func myclaimdropdown(cell: ClaimDropwDownCell, ind: Int) {
//
//        func mydriverProctocol(cell: DriveDropwDownSectionCell, index: Int) {
//            let indx = driverTableView.indexPath(for: cell)
//            print(index)
//            self.questionarray[(indx?.row)!].options![index].selectedAns = index
//
//            self.params?.params.updateValue(self.questionarray[(indx?.row)!].options![index]._id!, forKey: questionarray[indx!.row]._id!)
//
//        }
//
//    }
//
    
    
    
    
}
