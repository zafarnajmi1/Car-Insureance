//
//  VCDeriverInformation.swift
//  CarInsurance
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  DropDown
import  NVActivityIndicatorView
import SKActivityIndicatorView
class VCDeriverInformation: UIViewController, NVActivityIndicatorViewable {
    //MARK:- OutLet
    var InsuranseStepVehical: InsuranceRegisterSteps?
    var datePicker = UIDatePicker()
    var UaeLicenceDate = UIDatePicker()
    var UAELicenseImg: UIImage?
    var cemeraimg = UIImagePickerController()
    var galleryimage = UIImagePickerController()
    var params : PostParams?
    var socketImageUrl = ""
    var imgId = ""
    var imgindex = 0
    var insuranceName = ""
    @IBOutlet weak var driverTableView: UITableView!
    var nationalityDropDown = DropDown()
    var UaeLicenceDropDown = DropDown()
    var attachementSelectedIndex : IndexPath!
    @IBOutlet weak var oneView: UIView!
    
    @IBOutlet weak var threeView: UIView!
    
    @IBOutlet weak var twoView: UIView!
    
    @IBOutlet weak var lbldriverInfo: UILabel!
    
    @IBOutlet weak var btntwo: UIButton!
    
    @IBOutlet weak var btnone: UIButton!
    
    @IBOutlet weak var btnthree: UIButton!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var RoundView: UIView!
    
    @IBOutlet weak var lblProgress: UILabel!
    
    var fromStepOne : Bool = false
    var fromSteptwo : Bool = false
    var fromStepThree : Bool = false
    
    @IBOutlet weak var btnnext: UIButton!
    
    var questionListDataArray = [QuestionListData]()
    var questionarray = [Questions]()
    var optionArrayCarMake = [Options]()
    var optionArrayCarModel = [Options]()
    var modelChild = [Children]()
    var ChildernArray = [Children]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
         self.RoundView.setroundUiView()
        self.btnnext.setcornerButton(Corner: 10)
        if(fromStepOne == true){
            btnone.isEnabled = true
        }else if(fromSteptwo == true){
            self.questionarray = AppUserDefault.shared.questionListArray[1].questions!
            btntwo.isEnabled = true
        }else if(fromStepThree == true){
            btnthree.isEnabled =  true
        }else{
            self.GetQuestionApiCall()
            //self.questionarray =  ShareData.sahreinfo.questionListArray[1].questions!
        }
        
        
        
         self.driverTableView.register(UINib.init(nibName: "DriveDropwDownSectionCell", bundle: nil), forCellReuseIdentifier: "DriveDropwDownSectionCell")
         self.driverTableView.register(UINib.init(nibName: "DriveTextSectionCell", bundle: nil), forCellReuseIdentifier: "DriveTextSectionCell")
         self.driverTableView.register(UINib.init(nibName: "DriverImageFileSectionCell", bundle: nil), forCellReuseIdentifier: "DriverImageFileSectionCell")
         self.driverTableView.register(UINib.init(nibName: "DriverDateSectionCell", bundle: nil), forCellReuseIdentifier: "DriverDateSectionCell")
         self.driverTableView.register(UINib.init(nibName: "DriverButtonSectionCell", bundle: nil), forCellReuseIdentifier: "DriverButtonSectionCell")
         self.driverTableView.register(UINib.init(nibName: "DriverNumberCell", bundle: nil), forCellReuseIdentifier: "DriverNumberCell")
         self.driverTableView.register(UINib.init(nibName: "DriverRadioButton", bundle: nil), forCellReuseIdentifier: "DriverRadioButton")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setDriverInfoView()
        btnnext.setTitle("Next".localized, for: .normal)
        lbldriverInfo.text = "Driver Details".localized
    }
    
    
    
    //GeQuestionApiCall
    func GetQuestionApiCall(){
        self.questionarray.removeAll()
        self.questionarray = AppUserDefault.shared.questionListArray[1].questions!
        self.lbldriverInfo.text = AppUserDefault.shared.questionListArray[1].title
        self.driverTableView.reloadData()
//        userhandler.getQuestionListUser(Success: {(SuccessResponse)in
//            if(SuccessResponse.success!){
//                self.questionarray.removeAll()
//                self.optionArrayCarMake.removeAll()
//                self.questionListDataArray.removeAll()
//                self.questionListDataArray = SuccessResponse.data!
//
//                 self.questionarray  = self.questionListDataArray[1].questions!
//                 self.lbldriverInfo.text = self.questionListDataArray[1].title
//                self.driverTableView.reloadData()
//                ShareData.sahreinfo.questionListArray = SuccessResponse.data!
//
//            }
//
//        }, Falioure: {(error)in
//
//        })
//
        
    }
    
    
    @IBAction func steponeAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
