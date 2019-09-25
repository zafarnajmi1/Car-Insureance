//
//  VCVehicalInformation.swift
//  CarInsurance
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  DropDown
import  SocketIO

import SKActivityIndicatorView
import  VVCircleProgressBar

class VCVehicalInformation: UIViewController {
    //MARK:- InsuranStepsclass
     @IBOutlet weak var vehicalinformationTableView: UITableView!
    @IBOutlet weak var btnthree: UIButton!
    @IBOutlet weak var btntwo: UIButton!
    @IBOutlet weak var btnnext: UIButton!
    @IBOutlet weak var lblvedhicalinfo: UILabel!
    @IBOutlet weak var oneView: UIView!
    @IBOutlet weak var twoView: UIView!
    @IBOutlet weak var threeView: UIView!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var lblprogress: UILabel!
    @IBOutlet weak var viewRound: UIView!
    
    var attachementSelectedIndex : IndexPath!
    var InsuranseStepVehical: InsuranceRegisterSteps?
    var insuranceId = ""
    var vinnoimage: UIImage?
    var imageUrl : URL!
    var socketImageUrl = ""
    var imgId = ""
    var socketClient: SocketIOClient!
    var soketManger: SocketManager!
    var inuranceCatgory = ""
    
    var vehicalLicenceImage: UIImage?
    var cemeraimg = UIImagePickerController()
    var galleryimage = UIImagePickerController()
    var vechicalLicense = ""
    var imgindex = 0
    
    var params = PostParams()
    let progressBar = VVCircleProgressBar()


    var indexCount = 0
    var questionListDataArray = [QuestionListData]()
    var questionarray = [Questions]()
    var optionArrayCarMake = [Options]()
    var optionArrayCarModel = [Options]()
    var modelChild = [Children]()
    var ChildernArray = [Children]()
    
    var fromStepOne : Bool = false
    var fromSteptwo : Bool = false
    var fromStepThre : Bool = false
    
       var mySelectedImage: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewRound.setroundUiView()
        
        self.btnnext.setcornerButton(Corner: 10)
        self.InsuranseStepVehical = InsuranceRegisterSteps()
    
        //self.btntwo.isEnabled = false
         //self.btnthree.isEnabled = false
        
        if(fromStepOne == true){
            self.btntwo.isEnabled = true
            self.questionarray =  AppUserDefault.shared.questionListArray[0].questions!
            self.vehicalinformationTableView.reloadData()
            
        }else if(fromSteptwo == true){
            self.btnthree.isEnabled = true
        }else{
            self.GetQuestionApiCall()
        }
        
        
        
        
        //MARK:- NibRegisters
        self.vehicalinformationTableView.register(UINib.init(nibName: "DropDownSectionCell", bundle: nil), forCellReuseIdentifier: "DropDownSectionCell")
        
        self.vehicalinformationTableView.register(UINib.init(nibName: "TextSectionCell", bundle: nil), forCellReuseIdentifier: "TextSectionCell")
        
        self.vehicalinformationTableView.register(UINib.init(nibName: "imageSectionCell", bundle: nil), forCellReuseIdentifier: "imageSectionCell")
        
        self.vehicalinformationTableView.register(UINib.init(nibName: "DateSectionCell", bundle: nil), forCellReuseIdentifier: "DateSectionCell")
        
        self.vehicalinformationTableView.register(UINib.init(nibName: "buttonsectionCell", bundle: nil), forCellReuseIdentifier: "buttonsectionCell")
        
         self.vehicalinformationTableView.register(UINib.init(nibName: "mytextSectionCell", bundle: nil), forCellReuseIdentifier: "mytextSectionCell")
        
        self.vehicalinformationTableView.register(UINib.init(nibName: "radioSectionCell", bundle: nil), forCellReuseIdentifier: "radioSectionCell")
        
