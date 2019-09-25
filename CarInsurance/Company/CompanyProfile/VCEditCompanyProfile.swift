//
//  VCEditCompanyProfile.swift
//  CarInsurance
//
//  Created by Apple on 8/30/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import  NVActivityIndicatorView
import  SDWebImage
import  GooglePlaces
import  GooglePlacePicker
import LocationPicker
import SKActivityIndicatorView

class VCEditCompanyProfile: UIViewController, NVActivityIndicatorViewable {
    @IBOutlet weak var userImage: UIImageView!
   
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var lblorganizationNameEn: UILabel!
    
    @IBOutlet weak var UiViewEnName: UIView!
    
    @IBOutlet weak var txtorganizationNameEn: UITextField!
    
    @IBOutlet weak var lblorganizationNameAR: UILabel!
    
    @IBOutlet weak var txtorganizationNameAR: UITextField!
    
    @IBOutlet weak var UiviewArName: UIView!
    
    @IBOutlet weak var lblemail: UILabel!
    
    @IBOutlet weak var txtemail: UITextField!
    
    @IBOutlet weak var uiviewEmail: UIView!
    
    @IBOutlet weak var lblPhone: UILabel!
    
    @IBOutlet weak var txtphonumber: UITextField!
    
    @IBOutlet weak var UiviewPhonumber: UIView!
    
    @IBOutlet weak var lbladdress: UILabel!
    
    @IBOutlet weak var txtaddress: UITextField!
    
    @IBOutlet weak var UiviewAddress: UIView!
    
    @IBOutlet weak var lblDeatilEn: UILabel!
    
    @IBOutlet weak var UiviewDetailEn: UIView!
    
    @IBOutlet weak var txtDeatilEn: UITextView!
    
    @IBOutlet weak var lblDeatilAr: UILabel!
    
    @IBOutlet weak var uiviewDetailAr: UIView!
    
    @IBOutlet weak var txtDetailAr: UITextView!
    
    @IBOutlet weak var lbltermsEnd: UILabel!
    
    @IBOutlet weak var UiviewTermsEn: UIView!
    
    @IBOutlet weak var txtTermsEn: UITextView!
    
    @IBOutlet weak var lbltermsAr: UILabel!
    @IBOutlet weak var UiviewTermsAr: UIView!
    
    @IBOutlet weak var txtTermsAr: UITextView!
    
    @IBOutlet weak var btnsave: UIButton!
    
    var selectedImage: String?
    
    var cemeraimg = UIImagePickerController()
    var galleryimage = UIImagePickerController()
    
    var updatedImage: UIImage?
    
    var lat = 0.0
    var long = 0.0
    
    
    var location: Location?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        self.addBackButton()

        self.txtaddress?.delegate = self
        txtTermsAr.delegate = self
        txtTermsAr.textColor = UIColor.lightGray
        txtTermsAr.text = "Terms & Conditions (Arabic)"
        txtTermsAr.textColor = #colorLiteral(red: 0.5566827655, green: 0.5607631207, blue: 0.5648422837, alpha: 1)
        txtTermsAr.font = UIFont(name: "JosefinSans-Regular", size: 18)
    
        txtTermsEn.delegate = self
        txtTermsEn.textColor = UIColor.lightGray
        txtTermsEn.text = "Terms & Conditions (English)"
        txtTermsEn.textColor = #colorLiteral(red: 0.5566827655, green: 0.5607631207, blue: 0.5648422837, alpha: 1)
        txtTermsEn.font = UIFont(name: "JosefinSans-Regular", size: 18)
        
        
        txtDetailAr.delegate = self
        txtDetailAr.textColor = UIColor.lightGray
        txtDetailAr.text = "Detail (Arabic)"
        txtDetailAr.textColor = #colorLiteral(red: 0.5566827655, green: 0.5607631207, blue: 0.5648422837, alpha: 1)
        txtDetailAr.font = UIFont(name: "JosefinSans-Regular", size: 18)
        