//        if let navVC = self.navigationController {
//            let views = navVC.viewControllers as Array
//            for controller in views {
//                if controller.isKind(of: VCVehicalInformation.self) {
//                    navVC.popToViewController(controller, animated: true)
//                    return
//                }
//            }
//        }
        
        
    }
    
    
    @IBAction func stepTwoAction(_ sender: UIButton) {
        
    }
    
    @IBAction func stepThreeAction(_ sender: UIButton) {
        
        if driverCheckData() {
            self.moveOnNext()
        }
        else{
            params?.isSecondFormCompleted = nil
        }
//        if let navVC = self.navigationController {
//            let views = navVC.viewControllers as Array
//            for controller in views {
//                if controller.isKind(of: VCClaimDetail.self) {
//                    navVC.popToViewController(controller, animated: true)
//                    return
//                }
//            }
//        }
        
//        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "VCClaimDetail") as? VCClaimDetail
//        vc?.fromStepThree = true
//        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    func setDriverInfoView(){
        
        self.addBackButton()
//        if (myDefaultLanguage == .en){
//            
//        }else{
//            addArabicBackButton()
//        }
        self.setNavigationBar()
        self.title = insuranceName
         self.oneView.setroundUiView()
        self.twoView.setroundUiView()
        self.threeView.setroundUiView()
        
        
        
        
        
    }
    
    
    
    func PickImag()
    {
        let alert = UIAlertController(title: "Please Select an Option".localized, message: "", preferredStyle: .actionSheet)
        
        let Gallry = UIAlertAction(title: "Photo Library".localized, style: .default){ (Picimg) in self.GalleryPic()
        }
        let camraimg = UIAlertAction(title: "Camera".localized, style: .default){ (ac) in self.cemeraPic()
        }
        let cancel = UIAlertAction(title: "Cancel".localized, style: .cancel){(action) in self.cancel()
            
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
    
    
    func moveOnNext(){
    let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "VCClaimDetail") as? VCClaimDetail
    
       //vc?.InsuranseStepVehical = self.InsuranseStepVehical
        params?.isSecondFormCompleted = true
        vc?.params = params
        vc?.insuranceName = self.insuranceName
       
    self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    
    @IBAction func drivenextAction(_ sender: UIButton) {
        
        if driverCheckData() {
            self.moveOnNext()
            
            
        }
        else{
            params?.isSecondFormCompleted = nil
        }
    }
    
    
    func driverCheckData()-> Bool{
        
        for  question2 in  self.questionarray[0...]{
            
            
            if(question2.isRequired == true){
                if(question2.questionType == "datepicker"){
                    
                    
                    
                    if question2.answerText == nil{
                        self.alertMessage(message: "Please Fill This Field: \(question2.title ?? "")".localized, completionHandler: nil)
                        return false
                    }
                    
                    
                }else if(question2.questionType == "select"){
                    
                    
                    if question2.selectedAns == nil{
                        self.alertMessage(message: "Please Fill This Field: \(question2.title ?? "")".localized, completionHandler: nil)
                        return false
                        
                        
                    }
                    
                    
                    
                }else if(question2.questionType == "text" ){
                    
                    
                    if question2.answerText == nil{
                        self.alertMessage(message: "Please Fill This Field: \(question2.title ?? "")".localized, completionHandler: nil)
                        return false
                    }
                    
                }else if(question2.questionType == "file" ){
                    
                    
                    if question2.imageURL == nil{
                        self.alertMessage(message: "Please Fill This Field: \(question2.title ?? "")".localized, completionHandler: nil)
                        return false
                    }
                    
                    
                }else if(question2.questionType == "number"){
                    if question2.answerText == nil{
                        self.alertMessage(message: "Please Fill This Field: \(question2.title ?? "")".localized, completionHandler: nil)
                        return false
                    }
                }else if(question2.questionType == "radio"){
                    if question2.yesNo == nil {
//                    if question2.yes == nil && question2.no == nil{
                        self.alertMessage(message: "Please Fill This Field: \(question2.title ?? "")".localized, completionHandler: nil)
                        return false
                    }
                    
                }
                
            }
        }
        
        return true
    }
    
    
    
    
}
extension VCDeriverInformation : UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let img =  (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!

        
        
            self.UAELicenseImg = img
       
        SocketEventManager.shared.uploadImage(image: img) { [weak self] (result) in
            self?.progressView.isHidden = false
            
            switch result {
                
            case .progress(let value):
                print(value)
                self?.lblProgress.text = "\(Int(value))%"
            //self.progressLabel.text = "\(Int(value))%"
            case .path(let fileName):
                self?.progressView.isHidden = true
                print(fileName)
                self?.socketImageUrl = fileName
                self!.questionarray[((self?.imgindex)!)].imageURL = self?.socketImageUrl
                self!.params?.params.updateValue(self!.socketImageUrl, forKey: self!.imgId)
                
                let cell = self?.driverTableView.cellForRow(at: self!.attachementSelectedIndex) as?  DriverImageFileSectionCell
                cell?.lblimageName.text = fileName
            case .failure(let errorMsg):
                self?.progressView.isHidden = true
                self?.alertMessage(message: errorMsg, completionHandler: {
                    
                })
                
            }
            
        }
        


        dismiss(animated: true, completion: nil)
    }


}
extension VCDeriverInformation: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
            print(self.questionarray.count)
        return self.questionarray.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        let object = questionarray[indexPath.row]
        
        if(object.questionType == "select"){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DriveDropwDownSectionCell") as? DriveDropwDownSectionCell
            cell!.loadDriverCellDropdown(object: object)
            cell?.delegate = self
            cell?.params = params
            cell?.selectionStyle = .none
            return cell!
        }else if(object.questionType == "text"){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DriveTextSectionCell") as? DriveTextSectionCell
            
           cell!.loadDriverCellText(object: object)
            cell?.delegate = self
            
            if (object.isRequired ==  false){
                cell?.params?.params.updateValue("", forKey:  object._id ?? "")
            }
            cell?.params = params
            cell?.selectionStyle = .none
            return cell!
            
        }else if(object.questionType == "file"){
            let cell = tableView.dequeueReusableCell(withIdentifier: "DriverImageFileSectionCell") as? DriverImageFileSectionCell
            cell?.degelegate = self
             
            cell!.loadDriverCellImage(object: object)
            if (object.isRequired ==  false){
                cell?.params?.params.updateValue("", forKey:  object._id ?? "")
            }
            cell?.params = params
            cell?.selectionStyle = .none

            return cell!
            
        }else if (object.questionType == "datepicker"){
            let cell = tableView.dequeueReusableCell(withIdentifier: "DriverDateSectionCell") as? DriverDateSectionCell
            
            cell!.loadDriverCellDate(object: object)
            if (object.isRequired ==  false){
                cell?.params?.params.updateValue("", forKey:  object._id ?? "")
            }
            if(object.answerText != nil ){
                cell?.txtdrivedate.text = object.answerText
            }
            cell?.params = params
            cell?.delegate = self
            cell?.selectionStyle = .none
            return cell!
        }else if (object.questionType == "number") {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DriverNumberCell") as? DriverNumberCell
            cell!.loadDriverCellnumber(object: object)
            cell?.delegate = self
            if (object.isRequired ==  false){
                cell?.params?.params.updateValue("", forKey:  object._id ?? "")
            }
            cell?.params = params
            cell?.selectionStyle = .none
            return cell!
            
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DriverRadioButton") as? DriverRadioButton
            cell?.loadcellRadio(object: object)
            cell?.delegate = self
            if (object.isRequired ==  false){
                cell?.params?.params.updateValue("", forKey:  object._id ?? "")
            }
            cell?.params = params
            cell?.selectionStyle = .none
            return cell!
            
        }
        
        
        
        
    }
    
    
    
    
    
}
extension VCDeriverInformation:driveButtonProtocol{
    func nextActionButton(cell: DriverButtonSectionCell) {
        self.moveOnNext()
    }
    
    
}
extension VCDeriverInformation:driverprotocol{
    func getmyimage(cell: DriverImageFileSectionCell) {
        let indx = driverTableView.indexPath(for: cell)
        self.imgId = self.questionarray[(indx?.row)!]._id!
        self.imgindex = indx!.row
          self.attachementSelectedIndex = indx
        
        self.PickImag()
        
        //self.params?.params.updateValue(self.socketImageUrl, forKey: self.questionarray[(indx?.row)!]._id!)
    }
    
    
}
extension VCDeriverInformation:DriverDateProtocol{
    func driverdateget(cell: DriverDateSectionCell) {
         let indx = driverTableView.indexPath(for: cell)
        self.questionarray[(indx?.row)!].answerText = cell.txtdrivedate.text
        self.params?.params.updateValue(cell.dateISOFormate, forKey: self.questionarray[(indx?.row)!]._id!)
    }
    
    
}
extension VCDeriverInformation:DriverDropDownProtocool{
    func mydriverProctocol(cell: DriveDropwDownSectionCell, index: Int) {
        let indx = driverTableView.indexPath(for: cell)
        print(index)
        self.questionarray[(indx?.row)!].options![index].selectedAns = index
        
        self.params?.params.updateValue(self.questionarray[(indx?.row)!].options![index]._id!, forKey: questionarray[indx!.row]._id!)
        
    }
    
    
    
}
extension VCDeriverInformation:drivernumberprotocool{
    func mydrivernumber(cell: DriverNumberCell) {
        let indx = driverTableView.indexPath(for: cell)
        self.questionarray[(indx?.row)!].answerText = cell.txtFild.text
        
         self.params?.params.updateValue(cell.txtFild.text!, forKey: questionarray[indx!.row]._id!)
    }
    
    
}
extension VCDeriverInformation: drivertextProtocool{
    func mydriverText(cell: DriveTextSectionCell) {
        let indx = driverTableView.indexPath(for: cell)
         self.questionarray[(indx?.row)!].answerText = cell.txtexperinece.text
        self.params?.params.updateValue(cell.txtexperinece.text!, forKey: questionarray[indx!.row]._id!)
        
    }
    
    
}
extension VCDeriverInformation: driverRadioProtocool{
    func mydriverRadio(cell: DriverRadioButton) {
        let indx = driverTableView.indexPath(for: cell)
        if(cell.btnYes.isSelected ==  true){
            
            self.questionarray[(indx?.row)!].yesNo = true
            self.questionarray[(indx?.row)!].answerText = questionarray[(indx?.row)!].options![0].title ?? ""
            self.params?.params.updateValue(questionarray[(indx?.row)!].options![0]._id ?? "", forKey: questionarray[indx!.row]._id!)
        }else{
            self.questionarray[(indx?.row)!].yesNo = false
            self.questionarray[(indx?.row)!].answerText = questionarray[(indx?.row)!].options![1].title ?? ""
            self.params?.params.updateValue(questionarray[(indx?.row)!].options![1]._id ?? "", forKey: questionarray[indx!.row]._id!)
            
        }
    }
    
    
}