        //mytextSectionCell //radioSectionCell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setVehicalInfoView()
        lblvedhicalinfo.text = "Vehicle Information".localized
        btnnext.setTitle("Next".localized, for: .normal)
    }
    
    
    
    func setVehicalInfoView(){
        
        self.addBackButton()
//        if (myDefaultLanguage == .en){
//            
//        }else{
//            
//            addArabicBackButton()
//        }
        self.setNavigationBar()
        self.title = inuranceCatgory//"".localized
        self.oneView.setroundUiView()
        self.twoView.setroundUiView()
        self.threeView.setroundUiView()
        
       
        
    }
    
    

    
    //GeQuestionApiCall
    func GetQuestionApiCall(){
        SKActivityIndicator.show()
        userhandler.getQuestionListUser(Success: {(SuccessResponse)in
            
            if(SuccessResponse.success!){
                self.questionarray.removeAll()
                self.optionArrayCarMake.removeAll()
                self.questionListDataArray = SuccessResponse.data!
            
                
                self.questionarray  = self.questionListDataArray[0].questions!
                self.lblvedhicalinfo.text = self.questionListDataArray[0].title
                
                AppUserDefault.shared.questionListArray = SuccessResponse.data!
                self.vehicalinformationTableView.reloadData()
                SKActivityIndicator.dismiss()
            }else{
                 SKActivityIndicator.dismiss()
            }
            
        }, Falioure: {(error)in
             SKActivityIndicator.dismiss()
        })
        
        
    }
  
    @IBAction func steptwoAction(_ sender: UIButton) {
        if checkData(){
            self.moveNext()
        }
//        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "VCDeriverInformation") as? VCDeriverInformation
//        vc?.fromSteptwo = true
//        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func sepThreeAction(_ sender: UIButton) {
        if checkData() {
            if params.isSecondFormCompleted != nil{
                var vcs = navigationController!.viewControllers
                vcs += [nextVC(), nextNextVC()]
                navigationController?.setViewControllers(vcs, animated: true)
            }else{
              alertMessage(message: "Please Fill second form first".localized) {}
            }
        }
        
        
        
        
//        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "VCClaimDetail") as? VCClaimDetail
//        vc?.fromStepThree = true
//        self.navigationController?.pushViewController(vc!, animated: true)
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
    
    
    
 func checkVehicalData()-> Bool{

    
    return true
    }
    
    
   
        
    

    
    func nextVC() -> VCDeriverInformation{
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCDeriverInformation") as! VCDeriverInformation
        vc.params = params
        vc.params?.id = insuranceId
        vc.insuranceName = inuranceCatgory
        return vc
    }
    func nextNextVC() -> VCClaimDetail{
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VCClaimDetail") as! VCClaimDetail
        
        //vc?.InsuranseStepVehical = self.InsuranseStepVehical
        vc.params = params
        vc.insuranceName = inuranceCatgory
        return vc
    }
    
    func moveNext(){

        self.navigationController?.pushViewController(nextVC(), animated: true)
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
      
        if checkData(){
            self.moveNext()
        }
        
    }
    
    
    func checkData()->Bool{
        
        let question1 = questionarray.first
       
        if question1?.questionType == "select"{

            if question1?.selectedAns == nil {

                self.alertMessage(message: "Please Fill This Field : \(question1?.title! ?? "")", completionHandler: nil)
                return false
            }
            else {

                let selectedAns = (question1?.selectedAns)!
                let option = question1!.options![selectedAns]
                if option.selectedAns == nil {
                    let question2 = questionarray[1]
                    self.alertMessage(message: "Please Fill This Field : \(question2.title! )", completionHandler: nil)
                    return false
                }
                else {
                    let selectedAns = (option.selectedAns)!
                    let child = option.children![selectedAns]
                    
                    if child.selectedAns == nil{
                        let question3 = questionarray[2]
                        self.alertMessage(message: "Please Fill This Field : \(question3.title! )", completionHandler: nil)
                        return false
                    }

                }

            }
        }
        
        for item in questionarray[3...]{
           print(item.imageURL)
            if item.isRequired ==  true {
                
                if item.questionType == "text"{
                    
                    if item.answerText == nil || item.answerText == ""{
                        
                        self.alertMessage(message: "Please Fill This Field : \(item.title! )", completionHandler: nil)
                        return false
                        
                    }
                }
                else if item.questionType == "number"{
                    if item.answerText == nil || item.answerText == "" {
                        self.alertMessage(message: "Please Fill This Field : \(item.title! )", completionHandler: nil)
                        return false
                    }
                } else if item.questionType == "file" {
                    
                    if item.imageURL == nil || item.imageURL == "" {
                        self.alertMessage(message: "Please Fill This Field : \(item.title! )", completionHandler: nil)
                        return false
                    }
                    
                    
                }else if item.questionType == "datepicker" {
                    
                    if item.answerText == ""{
                        self.alertMessage(message: "Please Fill This Field : \(item.title! )", completionHandler: nil)
                        return false
                    }
                    
                }else if item.questionType == "select"{
                    if item.selectedAns == nil{
                        self.alertMessage(message: "Please Fill This Field : \(item.title! )", completionHandler: nil)
                        return false
                    }
                }else if(item.questionType == "radio"){
                    if item.yesNo == nil{
//                        if item.yes == nil && item.no == nil{
                        self.alertMessage(message: "Please Fill This Field: \(item.title ?? "")".localized, completionHandler: nil)
                        return false
                    }
                    
                }
                
            }
            
        }
        
        
        return true
    }
    
    
    
}