        txtDeatilEn.delegate = self
        txtDeatilEn.textColor = UIColor.lightGray
        txtDeatilEn.text = "Detail (English)"
        txtDeatilEn.textColor = #colorLiteral(red: 0.5566827655, green: 0.5607631207, blue: 0.5648422837, alpha: 1)
        txtDeatilEn.font = UIFont(name: "JosefinSans-Regular", size: 18)
        
        updateProfileUI()
       // location = nil
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Edit Profile".localized
         self.userImage.setRoundimage()
        self.uiviewEmail.setcornerUiview(Corner: 10)
        self.uiviewDetailAr.setcornerUiview(Corner: 10)
        self.UiviewArName.setcornerUiview(Corner: 10)
        self.UiviewAddress.setcornerUiview(Corner: 10)
        self.UiViewEnName.setcornerUiview(Corner: 10)
        self.UiviewDetailEn.setcornerUiview(Corner: 10)
        self.UiviewTermsAr.setcornerUiview(Corner: 10)
        self.UiviewTermsEn.setcornerUiview(Corner: 10)
        self.UiviewPhonumber.setcornerUiview(Corner: 10)
        self.btnsave.setcornerButton(Corner: 10)
        self.setLoaclization()
    }
    
    func setLoaclization(){
        
        let tfs = [txtemail,txtaddress, txtphonumber,txtorganizationNameAR,txtorganizationNameEn] as! [UITextField]
        AppLanguage.updateTextFieldsDirection(tfs)
        
        
        let txtView = [txtTermsAr,txtTermsEn,txtDeatilEn,txtDetailAr ] as! [UITextView]
        AppLanguage.updateTextViewsDirection(txtView)
        
        lblorganizationNameAR.text = "Organization Name : (Arabic)".localized
        lblorganizationNameEn.text = "Organization Name : (English)".localized
        lblemail.text = "Email".localized
        lblPhone.text = "Phone No".localized
        lbladdress.text  = "Address".localized
        lblDeatilEn.text = "Detail (English)".localized
        lblDeatilAr.text = "Detail (Arabic)".localized
        lbltermsAr.text = "Terms & Conditions (Arabic)".localized
        lbltermsEnd.text = "Terms & Conditions (English)".localized
        btnsave.setTitle("Save".localized, for: .normal)
    }
    
    //MARK:GetProfile
    fileprivate func updateProfileUI() {
        let compay = AppUserDefault.shared.userData
        let path = compay?.image?.resizeImage(width: 200, height: 200)
        self.userImage.setPath(string: path, "UserImage")
        
        
        self.txtorganizationNameEn.text = compay?.orgnizationTitleEn
        self.txtorganizationNameAR.text = compay?.orgnizationTitleAr
        self.txtemail.text = compay?.email
        self.txtaddress.text = compay?.address
        self.txtphonumber.text = compay?.phone
        self.txtDeatilEn.text  = compay?.detailEn
        self.txtDetailAr.text  = compay?.detailAr
        self.txtTermsEn.text = compay?.termsConditionEn
        self.txtTermsAr.text = compay?.termsConditionAr
        self.lat = (compay?.location![0]) ?? 0
        self.long = (compay?.location![1]) ?? 0
       
    }
    
    func requestToFetchProfile(){
        
        userhandler.getUserProfile(Success: {(rootProfile)in
            
            if(rootProfile.success!){
                
                AppUserDefault.shared.userData = rootProfile.data
                self.updateProfileUI()
            }else{
                
                self.alertMessage(message: rootProfile.message!, completionHandler: nil)
            }
            
        }, Falioure: {(error)in
            
            self.alertMessage(message: error.message, completionHandler: nil)
            
        })
        
        
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
    
    
    
    
    func isValidProfileForm() -> Bool{
        if(self.txtorganizationNameEn.text == ""){
            self.alertMessage(message: "Please Enter Organization Name In English!".localized, completionHandler: nil)
            return false
        }else if((txtorganizationNameEn.text!.count < 3) || (txtorganizationNameEn.text!.count > 30) ){
            self.alertMessage(message: " English Name Must be  3 to 30 Characters".localized, completionHandler: nil)
            return false
        }
        else if(self.txtorganizationNameAR.text == ""){
            self.alertMessage(message: "Please Enter Organization Name In Arabic!".localized, completionHandler: nil)
            return false
        }else if((txtorganizationNameAR.text!.count < 3) || (txtorganizationNameAR.text!.count > 30) ){
            self.alertMessage(message: " Arabic Name Must be  3 to 30 Characters".localized, completionHandler: nil)
            return false
        }
        else if(self.txtphonumber.text == ""){
            self.alertMessage(message: "Please Enter The Phone Number!".localized, completionHandler: nil)
            return false
        }else if(validateMobileNumber(value: txtphonumber.text!)){
            self.alertMessage(message: "Please Enter The Valid Phone Number!".localized, completionHandler: nil)
            return false
        }else if(txtphonumber.text!.count < 4) || (txtphonumber.text!.count > 16){
            self.alertMessage(message: "Please Enter The Valid Phone Number!".localized, completionHandler: nil)
            return false
        }
        else if(self.txtemail.text == ""){
            self.alertMessage(message: "Please Enter Email!".localized, completionHandler: nil)
            return false
        }else if((txtemail.text!.count > 128)){
            self.alertMessage(message: "Please Enter Valid Email".localized, completionHandler: nil)
            return false
        }else if(self.txtemail.text!.isValidEmail1 == false){
            self.alertMessage(message: "Please Enter Valid Email".localized, completionHandler: nil)
            return false
        }
         else if(self.txtTermsAr.text.count < 15){
            self.alertMessage(message: "Terms and Conditions in Arabic  Length is Too  Short!".localized, completionHandler: nil)
            return false
        }
        else if(self.txtTermsAr.text == ""){
            self.alertMessage(message: "Please Enter Terms And Conditions in Arabic!".localized, completionHandler: nil)
            return false
        }
        else if(self.txtTermsEn.text.count < 15){
            self.alertMessage(message: "Terms and Conditions in English  Length is Too  Short!".localized, completionHandler: nil)
            return false
        }
        else if(self.txtTermsEn.text == ""){
            self.alertMessage(message: "Please Enter English Terms And Conditions!".localized, completionHandler: nil)
            return false
        }
        else if(self.txtDeatilEn.text.count < 15){
            self.alertMessage(message: "Detail in English  Length is Too  Short!".localized, completionHandler: nil)
            return false
        }
        else if(self.txtDeatilEn.text == ""){
            self.alertMessage(message: "Please Enter The Detail In English!".localized, completionHandler: nil)
            return false
        }
        else if(self.txtDetailAr.text.count < 15){
            self.alertMessage(message: "Detail in Arabic  Length is Too  Short!".localized, completionHandler: nil)
            return false
        }
        else if(self.txtDetailAr.text == ""){
            self.alertMessage(message: "Please Enter The Detail In Arabic!".localized, completionHandler: nil)
            return false
        }
        else if(self.txtaddress.text == ""){
            self.alertMessage(message: "Please Enter Address".localized, completionHandler: nil)
            return false
        }
        
        
        return true
    }
    
    //MARK: editProfile ApiCall
    func editProfileCompany(){
        
        //"image": self.imgurl
        let location = [self.lat, self.long]
        var dic : [String:Any] = ["location": location,
                                  "orgnizationTitleEn": txtorganizationNameEn.text!,
                                  "orgnizationTitleAr":txtorganizationNameAR.text!,
                                  "email":txtemail.text!,
                                  "phone":txtphonumber.text!,
                                  "detailEn":txtDeatilEn.text!,
                                  "detailAr":txtDetailAr.text!,
                                  "termsConditionEn":txtTermsEn.text!,
                                  "termsConditionAr":txtTermsAr.text!,
                                  "address":txtaddress.text!,
                                  "_id":AppUserDefault.shared.userId!]
        
        if let path = selectedImage {
            dic.updateValue(path, forKey: "image")
        }
        
        userhandler.updatecompanyProfile(parameter: dic as NSDictionary , Success: {(rootProfile)in
            self.progressLabel.isHidden = true
            SKActivityIndicator.dismiss()
            if(rootProfile.success!){
                self.alertMessage(message: rootProfile.message!, completionHandler: {
                    AppUserDefault.shared.isUpdatedCompany =  true
                    AppUserDefault.shared.userData = rootProfile.data
                    self.navigationController?.popViewController(animated: true)
                })
            }
            else{
                SKActivityIndicator.dismiss()
                self.alertMessage(message: rootProfile.message!, completionHandler: nil)
                
                let compay = AppUserDefault.shared.userData
                let path = compay?.image?.resizeImage(width: 200, height: 200)
                self.userImage.setPath(string: path, "UserImage")
            }
            
        }, Falioure: {(error)in
            SKActivityIndicator.dismiss()
          self.alertMessage(message: error.message, completionHandler: nil)
            
            let compay = AppUserDefault.shared.userData
            let path = compay?.image?.resizeImage(width: 200, height: 200)
            self.userImage.setPath(string: path, "UserImage")
            
        })
        
    }
    
    
    
    
    
    @IBAction func editAction(_ sender: UIButton) {
        self.selectedImage = nil
        self.PickImag()
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        if isValidProfileForm(){
            if let updatedImage = updatedImage{
                SKActivityIndicator.show()
                SocketEventManager.shared.uploadImage(image: updatedImage) { [weak self] (result) in
                    
                    self?.progressLabel.isHidden = false
                    switch result {
                        
                    case .progress(let value):
                        print(value)
                      self?.progressLabel.text = "\(Int(value))%"
                    case .path(let fileName):
                        self?.progressLabel.isHidden = true
                        SKActivityIndicator.dismiss()
                        print(fileName)
                        self?.selectedImage = fileName
                        self?.editProfileCompany()
                    case .failure(let errorMsg):
                        self?.progressLabel.isHidden = true
                        SKActivityIndicator.dismiss()
                        self?.alertMessage(message: errorMsg, completionHandler: {
                            
                        })
                    }
                    
                }
            }
            else{
                self.editProfileCompany()
            }
            
            //            self.editProfileCompany()
        }
    }
}
extension VCEditCompanyProfile: UITextViewDelegate{
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Terms & Conditions (English)" {
            textView.text = ""
            textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
            textView.font = UIFont(name: "JosefinSans-Regular", size: 18.0)
        }
        else if textView.text == "Terms & Conditions (Arabic)"{
            
            textView.text = ""
            textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
            textView.font = UIFont(name: "JosefinSans-Regular", size: 18.0)
        }
        else if textView.text == "Detail (English)"{
            
            textView.text = ""
            textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
            textView.font = UIFont(name: "JosefinSans-Regular", size: 18.0)
        }
        else if textView.text == "Detail (Arabic)"{
            
            textView.text = ""
            textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
            textView.font = UIFont(name: "JosefinSans-Regular", size: 18.0)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == txtTermsAr {
            if textView.text == ""{
            textView.text = "Terms & Conditions (Arabic)".localized
            textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
            textView.font = UIFont(name: "JosefinSans-Regular", size: 18.0)
            }
        }
        else if textView == txtTermsEn {
            if textView.text == ""{
                textView.text = "Terms & Conditions (English)".localized
                textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
                textView.font = UIFont(name: "JosefinSans-Regular", size: 18.0)
            }
        }
        else if textView == txtDetailAr {
            if textView.text == ""{
                textView.text = "Detail (Arabic)".localized
                textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
                textView.font = UIFont(name: "JosefinSans-Regular", size: 18.0)
            }
        }
        else if textView == txtDeatilEn {
            if textView.text == ""{
                textView.text = "Detail (English)".localized
                textView.textColor = #colorLiteral(red: 0.3449268937, green: 0.348911345, blue: 0.3571794033, alpha: 1)
                textView.font = UIFont(name: "JosefinSans-Regular", size: 18.0)
            }
        }
    }
    
    
    
    
    
    
}
extension VCEditCompanyProfile : UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let img =  (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
    
        userImage.image = img
        updatedImage = img
//        SocketEventManager.shared.uploadImage(image: img) { [weak self] (result) in
//            SKActivityIndicator.show()
//            self?.progressLabel.isHidden = false
//            switch result {
//
//            case .progress(let value):
//                print(value)
//            //self.progressLabel.text = "\(Int(value))%"
//            case .path(let fileName):
//                SKActivityIndicator.dismiss()
//                print(fileName)
//               self?.selectedImage = fileName
//            }
//
//        }
        
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
extension VCEditCompanyProfile: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
//    }
//    func textFieldDidBeginEditing(_ textField: UITextField) {
    
//        self.view.endEditing(true)
//        let config = GMSPlacePickerConfig(viewport: nil)
//        let placePicker = GMSPlacePickerViewController(config: config)
//        placePicker.delegate = self
//        present(placePicker, animated: true, completion: nil)
     
//        txtAddress.resignFirstResponder()
//        txtphonenumber.resignFirstResponder()
//        txtemail.resignFirstResponder()
//        txtlastName.resignFirstResponder()
//        txtfirstName.resignFirstResponder()
//        self.view.endEditing(true)
        let locationPicker = LocationPickerViewController()
       
       

        locationPicker.location = location
        
        locationPicker.searchBarStyle = .prominent
        locationPicker.mapType = .standard
        locationPicker.showCurrentLocationButton = true
        locationPicker.useCurrentLocationAsHint = true
        locationPicker.selectCurrentLocationInitially = true
       
        locationPicker.completion = { location in
            self.lat = location?.coordinate.latitude ?? 0.0
            self.long = location?.coordinate.longitude ?? 0.0
            self.txtaddress.text = location?.address ?? "--"
        }
        navigationController?.pushViewController(locationPicker, animated: true)
        return false
    }
}
//GMSAutocompleteViewControllerDelegate
//extension VCEditCompanyProfile:GMSPlacePickerViewControllerDelegate {
//
//    func placePicker(_ viewController: GMSPlacePickerViewController, didPick place: GMSPlace) {
//        print(place.coordinate.latitude)
//        print(place.coordinate.longitude)
//        self.lat = place.coordinate.latitude
//        self.long = place.coordinate.longitude
//        //        print(place.formattedAddress!)
//
//        if(place.formattedAddress == "" || place.formattedAddress == nil){
//            self.txtaddress.text = "Unknown place Cordinates Selected  ".localized + "  " +  "\(place.coordinate.latitude)" + "  " + "\(place.coordinate.longitude)"
//        }else{
//            self.txtaddress?.text = place.formattedAddress!
//        }
//
//        dismiss(animated: true, completion: nil)
//    }
//
//
//    //    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
//    //
//    //        print(place.coordinate.latitude)
//    //        print(place.coordinate.longitude)
//    //        self.my_lat = "\(place.coordinate.latitude)"
//    //        self.my_long = "\(place.coordinate.longitude)"
//    //        print(place.formattedAddress!)
//    //        self.txtAddress?.text = place.formattedAddress!
//    //        dismiss(animated: true, completion: nil)
//    //
//    //    }
//
//    func placePickerDidCancel(_ viewController: GMSPlacePickerViewController) {
//
//        viewController.dismiss(animated: true, completion: nil)
//
//        print("No place selected")
//    }
//
//        func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
//
//            print("Error: ", error.localizedDescription)
//        }
//
//        func wasCancelled(_ viewController: GMSAutocompleteViewController) {
//            dismiss(animated: true, completion:nil )
//        }
//
//
//        func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
//            UIApplication.shared.isNetworkActivityIndicatorVisible = true
//        }
//
//
//        func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
//            UIApplication.shared.isNetworkActivityIndicatorVisible = false
//        }
//
//        func viewController(_ viewController: GMSAutocompleteViewController, didSelect prediction: GMSAutocompletePrediction) -> Bool {
//            dismiss(animated: true, completion: nil)
//            return true
//        }
//
//
//}