extension VCVehicalInformation : UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let img =  (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
        
       
        
        
        SocketEventManager.shared.uploadImage(image: img) { [weak self] (result) in
            //SKActivityIndicator.show()
            self?.progressView.isHidden = false
            switch result {

            case .progress(let value):
               print(value)
                self?.lblprogress.text = "\(Int(value))%"
                //self.progressLabel.text = "\(Int(value))%"
            case .path(let fileName):
                 self?.progressView.isHidden = true
                //SKActivityIndicator.dismiss()
                print(fileName)
                self!.socketImageUrl = fileName
                self!.questionarray[(self!.imgindex)].imageURL = self?.socketImageUrl
                self?.params.params.updateValue( self?.socketImageUrl ?? "", forKey:  self?.imgId ?? "")
                let cell = self?.vehicalinformationTableView.cellForRow(at: self!.attachementSelectedIndex) as?  imageSectionCell
                 cell?.lblimgename.text = fileName
            case .failure(let errorMsg):
                self?.progressView.isHidden = true
                //SKActivityIndicator.dismiss()
                self?.alertMessage(message: errorMsg, completionHandler: {
                    
                })
               
            }

        }
        
        
        dismiss(animated: true, completion: nil)
    }
    
    
    func saveFileInDocDirectory(image: UIImage) {
        
        if let savedUrl = FileManager.default.saveFileToDocumentsDirectory(image: image, name: "Myphoto", extention: ".png") {
            print(savedUrl)
//            self.imageUrl = savedUrl
//            print(self.imageUrl!)
        }
    }
    

    
    
    
}

extension VCVehicalInformation: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        
            return 100
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
            
        self.indexCount = self.questionarray.count
            return self.questionarray.count
            
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
            
            let object = questionarray[indexPath.row]
           
        if(object.questionType == "select"){
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DropDownSectionCell") as? DropDownSectionCell
            cell!.btndropwdownsender.tag = indexPath.row
            if indexPath.row == 1 && questionarray[0].selectedAns != nil{
                let index =  questionarray[0].selectedAns
                cell?.loadCellAns(object: questionarray[0].options![index ?? 0], question: object)
                
            }
            else if indexPath.row == 2{
                
                if let selectedAns = questionarray[0].selectedAns{
                    if let selectedOption = questionarray[0].options?[selectedAns] , let selectedOptionIndex = questionarray[0].options?[selectedAns].selectedAns{
                        if let child = selectedOption.children?[selectedOptionIndex]{
                            
                            cell?.loadCellChild(object: child, question: object)
                            
                            
                        }
                        else {
                            cell?.loadCell(object: object)
                           
                        }
                        

                    }
                    else{
                        cell?.loadCell(object: object)
                       
                    }
                    
                }
                else{
                    cell?.loadCell(object: object)
                    
                }
                
            } 
            else{
                
                
                
                cell?.loadCell(object: object)
                
            }
            cell?.params = params
            cell?.delegate = self
            cell?.selectionStyle = .none
            return cell!
        }else if(object.questionType == "text"){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "mytextSectionCell") as? mytextSectionCell
            cell?.loadmyTextCell(object: object)
            
            if (object.isRequired ==  false){
                cell?.params?.params.updateValue("", forKey:  object._id ?? "")
            }
            cell?.params = params
            cell?.delegate = self
            cell?.selectionStyle = .none
            return cell!
            //"number"
        }else if(object.questionType == "number" ){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextSectionCell") as? TextSectionCell
            
            cell?.loadTextCell(object: object)
            
            if(object.answerText != nil ){
                cell?.txtmarketValue.text = object.answerText
            }
            
            if (object.isRequired ==  false){
                cell?.params?.params.updateValue("", forKey:  object._id ?? "")
            }
            cell?.delegate = self
            cell?.params = params
            cell?.selectionStyle = .none
            return cell!
            
        }else if(object.questionType == "file"){
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageSectionCell") as? imageSectionCell
            //self.attachementSelectedIndex = indexPath
            cell?.LoadImageCell(objec: object)
            if (object.isRequired ==  false){
                cell?.params?.params.updateValue("", forKey:  object._id ?? "")
            }
            cell?.params = params
            cell?.selectionStyle = .none
            cell?.delegate = self
            return cell!
            
        }else if (object.questionType == "datepicker"){
            let cell = tableView.dequeueReusableCell(withIdentifier: "DateSectionCell") as? DateSectionCell
            cell?.delegate = self
            cell!.LoadDatePickerCell(object: object)
            
            if (object.isRequired ==  false){
                cell?.params?.params.updateValue("", forKey:  object._id ?? "")
            }
            
            if(object.answerText != nil){
                cell?.txtDatePick.text = object.answerText
            }
            cell?.params = params
            cell?.selectionStyle = .none
            return cell!
        }else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "radioSectionCell") as? radioSectionCell
            cell?.delegate = self
             cell?.loadcellRadio(object:object )
            
            if (object.isRequired ==  false){
                cell?.params?.params.updateValue("", forKey:  object._id ?? "")
            }
             cell?.params = params
            cell?.selectionStyle = .none
            return cell!
        }
        
        
    }

}


extension VCVehicalInformation: HomeProtocol{
    //_ option: Options?, _ question: Questions?, _ children: Children?
    func dropDownSelected() {
        
        self.vehicalinformationTableView.reloadData()
    }
    
    
    func dropDownCall(selectedoption: Options?, index: Int,row: Int) {
//        let indexPathRow:Int = row
//        let indexPosition = IndexPath(row: indexPathRow, section: 0)
//        vehicalinformationTableView.reloadRows(at: [indexPosition], with: .none)
//
//
//        guard let cell = vehicalinformationTableView.cellForRow(at: indexPosition)  as? DropDownSectionCell else  {return}
         //self.vehicalinformationTableView.reloadData()

    }
    
}

extension VCVehicalInformation:getImageProtocol{
    
    func myimage(cell: imageSectionCell) {
        let indx = vehicalinformationTableView.indexPath(for: cell)
        
        self.PickImag()
         self.attachementSelectedIndex = indx
        self.imgId = self.questionarray[(indx?.row)!]._id!
        self.imgindex = indx!.row
        
        print(self.imgId)
        
    }
    
    
    
}
//extension VCVehicalInformation:nextProtocol{
//
//    func nextAction(cell: buttonsectionCell) {
//        //let indx = vehicalinformationTableView.indexPath(for: cell)
//        self.moveNext()
//    }
//
//
//}
extension VCVehicalInformation:DateProtocol{
    func mydate(cell: DateSectionCell) {
       let indx = vehicalinformationTableView.indexPath(for: cell)
        print(cell.dateISOFormate)
        self.questionarray[(indx?.row)!].answerText =  cell.txtDatePick.text! //cell.dateISOFormate
        params.params.updateValue(cell.dateISOFormate, forKey:  self.questionarray[(indx?.row)!]._id!)
        
    }
    
    
}

extension VCVehicalInformation:vechicltextInfoprotocol{
    func mytxtdata(cell: TextSectionCell) {
        let indx = vehicalinformationTableView.indexPath(for: cell)
        
        self.questionarray[(indx?.row)!].answerText = cell.txtmarketValue.text!
        print(self.questionarray[(indx?.row)!]._id!)
        params.params.updateValue(cell.txtmarketValue.text!, forKey:  self.questionarray[(indx?.row)!]._id!)
        
        
    }
    

}
extension VCVehicalInformation: vehicalRadioSectionProtocool
{
    func myradio(cell: radioSectionCell) {
        let indx = vehicalinformationTableView.indexPath(for: cell)
        if(cell.btnyes.isSelected ==  true){
            
            self.questionarray[(indx?.row)!].yesNo = true
            self.questionarray[(indx?.row)!].answerText = questionarray[(indx?.row)!].options![0].title ?? ""
            self.params.params.updateValue(questionarray[(indx?.row)!].options![0]._id ?? "", forKey: questionarray[indx!.row]._id!)
        }else{
            self.questionarray[(indx?.row)!].yesNo = false
            self.questionarray[(indx?.row)!].answerText = questionarray[(indx?.row)!].options![1].title ?? ""
            self.params.params.updateValue(questionarray[(indx?.row)!].options![1]._id ?? "", forKey: questionarray[indx!.row]._id!)
            
        }
        
        
    }
    
    
    
}

extension VCVehicalInformation:vehicaltxtProtocool{
    func myvehicaltxtdata(cell: mytextSectionCell) {
        let indx = vehicalinformationTableView.indexPath(for: cell)
        
        self.questionarray[(indx?.row)!].answerText = cell.txtvalue.text!
        print(self.questionarray[(indx?.row)!]._id!)
        
        
        params.params.updateValue(cell.txtvalue.text!, forKey:  self.questionarray[(indx?.row)!]._id!)
    }
    
   
    
    
}
